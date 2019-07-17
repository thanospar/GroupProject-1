package com.group.groupproject.controllers;

import com.group.groupproject.entities.Book;
import com.group.groupproject.services.BookService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class BookController {
    
    @Autowired
    BookService bookservice;
    
    @GetMapping(value = "books")
    public String findAllBooks(ModelMap model) {
        List<Book> books = bookservice.findAllBooks();
        model.addAttribute("books", books);
        return "/book/listofbooks";
    }
}
