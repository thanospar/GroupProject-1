package com.group.groupproject.controllers;

import com.group.groupproject.entities.Author;
import com.group.groupproject.entities.Book;
import com.group.groupproject.services.author.AuthorService;
import com.group.groupproject.services.book.BookService;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
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
@RequestMapping("/authors/")
public class AuthorController {
    
    @Autowired
    private AuthorService authorservice;
    
    @Autowired
    private BookService bookservice;
    
    @GetMapping
    public String findAllAuthors(ModelMap model, @ModelAttribute("isDone") String isDone) {
        List<Author> authors = authorservice.findAllAuthors();
        model.addAttribute("authors", authors);
        return "author/listofauthors";
    }
    
    @GetMapping("{authorid}")
    public String findAuthor(ModelMap model, @PathVariable("authorid") int id) {
        Author author = authorservice.findById(id);
        model.addAttribute("author", author);
        return "author/showauthor";
    }
    
    @GetMapping("formAddAuthor")
    public String showFormForAdd(ModelMap model) {
        Author author = new Author();
        List<Book> books = bookservice.findAllBooks();
        model.addAttribute("books", books);
        model.addAttribute("author", author);
        return "author/authorform";
    }
    
    @PostMapping("formAddAuthor")
    public String saveAuthor(ModelMap model, @Valid @ModelAttribute("author") Author author, BindingResult result) {
        if (result.hasErrors()){
            return "author/authorform";
        }
        String isDone;
        if (authorservice.saveAuthor(author)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/authors/";
    }
    
    @GetMapping("formUpdateAuthor/{authorid}")
    public String showFormForUpdate(ModelMap model, @PathVariable("authorid") int id) {
        Author author = authorservice.findById(id);
        List<Book> books = bookservice.findAllBooks();
        model.addAttribute("books", books);
        model.addAttribute("author", author);
        return "author/authorformUpdate";
    }
    
    @PostMapping("formUpdateAuthor")
    public String updateAuthor(ModelMap model, @Valid @ModelAttribute("author") Author author, BindingResult result) {
        if (result.hasErrors()){
            return "author/authorformUpdate";
        }
        String isDone;
        if (authorservice.updateAuthor(author)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/authors/";
    }
    
    @GetMapping("deleteAuthor/{authorid}")
    public String deleteAuthor(ModelMap model, @PathVariable("authorid") int id) {
        Author author = authorservice.findById(id);
        String isDone;
        if (authorservice.deleteAuthor(author)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/authors/";
    }
    
    
}
