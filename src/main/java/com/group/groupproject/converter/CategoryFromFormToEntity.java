package com.group.groupproject.converter;

import com.group.groupproject.entities.Category;
import com.group.groupproject.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class CategoryFromFormToEntity implements Converter<String, Category> {

    @Autowired
    CategoryService categoryService;

    @Override
    public Category convert(String s) {
        Integer id = Integer.parseInt( s);
        Category category = categoryService.findById(id);
        return category;
    }

}
