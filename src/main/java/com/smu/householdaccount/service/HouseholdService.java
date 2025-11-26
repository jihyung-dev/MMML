package com.smu.householdaccount.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smu.householdaccount.util.Log;
import com.smu.householdaccount.web.SafeHttpClient;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;

@Service
public class HouseholdService {
    @Value("${exchangerate.api-host}")
    private String host;

    private final SafeHttpClient http;
    private final ObjectMapper mapper;

    public HouseholdService(SafeHttpClient http, ObjectMapper mapper) {
        this.http = http;
        this.mapper = mapper;
    }

    public Double getExchangeRate(){
        String url = host + "/latest?from=USD&to=KRW";
        HttpHeaders headers = new HttpHeaders();
        String response = http.get(url, headers, String.class);

        JsonNode json = null;
        try {
            json = mapper.readTree(response);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
        return json.get("rates").get("KRW").asDouble();
    }
}
