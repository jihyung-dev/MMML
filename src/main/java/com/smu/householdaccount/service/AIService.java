package com.smu.householdaccount.service;

import com.smu.householdaccount.web.SafeHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class AIService {
    @Value("${render.render-host}")
    private String renderHost;

    @Autowired
    SafeHttpClient safeHttpClient;

    public void test(){

    }
    public void getAuthUrl() throws Exception{
        String result = safeHttpClient.get(renderHost, new HttpHeaders());
        System.out.println(result);
    }
}
