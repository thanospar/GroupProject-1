package com.group.groupproject.converter;

import com.group.groupproject.entities.Author;

import com.group.groupproject.services.AuthorService;
import com.group.groupproject.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class AuthorFromFormToEntity implements Converter<String, Author> {

    @Autowired
    AuthorService authorService;

    @Override
    public Author convert(String s) {
        Integer id = Integer.parseInt( s);
        Author author = authorService.findById(id);
        return author;
    }

}
