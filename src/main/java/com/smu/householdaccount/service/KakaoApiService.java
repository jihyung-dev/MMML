package com.smu.householdaccount.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smu.householdaccount.dto.KakaoTokenResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.tomcat.util.json.JSONParser;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientResponseException;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class KakaoApiService {
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

    private final ObjectMapper objectMapper;
    private final RestClient restClient;
    public KakaoApiService(ObjectMapper objectMapper, RestClient.Builder restClientBuilder) {
        this.objectMapper = objectMapper;
        this.restClient = restClientBuilder.baseUrl(kapiHost).build();
    }

    private HttpSession getSession() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attr.getRequest().getSession();
    }

    private String getAccessToken() {
        return (String) getSession().getAttribute("kakao_access_token");
    }

    public String getAuthUrl(String scope) {
        return UriComponentsBuilder
                .fromHttpUrl(kauthHost + "/oauth/authorize")
                .queryParam("client_id", clientId)
                .queryParam("redirect_uri", redirectUri)
                .queryParam("response_type", "code")
                .queryParamIfPresent("scope", scope != null ? java.util.Optional.of(scope) : java.util.Optional.empty())
                .build()
                .toUriString();
    }

    private KakaoTokenResponse getToken(String code) throws Exception {
        String params = String.format("grant_type=authorization_code&client_id=%s&client_secret=%s&code=%s",
                clientId, clientSecret, code);
        String response = call("POST", kauthHost + "/oauth/token", params);
        return objectMapper.readValue(response, KakaoTokenResponse.class);
    }

    private String call(String method, String urlString, String body) throws Exception {
        System.out.println(getAccessToken());
        RestClient.RequestBodySpec requestSpec = restClient.method(HttpMethod.valueOf(method))
                .uri(urlString)
                .headers(headers -> headers.setBearerAuth(getAccessToken()));

        if (body != null) {
            requestSpec.contentType(MediaType.APPLICATION_FORM_URLENCODED)
                    .body(body);
        }
        try {
            return requestSpec.retrieve()
                    .body(String.class);
        } catch (RestClientResponseException e) {

            // 에러 메시지 (응답 바디)
            String errorBody = e.getResponseBodyAsString();
            System.out.println("Error Body: " + errorBody);
            return errorBody;
        }
    }

    public boolean handleAuthorizationCallback(String code) {
        try {
            KakaoTokenResponse tokenResponse = getToken(code);
            if (tokenResponse != null) {
                saveAccessToken(tokenResponse.getAccess_token());
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    // 세션에 토큰 저장
    private void saveAccessToken(String accessToken) {
        getSession().setAttribute("kakao_access_token", accessToken);
    }

    // 유저 정보
    public JSONObject getUserProfile() {
        try {
            String response = call("GET", kapiHost + "/v2/user/me", null);
            JSONObject user = (JSONObject)new JSONValue().parse(response);
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null; // 임시 조치
        }
    }
}
