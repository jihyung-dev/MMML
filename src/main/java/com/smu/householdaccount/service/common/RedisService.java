package com.smu.householdaccount.service.common;

import com.smu.householdaccount.repository.LedgerRepository;
import com.smu.householdaccount.util.Log;
import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.util.Optional;
import java.util.concurrent.ThreadLocalRandom;
import java.util.concurrent.TimeUnit;

@Service
@RequiredArgsConstructor
public class RedisService {
    private final StringRedisTemplate stringRedisTemplate;
    private final EmailService emailService;

    private static final long EMAIL_VERIFY_TTL = 600; // 10분 (초단위)
    private static final String EMAIL_SUB = "MMML 본인 확인 인증 번호";
    private static final String KEY_PREFIX = "auth:email:";
    private final RedisTemplate<String, Object> redisTemplate;
    private final LedgerRepository ledgerRepository;

    /**
     * 이메일 기준 key 생성
     */
    public String buildKey(String email){
        return KEY_PREFIX + email;
    }

    /**
     * 인증 코드 저장(TTL 10분 적용)
     */
    public void saveEmailAuthCode(String email) throws MessagingException {
        String key = buildKey(email);

        String authCode = generateAuthCode();

        // redis에 값 저장
        redisTemplate.opsForValue().set(
                key,
                authCode,
                EMAIL_VERIFY_TTL,
                TimeUnit.SECONDS
        );

        emailService.sendAuthCode(email, EMAIL_SUB, authCode);
    }

    /**
     * 인증 코드 확인
     * @return
     */
    public Boolean validateAuthCode(String email, String inputCode){
        String key = buildKey(email);
        String saveCode = redisTemplate.opsForValue().get(key).toString();
        Log.d("[Redis]", saveCode);

        if(saveCode == null){
            return false; // 시간 초과
        }
        // 코드 불일치
        if(!saveCode.equals(inputCode)){
            return false;
        }
        //성공
        redisTemplate.delete(key);
        return true;
    }

    private String generateAuthCode() {
        int code = ThreadLocalRandom.current().nextInt(100000, 999999);
        return String.valueOf(code);
    }

    // group_id 캐싱
    public Optional<Long> getGroupIdByMemberId(String memberId) {
        String key = "member:" + memberId + ":group";

        // ✅ 1️⃣ Redis 조회
        String cached = stringRedisTemplate.opsForValue().get(key);

        if (cached != null) {
            if ("NONE".equals(cached)) {
                return Optional.empty();
            }
            return Optional.of(Long.valueOf(cached));
        }

        // ✅ 2️⃣ DB 조회
        Optional<Long> groupIdOpt =
                ledgerRepository.findGroupIdByMemberId(memberId);

        // ✅ 3️⃣ Redis 캐시 저장 (Optional 처리)
        String valueToCache = groupIdOpt
                .map(String::valueOf)
                .orElse("NONE");

        stringRedisTemplate.opsForValue().set(
                key,
                valueToCache,
                Duration.ofMinutes(10)
        );

        return groupIdOpt;
    }

    public void setGroupId(String memberId){
        String key = "member:" + memberId + ":group";

        Optional<Long> groupIdOpt =
                ledgerRepository.findGroupIdByMemberId(memberId);
        String valueToCache = groupIdOpt
                .map(String::valueOf)
                .orElse("NONE");
        stringRedisTemplate.opsForValue().set(
                key,
                valueToCache,
                Duration.ofMinutes(10)
        );

    }
}
