package com.smu.householdaccount.service.account;

import com.smu.householdaccount.dto.ledger.CategoryStatDto;
import com.smu.householdaccount.dto.ledger.CategoryStatRedisDto;
import com.smu.householdaccount.dto.ledger.CategoryStatsDto;
import com.smu.householdaccount.dto.ledger.GlobalCategoryStatDto;
import com.smu.householdaccount.repository.account.LedgerRepository;
import com.smu.householdaccount.util.Log;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.*;

@Service
public class StatsService {
    private final RedisTemplate<String, Object> redisTemplate; // redis 정보 받아올 객체
    private final LedgerRepository ledgerRepository;

    public StatsService(RedisTemplate<String, Object> redisTemplate, LedgerRepository ledgerRepository) {
        this.redisTemplate = redisTemplate;
        this.ledgerRepository = ledgerRepository;
    }

    public void updateCategoryStats(LocalDateTime start, LocalDateTime end) {

        List<CategoryStatsDto> stats =
                ledgerRepository.getCategoryStats(start, end);

        // ✅ 카테고리별 전체 누적용
        Map<String, BigDecimal> globalSumMap = new HashMap<>();
        Map<String, Long> globalCountMap = new HashMap<>();

        for (CategoryStatsDto s : stats) {

            // ----------------------------
            // 1️⃣ 성별 + 연령대 + 카테고리
            // ----------------------------
            String key = String.format(
                    "category:stats:%s:%d:%s",
                    s.getGender(),
                    s.getAgeGroup(),
                    s.getCategory()
            );

            Map<String, String> map = new HashMap<>();
            map.put("sum",   s.getTotal().toString());
            map.put("avg",   s.getAvgAmount().intValue() + "");
            map.put("count", s.getTxnCount() + "");

            redisTemplate.opsForHash().putAll(key, map);

            // ----------------------------
            // 2️⃣ 글로벌 누적 (중요)
            // ----------------------------
            globalSumMap.merge(
                    s.getCategory(),
                    s.getTotal(),
                    BigDecimal::add
            );

            globalCountMap.merge(
                    s.getCategory(),
                    Long.valueOf(s.getTxnCount()),
                    Long::sum
            );
        }

        // ----------------------------
        // 3️⃣ 카테고리별 "전체 평균" 계산 & 저장
        // ----------------------------
        for (String category : globalSumMap.keySet()) {

            BigDecimal total = globalSumMap.get(category);
            long count = globalCountMap.getOrDefault(category, 0L);

            if (count == 0) continue;

            BigDecimal avg = total.divide(
                    BigDecimal.valueOf(count),
                    0,
                    RoundingMode.HALF_UP
            );

            String globalKey = String.format(
                    "category:stats:global:%s",
                    category
            );

            Map<String, String> globalMap = new HashMap<>();
            globalMap.put("sum", total.toString());
            globalMap.put("avg", avg.toString());
            globalMap.put("count", String.valueOf(count));

            redisTemplate.opsForHash().putAll(globalKey, globalMap);
        }

        Log.d("[Redis]", "카테고리 통계(성별/연령/전체) 저장 완료");
    }

    public CategoryStatDto getStatsFromRedis(String gender, int ageGroup, String category) {
        String key = String.format("category:stats:%s:%d:%s", gender, ageGroup, category);

        Map<Object, Object> map = redisTemplate.opsForHash().entries(key);

        if (map == null || map.isEmpty()) {
            return null;  // 캐시에 없으면 null
        }

        return new CategoryStatDto(
                new BigDecimal(map.get("avg").toString()),
                new BigDecimal(map.get("sum").toString()),
                Integer.parseInt(map.get("count").toString())
        );
    }

    /**
     * 성별, 연령대 별로 구별해서 전체 데이터 호출
     * @return
     */
    public List<CategoryStatRedisDto> getAllCategoryStats() {

        Set<String> keys = redisTemplate.keys("category:stats:*");

        List<CategoryStatRedisDto> list = new ArrayList<>();

        for (String key : keys) {
            String[] p = key.split(":");

            // global 키는 length = 4 이므로 스킵
            if (p.length != 5) continue;

            Map<Object, Object> map = redisTemplate.opsForHash().entries(key);

            list.add(new CategoryStatRedisDto(
                    p[2], // gender
                    Integer.parseInt(p[3]), // ageGroup
                    p[4], // category
                    new BigDecimal(map.get("avg").toString()),
                    new BigDecimal(map.get("sum").toString()),
                    Integer.parseInt(map.get("count").toString())
            ));
        }
        return list;
    }

    /**
     * 전체 통합 데이터(분류 x)
     * @return
     */
    public List<GlobalCategoryStatDto> getGlobalCategoryStats() {

        Set<String> keys = redisTemplate.keys("category:stats:global:*");
        List<GlobalCategoryStatDto> list = new ArrayList<>();

        for (String key : keys) {
            // key = category:stats:global:{categoryName}
            String[] p = key.split(":");
            String categoryName = p[3];

            Map<Object, Object> map = redisTemplate.opsForHash().entries(key);

            list.add(new GlobalCategoryStatDto(
                    categoryName,
                    new BigDecimal(map.get("avg").toString()),
                    new BigDecimal(map.get("sum").toString()),
                    Integer.parseInt(map.get("count").toString())
            ));
        }

        return list;
    }
}
