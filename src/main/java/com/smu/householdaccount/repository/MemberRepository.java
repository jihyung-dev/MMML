package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, String> {
}
