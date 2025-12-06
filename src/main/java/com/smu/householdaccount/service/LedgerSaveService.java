package com.smu.householdaccount.service;

import com.smu.householdaccount.dto.CategoryUpdateReq;
import com.smu.householdaccount.entity.BudgetGroup;
import com.smu.householdaccount.entity.Category;
import com.smu.householdaccount.entity.LedgerEntry;
import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.repository.BudgetGroupRepository;
import com.smu.householdaccount.repository.CategoryRepository;
import com.smu.householdaccount.repository.LedgerRepository;
import com.smu.householdaccount.repository.MemberRepository;
import com.smu.householdaccount.util.Log;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class LedgerSaveService {

    private final LedgerRepository ledgerRepository;
    private final BudgetGroupRepository budgetGroupRepository;
    private final CategoryRepository categoryRepository;
    private final MemberRepository memberRepository;

    // DB에 저장
    @Transactional
    public void saveMergedLedger(List<CategoryUpdateReq> dtoList, String memberId) {

        Member member = getMember(memberId);
        if (member == null) {
            throw new IllegalArgumentException("Invalid memberId: " + memberId);
        }

        // 1) 기존 그룹이 있는지 확인
        BudgetGroup group = budgetGroupRepository.findByOwner(member)
                .orElseGet(() -> {
                    // 신규 그룹 생성
                    BudgetGroup newGroup = new BudgetGroup();
                    newGroup.setOwner(member);
                    newGroup.setGroupName("기본 가계부");  // 필수
                    newGroup.setCreatedAt(LocalDateTime.now());
                    return budgetGroupRepository.save(newGroup);
                });

        // 2) 카테고리 일괄 로딩
        List<Category> categories = categoryRepository.findByCategoryIdStartingWith("C");
        Map<String, Category> categoryMap = categories.stream()
                .collect(Collectors.toMap(
                        Category::getCategoryId,
                        Function.identity()
                ));

        List<LedgerEntry> entries = new ArrayList<>();

        for (CategoryUpdateReq dto : dtoList) {

            String categoryId = dto.getCategory();
            if (categoryId == null) continue;

            Category category = categoryMap.get(categoryId);
            if (category == null) {
                Log.e("[카테고리 매칭 실패]", categoryId);
                continue;
            }

            LedgerEntry entry = new LedgerEntry();
            entry.setMember(member);
            entry.setCategory(category);
            entry.setGroupId(group);

            entry.setEntryType(dto.getEntryType());
            entry.setPayType(dto.getPayType());
            entry.setCardType(dto.getCardType());
            entry.setEntryAmount(dto.getEntryAmount());
            entry.setCurrency(dto.getCurrency());
            entry.setOccurredAt(LocalDate.parse(dto.getOccurredAt()).atStartOfDay());
            entry.setPlaceOfUse(dto.getPlaceOfUse());
            entry.setMemo(dto.getMemo());
            entries.add(entry);
        }
        ledgerRepository.saveAll(entries);
    }

    public Member getMember(String memberId){
        return memberRepository.findById(memberId).orElse(null);
    }
}
