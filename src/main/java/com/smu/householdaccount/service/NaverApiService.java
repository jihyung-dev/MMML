package com.smu.householdaccount.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpSession;
import org.apache.tomcat.util.json.JSONParser;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientResponseException;
import org.springframework.web.client.RestTemplate;
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

    @Value("${naver.client_secret}")
    private String clientSecret;

    @Value("${naver.nauthHost}")
    private String naverNauthHost;

    @Value("${naver.napi-host}")
    private String napiHost;

    private final RestClient restClient;
    private final ObjectMapper objectMapper;

    public NaverApiService(ObjectMapper objectMapper, RestClient.Builder restClientBuilder) {
        this.restClient = restClientBuilder.baseUrl(napiHost).build();
        this.objectMapper = objectMapper;
    }

    // 세션 획득
    private HttpSession getSession() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attr.getRequest().getSession();
    }

    // 네이버 토큰 획득
    private String getAccessToken() {
        return (String) getSession().getAttribute("naver_access_token");
    }

    public String getAccessTokenUrl(String code, String state){
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", clientId);
        params.add("client_secret", clientSecret);
        params.add("code", code);
        params.add("state", state);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        // HttpEntity 생성
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);

        // POST 요청
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response =
                restTemplate.postForEntity(naverNauthHost + "/oauth2.0/token", request, String.class);

        String accessToken = "";
        try {
            JSONObject jsonObj = (JSONObject) JSONValue.parse(response.getBody());
            accessToken = (String) jsonObj.get("access_token");

            // 접근 토큰 세션에 저장
            saveAccessToken(accessToken);

        } catch (Exception e) {
            throw new RuntimeException("토큰 파싱 중 오류 발생", e);
        }
        return accessToken;
    }

    public String getAuthUrl() {
        return UriComponentsBuilder
                .fromHttpUrl(naverNauthHost + "/oauth2.0/authorize")
                .queryParam("client_id", clientId)
                .queryParam("redirect_uri", redirectUri)
                .queryParam("response_type", "code")
                .queryParam("state", getStateToken())
                .build()
                .toUriString();
    }

    // CSRF 방지를 위한 상태 토큰 생성 코드
    private String generateState() {
        SecureRandom random = new SecureRandom();
        return new BigInteger(130, random).toString(32);
    }

    public void saveStateToken(String stateToken) {
        getSession().setAttribute("naver_state_token", stateToken);
    }
    public String getStateToken() {
        if((String) getSession().getAttribute("naver_state_token") == null){
            String token = generateState();
            saveStateToken(token);
            return token;
        }
        return (String) getSession().getAttribute("naver_state_token");
    }

    // 유저 프로필 정보
    public JSONObject getUserProfile() {
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + getAccessToken());
        HttpEntity<String> entity = new HttpEntity<>(headers);

        ResponseEntity<String> userInfoResponse = restTemplate.exchange(
                napiHost + "/v1/nid/me",
                HttpMethod.GET,
                entity,
                String.class
        );

        JSONObject jsonObject = (JSONObject) JSONValue.parse(userInfoResponse.getBody());

        JSONObject user = (JSONObject) jsonObject.get("response");
        String email = (String) user.get("email");
        String name = (String) user.get("name");
        String mobile = (String) user.get("mobile");

        System.out.println(userInfoResponse.getBody());
        return jsonObject;
    }

    private void saveAccessToken(String accessToken) {
        getSession().setAttribute("naver_access_token", accessToken);
    }

    public void removeSession(){
        getSession().removeAttribute("naver_state_token");
        getSession().removeAttribute("naver_access_token");
    }
}
