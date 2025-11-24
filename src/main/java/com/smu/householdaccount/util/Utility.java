package com.smu.householdaccount.util;

import org.springframework.security.crypto.argon2.Argon2PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class Utility {
    // 생성자 방지
    private Utility(){}

    /**
     * 암호화 메서드.Argon2 사용.
     * @param password
     * @return
     */
    public static String encrypt(String password){
        PasswordEncoder encoder = new Argon2PasswordEncoder(16, 32, 1, 4096, 3);
        return encoder.encode(password);
    }


}
