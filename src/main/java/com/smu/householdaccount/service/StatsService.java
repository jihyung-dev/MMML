package com.smu.householdaccount.service;

import com.smu.householdaccount.dto.ledger.CategoryStatDto;
import com.smu.householdaccount.dto.ledger.CategoryStatRedisDto;
import com.smu.householdaccount.dto.ledger.CategoryStatsDto;
import com.smu.householdaccount.dto.ledger.GlobalCategoryStatDto;
import com.smu.householdaccount.repository.LedgerRepository;
import com.smu.householdaccount.util.Log;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;

@Service
public class StatsService {
    private final RedisTemplate<String, Object> redisTemplate; // redis 정보 받아올 객체
    private final LedgerRepository ledgerRepository;

    public StatsService(RedisTemplate<String, Object> redisTemplate, LedgerRepository ledgerRepository) {
        this.redisTemplate = redisTemplate;
        this.ledgerRepository = ledgerRepository;
    }

    public void updateCategoryStats() {

        List<CategoryStatsDto> stats = ledgerRepository.getCategoryStats();

        for (CategoryStatsDto s : stats) {
            // 성별, 나이별, 카테고리별 저장
            String key = String.format(
                    "category:stats:%s:%d:%s",
                    s.getGender(),
                    s.getAgeGroup(),
                    s.getCategory()
            );

            Map<String, String> map = new HashMap<>();
            map.put("sum",   String.valueOf(s.getTotal()));
            map.put("avg",   String.valueOf(s.getAvgAmount().intValue()));
            map.put("count", String.valueOf(s.getTxnCount()));

            redisTemplate.opsForHash().putAll(key, map);

            // 카테고리 별 전체 평균
            String globalKey = String.format(
                    "category:stats:global:%s",
                    s.getCategory()
            );

            redisTemplate.opsForHash().putAll(globalKey, map);
        }

        Log.d("[Redis]", "데이터 저장 완료");
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
            Map<Object, Object> map = redisTemplate.opsForHash().entries(key);

            String[] p = key.split(":");
            // p[0] = category
            // p[1] = stats
            // p[2] = gender
            // p[3] = ageGroup
            // p[4] = categoryName

            list.add(new CategoryStatRedisDto(
                    p[2], // gender
                    Integer.parseInt(p[3]), // ageGroup
                    p[4], // category
                    new BigDecimal(map.get("avg").toString()), // avg
                    new BigDecimal(map.get("sum").toString()), // sum
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
