package com.smu.householdaccount.controller;

import com.smu.householdaccount.service.HouseholdService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/household")
public class HouseholdController {

    private final HouseholdService householdService;

    public HouseholdController(HouseholdService householdService) {
        this.householdService = householdService;
    }

    @GetMapping("/exchangeRate")
    public ResponseEntity<?> getExchangeRate(){
        Double res = householdService.getExchangeRate();
        return ResponseEntity.ok(res);
    }
}
