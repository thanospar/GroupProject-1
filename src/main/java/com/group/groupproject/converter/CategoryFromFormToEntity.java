package com.group.groupproject.converter;

import com.group.groupproject.entities.Category;
import com.group.groupproject.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class CategoryFromFormToEntity implements Converter<Object, Category> {

    @Autowired
    CategoryService categoryService;

    @Override
    public Category convert(Object s) {
        Integer id = Integer.parseInt((String) s);
        Category category = categoryService.findById(id);
        return category;
    }

}
