package com.smu.householdaccount.service;

import com.smu.householdaccount.web.SafeHttpClient;
import jakarta.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import java.math.BigInteger;
import java.security.SecureRandom;


@Service
public class NaverApiService {

    @Value("${naver.redirect-uri}")
    private String redirectUri;

    @Value("${naver.client-id}")
    private String clientId;

    @Value("${naver.client-secret}")
    private String clientSecret;

    @Value("${naver.nauth-host}")
    private String naverNauthHost;

    @Value("${naver.napi-host}")
    private String napiHost;

    private final SafeHttpClient http;

    public NaverApiService(SafeHttpClient http) {
        this.http = http;
    }

    private HttpSession getSession() {
        ServletRequestAttributes attr =
                (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attr.getRequest().getSession();
    }

    private void saveAccessToken(String token) {
        getSession().setAttribute("naver_access_token", token);
    }

    private String getAccessToken() {
        return (String) getSession().getAttribute("naver_access_token");
    }

    // 네이버 로그인 URL 생성
    public String getAuthUrl() {
        return UriComponentsBuilder
                .fromHttpUrl(naverNauthHost + "/oauth2.0/authorize")
                .queryParam("response_type", "code")
                .queryParam("client_id", clientId)
                .queryParam("redirect_uri", redirectUri)
                .queryParam("state", getStateToken())
                .toUriString();
    }

    // CSRF STATE 생성
    private String generateState() {
        return new BigInteger(130, new SecureRandom()).toString(32);
    }

    public String getStateToken() {
        String state = (String) getSession().getAttribute("naver_state_token");
        if (state == null) {
            state = generateState();
            getSession().setAttribute("naver_state_token", state);
        }
        return state;
    }

    // 🔥 네이버 토큰 요청 (SafeHttpClient 적용)
    public String requestToken(String code, String state) {

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        String body = "grant_type=authorization_code"
                + "&client_id=" + clientId
                + "&client_secret=" + clientSecret
                + "&code=" + code
                + "&state=" + state;

        String result = http.post(naverNauthHost + "/oauth2.0/token", headers, body);

        if (result == null) return null; // API 오류

        JSONObject json = (JSONObject) JSONValue.parse(result);
        String token = (String) json.get("access_token");

        saveAccessToken(token);
        return token;
    }

    // 🔥 사용자 정보 요청 (SafeHttpClient 적용)
    public JSONObject getUserProfile() {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + getAccessToken());

        String result = http.get(napiHost + "/v1/nid/me", headers);

        if (result == null) return null;

        return (JSONObject) JSONValue.parse(result);
    }

    public void removeSession(){
        getSession().removeAttribute("naver_access_token");
        getSession().removeAttribute("naver_state_token");
    }
}

