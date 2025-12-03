package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.Category;
import com.smu.householdaccount.repository.CategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CategoryService {
    private final CategoryRepository categoryRepository;

}