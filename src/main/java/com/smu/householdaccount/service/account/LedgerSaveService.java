package com.smu.householdaccount.service.account;

import com.smu.householdaccount.dto.CategoryUpdateReq;
import com.smu.householdaccount.entity.account.BudgetGroup;
import com.smu.householdaccount.entity.account.Category;
import com.smu.householdaccount.entity.account.LedgerEntry;
import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.repository.account.BudgetGroupRepository;
import com.smu.householdaccount.repository.account.CategoryRepository;
import com.smu.householdaccount.repository.account.GroupPropertyRepository;
import com.smu.householdaccount.repository.account.LedgerRepository;
import com.smu.householdaccount.repository.common.MemberRepository;
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
    private final GroupPropertyRepository groupPropertyRepository;

    // DB에 저장
    @Transactional
    public void saveMergedLedger(List<CategoryUpdateReq> dtoList, String memberId, Long groupId) {

        Member member = getMember(memberId);
        if (member == null) {
            throw new IllegalArgumentException("Invalid memberId: " + memberId);
        }
        List<BudgetGroup> groups = budgetGroupRepository.findByOwner(member);        // 1) 기존 그룹이 있는지 확인
        BudgetGroup group = null;

        // 그룹 아이디로 1차 검사
        if(groupId != null){
            group = groups.stream().filter(
                    group1 -> group1.getId().equals(groupId)
            ).toList().get(0);
        }

        if (groups.isEmpty()) {
            // 그룹이 여러 개여도 에러 없이 '첫 번째' 그룹(예: 가족 공동 생활비)을 사용
            group = groups.get(0);
        }
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
