package com.smu.householdaccount.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;
import java.util.Arrays;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class LedgerRepositoryTest {
    @Autowired
    private LedgerRepository ledgerRepository;
    @Test
    void findByGroupAndDateRange() {
        for( Object[] objects:ledgerRepository.findByGroupAndDateRange2(1L,
                LocalDate.of(2025, 10, 1).atStartOfDay(),
                LocalDate.of(2025, 10, 31).atStartOfDay())){
            System.out.println(Arrays.toString(objects));
        }
    }
}