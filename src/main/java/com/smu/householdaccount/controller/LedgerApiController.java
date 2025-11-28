package com.smu.householdaccount.controller;

import com.smu.householdaccount.dto.ledger.LedgerSummaryDto.DailySummary;
import com.smu.householdaccount.service.LedgerService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 캘린더 및 차트 데이터 등 JSON API 요청을 전담하는 컨트롤러입니다.
 * @RestController를 사용하여 모든 메서드가 JSON을 반환하도록 보장합니다.
 */
@RestController
@RequestMapping("/api/ledger")
@RequiredArgsConstructor
public class LedgerApiController {

    private final LedgerService ledgerService;

    /**
     * 캘린더 UI에 표시할 월별 일자별 수입/지출 소계 데이터를 JSON으로 반환합니다.
     * (FullCalendar의 events source로 사용됩니다.)
     * URL: /api/ledger/calendar?year=2025&month=10
     */
    @GetMapping("/calendar")
    public ResponseEntity<List<DailySummary>> getCalendarEvents(
            @RequestParam int year,
            @RequestParam int month
    ) {
        // Service에서 계산된 List<DailySummary>를 반환합니다.
        List<DailySummary> dailyStats = ledgerService.getCalendarDailyStats(year, month);
        return ResponseEntity.ok(dailyStats);
    }

    // (기존 LedgerController에 있던 /chart 등의 API도 이쪽으로 옮겨오는 것이 아키텍처상 더 깔끔합니다.)
}