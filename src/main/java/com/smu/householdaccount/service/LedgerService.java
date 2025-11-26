package com.smu.householdaccount.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smu.householdaccount.entity.BudgetGroup;
import com.smu.householdaccount.repository.BudgetGroupRepository;
import com.smu.householdaccount.repository.LedgerRepository;
import com.smu.householdaccount.util.Log;
import com.smu.householdaccount.util.Utility;
import com.smu.householdaccount.web.SafeHttpClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

@Service
public class LedgerService {
    @Value("${exchangerate.api-host}")
    private String host;

    private final LedgerRepository ledgerRepository;
    private final BudgetGroupRepository budgetGroupRepository;

    private final SafeHttpClient http;
    private final ObjectMapper mapper;

    public LedgerService(LedgerRepository ledgerRepository, BudgetGroupRepository budgetGroupRepository, SafeHttpClient http, ObjectMapper mapper) {
        this.ledgerRepository = ledgerRepository;
        this.budgetGroupRepository = budgetGroupRepository;
        this.http = http;
        this.mapper = mapper;
    }

    public Double getExchangeRate(){
        String url = host + "/latest?from=USD&to=KRW";
        HttpHeaders headers = new HttpHeaders();
        String response = http.get(url, headers, String.class);

        JsonNode json = null;
        try {
            json = mapper.readTree(response);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
        return json.get("rates").get("KRW").asDouble();
    }

    /**
     * 사용자의 모든 거래 내역
     */
    public void getLedgerAll(){
        BudgetGroup group = budgetGroupRepository.findById(1l).orElseThrow();
        LocalDate start = LocalDate.of(2025, 8, 1);
        LocalDate end   = LocalDate.of(2025, 8, 31);
        Log.d("데이터 확인", group.toString());
        Log.d("그룹 : " , ledgerRepository.findByGroupAndDateRange(group, start, end).toString());
    }

    /**
     * 월별 사용자의 거래 내역
     */
    public void getMonthLedger(int start_year, int start_month, int end_year, int end_month){
        BudgetGroup group = budgetGroupRepository.findById(1l).orElseThrow();
        LocalDate date_start = LocalDate.of(start_year, start_month, 1);
        LocalDate date_end   = LocalDate.of(end_year, end_month, Utility.endOfMonth(end_year, end_month));
        Log.d("데이터 확인", group.toString());
        Log.d("그룹 : " , ledgerRepository.findByGroupAndDateRange(group, date_start, date_end).toString());
    }
}
