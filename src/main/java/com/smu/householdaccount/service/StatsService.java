package com.smu.householdaccount.service;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class StatsService {
    private final RedisTemplate<String, Object> redisTemplate;

    public StatsService(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    public void saveDummyStats() {
        String key = "stats:2025-01:ga:male:20s";

        Map<String, Long> categories = new HashMap<>();
        categories.put("FOOD", 123000L);
        categories.put("SHOPPING", 450000L);

        redisTemplate.opsForValue().set(key, categories);
    }

    public Map<String, Long> getDummyStats() {
        String key = "stats:2025-01:ga:male:20s";

        return (Map<String, Long>) redisTemplate.opsForValue().get(key);
    }
}
