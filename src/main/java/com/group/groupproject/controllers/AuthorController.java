package com.group.groupproject.controllers;

import com.group.groupproject.entities.Author;
import com.group.groupproject.entities.Book;
import com.group.groupproject.services.AuthorService;
import com.group.groupproject.services.BookService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author filippos
 */
@Controller
@RequestMapping("/")
public class AuthorController {
    
    @Autowired
    private AuthorService authorservice;
    
    @Autowired
    private BookService bookservice;
    
    @GetMapping("authors")
    public String findAllAuthors(ModelMap model, @ModelAttribute("isDone") String isDone) {
        List<Author> authors = authorservice.findAllAuthors();
        model.addAttribute("authors", authors);
        return "author/listofauthors";
    }
    
    @GetMapping("authors/{authorid}")
    public String findAuthor(ModelMap model, @PathVariable("authorid") int id) {
        Author author = authorservice.findById(id);
        model.addAttribute("author", author);
        return "author/showauthor";
    }
    
    @GetMapping("authors/formAddAuthor")
    public String showFormForAdd(ModelMap model) {
        Author author = new Author();
        List<Book> books = bookservice.findAllBooks();
        model.addAttribute("books", books);
        model.addAttribute("author", author);
        return "author/authorform";
    }
    
    @PostMapping("authors/formAddAuthor")
    public String saveAuthor(ModelMap model, @ModelAttribute("author") Author author) {
        String isDone;
        if (authorservice.saveAuthor(author)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/authors";
    }
    
    @GetMapping("authors/formUpdateAuthor/{authorid}")
    public String showFormForUpdate(ModelMap model, @PathVariable("authorid") int id) {
        Author author = authorservice.findById(id);
        List<Book> books = bookservice.findAllBooks();
        model.addAttribute("books", books);
        model.addAttribute("author", author);
        return "author/authorformUpdate";
    }
    
    @PostMapping("authors/formUpdateAuthor")
    public String updateAuthor(ModelMap model, @ModelAttribute("author") Author author) {
        String isDone;
        if (authorservice.updateAuthor(author)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/authors";
    }
    
    @GetMapping("authors/deleteAuthor/{authorid}")
    public String deleteAuthor(ModelMap model, @PathVariable("authorid") int id) {
        Author author = authorservice.findById(id);
        String isDone;
        if (authorservice.deleteAuthor(author)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/authors";
    }
    
    
}
