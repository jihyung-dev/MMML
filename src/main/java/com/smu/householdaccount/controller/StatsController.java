package com.smu.householdaccount.controller;

import com.smu.householdaccount.service.StatsService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/stats")
public class StatsController {
    private final StatsService statsService;

    public StatsController(StatsService statsService) {
        this.statsService = statsService;
    }

    @GetMapping("/save")
    public ResponseEntity<?> save(){
        statsService.updateCategoryStats();
        return ResponseEntity.ok("");
    }

    @GetMapping("/load")
    public ResponseEntity<?> load(
            @RequestParam String gender,
            @RequestParam int ageGroup,
            @RequestParam String category
    ){
        return ResponseEntity.ok(statsService.getStatsFromRedis(gender, ageGroup, category));
    }

    @GetMapping("/loadAll")
    public ResponseEntity<?> load(
    ){
        return ResponseEntity.ok(statsService.getGlobalCategoryStats());
    }
}
