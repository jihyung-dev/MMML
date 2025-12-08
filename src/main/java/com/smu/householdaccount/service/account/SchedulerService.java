package com.smu.householdaccount.service.account;

import com.smu.householdaccount.repository.account.LedgerRepository;
import com.smu.householdaccount.util.Log;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.YearMonth;

@Component
@RequiredArgsConstructor
public class SchedulerService {
    private final StatsService statsService;
    private final LedgerRepository ledgerRepository;

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
