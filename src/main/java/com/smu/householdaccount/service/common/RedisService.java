package com.smu.householdaccount.service.common;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.repository.account.LedgerRepository;
import com.smu.householdaccount.util.Log;
import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.time.Duration;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ThreadLocalRandom;
import java.util.concurrent.TimeUnit;

@Service
@RequiredArgsConstructor
public class RedisService {
    private final StringRedisTemplate stringRedisTemplate;
    private final EmailService emailService;

    private static final long EMAIL_VERIFY_TTL = 600; // 10분 (초단위)
    private static final long EMAIL_GROUP_VERIFY_TTL = 1; // 1일 (일 단위)
    private static final String EMAIL_SUB = "MMML 본인 확인 인증 번호";
    private static final String KEY_PREFIX = "auth:email:";
    private final RedisTemplate<String, Object> redisTemplate;
    private final LedgerRepository ledgerRepository;
    private final ObjectMapper mapper;

    /**
     * 이메일 기준 key 생성
     */
    public String buildKey(String email){
        return KEY_PREFIX + email;
    }

    /**
     * 인증 코드 저장(TTL 10분 적용)
     */
    public void saveEmailAuthCode(String email) throws MessagingException, UnsupportedEncodingException {
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
     * 그룹 가게부 초대 토큰 저장
     */
    public void saveGroupInviteToken(String email, String token, Long groupId,String targetMemberId, Member inviter){
        Map<String, Object> inviteData = new HashMap<>();
        inviteData.put("groupId", groupId);
        inviteData.put("targetMemberId", targetMemberId);
        inviteData.put("email", email);
        inviteData.put("inviterId", inviter.getMemberId());

        String key = "invite:token:" + token;

        try{
            String json = mapper.writeValueAsString(inviteData);
            redisTemplate.opsForValue().set(
                    key,
                    json,
                    1,
                    TimeUnit.DAYS);
        } catch (Exception e){
            throw new RuntimeException("초대 데이터를 Redis에 저장 중 오류");
        }

    }

    /**
     * 그룹 가게부 초대 토큰 확인
     */
    public String getGroupInviteToken(String token){
        String key = "invite:token:" + token;
        try{
            return redisTemplate.opsForValue().get(key).toString();
        }catch (Exception e){
            return null;
        }
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

    /**
     * group_id가 들어오지 않은 경우 개인 가게부 group_id 리턴
     * @param memberId
     * @param groupId
     * @return
     */
    public Optional<Long> getGroupIdByMemberId(String memberId, Long groupId) {
        String key = "member:" + memberId + ":group";

        // ✅ 1️⃣ Redis 조회
        String cached = stringRedisTemplate.opsForValue().get(key);

        if (cached != null) {
            if ("NONE".equals(cached)) {
                return Optional.empty();
            }
            return Optional.of(Long.valueOf(cached));
        }

        // 그룹 가게부 조회
        if(groupId != null){
            String valueToCache = groupId.toString();
            stringRedisTemplate.opsForValue().set(
                    key,
                    valueToCache,
                    Duration.ofMinutes(10)
            );
            return Optional.of(groupId);
        }

        // 아래는 개인 가게부 번호 조회
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

    /**
     * group_id가 들어오지 않은 경우 개인 가게부 group_id 저장, group_id가 들어올 경우 해당 id로 저장
     * @param memberId
     * @param groupId
     */
    public void setGroupId(String memberId, Long groupId){
        String key = "member:" + memberId + ":group";
        if(groupId != null){
            String valueToCache = groupId.toString();
            stringRedisTemplate.opsForValue().set(
                    key,
                    valueToCache,
                    Duration.ofMinutes(10)
            );
            return;
        }
        Optional<Long> groupIdOpt =
                ledgerRepository.findGroupIdByMemberId(memberId);
        // 중복 가능함. 한번더 쿼리를 조회하던지

        String valueToCache = groupIdOpt
                .map(String::valueOf)
                .orElse("NONE");
        stringRedisTemplate.opsForValue().set(
                key,
                valueToCache,
                Duration.ofMinutes(10)
        );
    }

    public void deleteKey(String key){
        redisTemplate.delete(key);
    }
}
