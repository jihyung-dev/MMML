package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.LedgerEntry;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface LedgerEntryRepository extends JpaRepository<LedgerEntry, Long> {
    @Override
    Page<LedgerEntry> findAll(Pageable pageable);
}
