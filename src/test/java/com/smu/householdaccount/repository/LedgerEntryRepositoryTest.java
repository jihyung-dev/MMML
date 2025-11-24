package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.LedgerEntry;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@SpringBootTest
class LedgerEntryRepositoryTest {
    @Autowired
    LedgerEntryRepository ledgerEntryRepository;

    @Transactional
    @Test
    void findAll() {
        List<LedgerEntry> LedgerEntrys = ledgerEntryRepository.findAll();
        System.out.println(LedgerEntrys);
    }
    @Transactional
    @Test
    void findAllPage() {
        Pageable pageable= PageRequest.of(0,10, Sort.by("id").descending());
        Page<LedgerEntry> LedgerEntrys = ledgerEntryRepository.findAll(pageable);
        System.out.println(LedgerEntrys.getContent());
    }
}