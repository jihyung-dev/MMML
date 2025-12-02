package com.smu.householdaccount.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.argon2.Argon2PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.YearMonth;

@Component
public class Utility {
    @Value("${cloudfront.domain}")
    private String cloudfrontDomain;

    /**
     * 암호화 메서드.Argon2 사용.
     * @param password
     * @return
     */
    public static String encrypt(String password){
        PasswordEncoder encoder = new Argon2PasswordEncoder(16, 32, 1, 4096, 3);
        return encoder.encode(password);
    }

    /**
     * 원하는 월의 마지막 날짜 구하는 함수
     * @param year
     * @param month
     * @return
     */
    public static int endOfMonth(int year, int month){
        YearMonth yearMonth = YearMonth.of(year, month);
        LocalDateTime endDate = yearMonth.atEndOfMonth().atStartOfDay();
        return endDate.getDayOfMonth();
    }

    public String getPublicUrl(String key) {
        if (key.startsWith("/")) {
            key = key.substring(1);
        }
        return "https://" + cloudfrontDomain + "/" + key;
    }
}
