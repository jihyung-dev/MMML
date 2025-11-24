package com.smu.householdaccount.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

import static com.smu.householdaccount.security.PathList.*;

@Configuration
@Profile("prod")
public class SecurityConfig {

    // CSRF 방지용 보안, 웹 보안 설정
    // oAuth2.0 로그인을 직접 구현하고 있어서 oAuth2Login 기능 미사용.
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf(csrf ->
                        csrf.ignoringRequestMatchers("/api/**")) // api는 토큰으로 이루어지고 있기 때문에 csrf 보안에서 제외
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers(
                                PathList.values(LOGIN, ERROR, ERROR_ALL, FAVICON, AI, KAKAO, NAVER, OAUTH2_1, OAUTH2_2,
                                        STATIC_CSS, STATIC_ASSETS, STATIC_IMG, STATIC_JS,ALL)
                        ).permitAll()
                        .anyRequest().authenticated()
                )
                .formLogin(form -> form
                        .loginPage("/user/login")
                        .permitAll()
                );

        return http.build();
    }
}