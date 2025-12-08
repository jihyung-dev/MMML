package com.smu.householdaccount.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.smu.householdaccount.dto.python.AiTrainingResponse;
import com.smu.householdaccount.entity.BudgetGroup;
import com.smu.householdaccount.entity.LedgerEntry;
import com.smu.householdaccount.repository.LedgerRepository;
import com.smu.householdaccount.util.Log;
import com.smu.householdaccount.web.SafeHttpClient;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SchedulerService {
    private final StatsService statsService;
    private final ObjectMapper mapper;
    private final SafeHttpClient safeHttpClient;
    // 학습 요청 여부
    private volatile boolean trainingRequested = false;

    // 완료 처리 여부
    private volatile boolean trainingCompleted = false;

    @Value("${render.render-host}")
    private String renderHost;

    /**
     * 매월 1일 새벽 2시에 지난 달 유저 데이터 Redis에 등록
     */
    @Scheduled(cron = "0 0 2 1 * *")
    @Transactional
    public void calculateLastMonthUserAverage() {
        Log.i("[Scheduler]","서비스 실행");
        YearMonth lastMonth = YearMonth.now().minusMonths(1);

        LocalDateTime start = lastMonth.atDay(1).atStartOfDay();
        LocalDateTime end   = lastMonth.plusMonths(1).atDay(1).atStartOfDay();

        statsService.updateCategoryStats(start, end);
        Log.i("[Scheduler]","서비스 종료");
    }

    /**
     * 매월 1일 새벽 2시에 지난 달 유저 데이터 학습 요청(Python)
     * @return
     */
    @Scheduled(cron = "0 0 2 1 * *") //
    @Transactional
    public void trainAiModelMonthly() {
        if (trainingRequested) {
            return; // ✅ 이미 요청했으면 아무것도 안 함
        }

        Log.i("[Scheduler]", "📘 AI 월간 학습 시작");

        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            String response = safeHttpClient.get(
                    renderHost + "/ai/train-monthly",
                    headers,
                    String.class
            );

            AiTrainingResponse aiResponse =
                    mapper.readValue(response, AiTrainingResponse.class);

            Log.i("[Scheduler]", "AI 월간 학습 요청 완료");
            Log.i("[Scheduler]", aiResponse.toString());

            trainingRequested = true; // 요청 완료 처리

        } catch (Exception e) {
            Log.e("[Scheduler]", "AI 학습 요청 실패", e);
        }
    }

    @Scheduled(cron = "*/10 * * * * *") // 5초
    public void checkAiTrainingStatus() {
        if (!trainingRequested || trainingCompleted) {
            return; // ✅ 아직 요청 안 했거나 이미 처리 완료
        }

        try {
            HttpHeaders headers = new HttpHeaders();

            String res = safeHttpClient.get(
                    renderHost + "/ai/fine-tune/status",
                    headers,
                    String.class
            );

            AiTrainingResponse status =
                    mapper.readValue(res, AiTrainingResponse.class);

            if ("success".equals(status.getStatus())) {
                Log.i("[Scheduler]", "AI 학습 완료 확인");

                // 딱 한 번만 실행할 로직

                trainingCompleted = true; // ✅ 완료 플래그
            }

        } catch (Exception e) {
            Log.e("[Scheduler]", "상태 조회 실패", e);
        }
    }

    private YearMonth lastMonth() {
        return YearMonth.now().minusMonths(1);
    }

    private LocalDateTime startOfLastMonth() {
        YearMonth ym = lastMonth();
        return ym.atDay(1).atStartOfDay();
    }

    private LocalDateTime endOfLastMonth() {
        YearMonth ym = lastMonth();
        return ym.atEndOfMonth().atTime(23, 59, 59);
    }
}
