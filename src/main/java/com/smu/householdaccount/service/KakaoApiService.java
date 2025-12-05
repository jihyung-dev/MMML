package com.smu.householdaccount.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smu.householdaccount.dto.KakaoTokenResponse;
import com.smu.householdaccount.util.Log;
import com.smu.householdaccount.web.SafeHttpClient;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClient;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.util.UriComponentsBuilder;

@Slf4j
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

        MultiValueMap<String,String> form = new LinkedMultiValueMap<>();
        form.add("grant_type", "authorization_code");
        form.add("client_id", clientId);
        form.add("client_secret", clientSecret);
        form.add("redirect_uri", redirectUri);
        form.add("code", code);

        String result = http.postForm(kauthHost + "/oauth/token", form);

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
