package com.smu.householdaccount.web;


import lombok.extern.slf4j.Slf4j;
import org.springframework.http.*;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientResponseException;

// 외부 API에 의해 서버 오류 방지 Client
@Slf4j
@Component
public class SafeHttpClient {

    private final RestClient client;

    public SafeHttpClient() {
        HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
        factory.setConnectTimeout(3000);
        factory.setReadTimeout(3000);

        this.client = RestClient.builder()
                .requestFactory(factory)
                .build();
    }

    public String get(String url, HttpHeaders headers) {
        return execute(HttpMethod.GET, url, headers, null);
    }

    public String post(String url, HttpHeaders headers, String body) {
        return execute(HttpMethod.POST, url, headers, body);
    }

    public <T> T post(String url, HttpHeaders headers, String body, Class<T> responseType) {
        try {
            RestClient.RequestBodySpec req = client.method(HttpMethod.POST)
                    .uri(url)
                    .headers(h -> h.addAll(headers))
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(body);

            return req.retrieve().body(responseType);

        } catch (RestClientResponseException e) {
            log.error("❗ API ERROR [{}] {}: {}", e.getRawStatusCode(), url, e.getResponseBodyAsString());
            return null;
        } catch (Exception e) {
            log.error("❗ API CONNECTION FAILED {}: {}", url, e.getMessage());
            return null;
        }
    }

    private String execute(HttpMethod method, String url, HttpHeaders headers, String body) {
        try {
            RestClient.RequestBodySpec req = client.method(method)
                    .uri(url)
                    .headers(h -> h.addAll(headers));

            if (body != null) {
                req = req.contentType(MediaType.APPLICATION_JSON)
                        .body(body);
            }

            return req.retrieve().body(String.class);

        } catch (RestClientResponseException e) {
            log.error("❗ API ERROR [{}] {}: {}", e.getRawStatusCode(), url, e.getResponseBodyAsString());
            return null;
        } catch (Exception e) {
            log.error("❗ API CONNECTION FAILED {}: {}", url, e.getMessage());
            return null;
        }
    }

    public <T> T get(String url, HttpHeaders headers, Class<T> responseType) {
        try {

            RestClient.RequestHeadersSpec<?> req = client.method(HttpMethod.GET)
                    .uri(url)
                    .headers(h -> h.addAll(headers));

            return req.retrieve().body(responseType);

        } catch (RestClientResponseException e) {
            log.error("❗ API ERROR [{}] {}: {}", e.getRawStatusCode(), url, e.getResponseBodyAsString());
            return null;
        } catch (Exception e) {
            log.error("❗ API CONNECTION FAILED {}: {}", url, e.getMessage());
            return null;
        }
    }
}
