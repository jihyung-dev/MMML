package com.smu.householdaccount.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smu.householdaccount.dto.KakaoTokenResponse;
import com.smu.householdaccount.web.SafeHttpClient;
import jakarta.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class KakaoApiService {

    private final ObjectMapper objectMapper;
    private final SafeHttpClient http;

    @Value("${kakao.client-id}")
    private String clientId;

    @Value("${kakao.client-secret}")
    private String clientSecret;

    @Value("${kakao.kauth-host}")
    private String kauthHost;

    @Value("${kakao.kapi-host}")
    private String kapiHost;

    @Value("${kakao.redirect-uri}")
    private String redirectUri;

    public KakaoApiService(ObjectMapper objectMapper, SafeHttpClient httpClient) {
        this.objectMapper = objectMapper;
        this.http = httpClient;
    }

    private HttpSession getSession() {
        ServletRequestAttributes attr =
                (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attr.getRequest().getSession();
    }

    private void saveAccessToken(String token) {
        getSession().setAttribute("kakao_access_token", token);
    }

    private String getAccessToken() {
        return (String) getSession().getAttribute("kakao_access_token");
    }

    /**
     * 인증 url
     * @param scope
     * @return
     */
    public String getAuthUrl(String scope) {
        return UriComponentsBuilder
                .fromHttpUrl(kauthHost + "/oauth/authorize")
                .queryParam("client_id", clientId)
                .queryParam("redirect_uri", redirectUri)
                .queryParam("response_type", "code")
                .queryParamIfPresent("scope", (scope != null) ? java.util.Optional.of(scope) : java.util.Optional.empty())
                .toUriString();
    }

    /**
     * 토큰 요청
     * @param code
     * @return
     * @throws Exception
     */
    private KakaoTokenResponse getToken(String code) throws Exception {

        String body = "grant_type=authorization_code" +
                "&client_id=" + clientId +
                "&client_secret=" + clientSecret +
                "&code=" + code;

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");

        String result = http.post(kauthHost + "/oauth/token", headers, body);

        if (result == null) return null;

        return objectMapper.readValue(result, KakaoTokenResponse.class);
    }

    public boolean handleAuthorizationCallback(String code) {
        try {
            KakaoTokenResponse token = getToken(code);

            if (token == null) return false;

            saveAccessToken(token.getAccess_token());
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 사용자 정보 요청
     * @return
     */
    public JSONObject getUserProfile() {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + getAccessToken());

        String result = http.get(kapiHost + "/v2/user/me", headers);

        if (result == null) return null;

        return (JSONObject) JSONValue.parse(result);
    }
}
