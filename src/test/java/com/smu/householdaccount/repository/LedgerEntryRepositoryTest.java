package com.smu.householdaccount.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class LedgerEntryRepositoryTest {
    @Autowired
    LedgerEntryRepository ledgerEntryRepository;
    @Test
    void findDailySummary() {
        System.out.println(ledgerEntryRepository.findDailySummary(1L, LocalDateTime.now(),LocalDateTime.now()));
    }
}