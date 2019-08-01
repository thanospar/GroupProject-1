package com.group.groupproject.controllers;

import com.group.groupproject.entities.Author;
import com.group.groupproject.entities.Book;
import com.group.groupproject.entities.Category;
import com.group.groupproject.entities.Publisher;
import com.group.groupproject.services.AuthorService;
import com.group.groupproject.services.BookService;
import com.group.groupproject.services.CategoryService;
import com.group.groupproject.services.PublisherService;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import javax.validation.Valid;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/books/")
public class BookController {

    @Autowired
    private BookService bookservice;
    @Autowired
    private AuthorService authorservice;
    @Autowired
    private CategoryService categoryservice;
    
    @Autowired
    private PublisherService publisherservice;

    @GetMapping
    public String findAllBooks(ModelMap model, @ModelAttribute("isDone") String isDone) {
        List<Book> books = bookservice.findAllBooks();
        
        model.addAttribute("books", books);
        return "book/listofbooks";
    }

    @GetMapping("searchbooks")
    public String findAllBooks(@RequestParam String search, ModelMap model) {
        List<Book> books = bookservice.findByTitleOrISBN(search);
        List<Author> authors = authorservice.findByLastName(search);
        model.addAttribute("books", books);
        model.addAttribute("authors", authors);
        return "/shop";

    }

    @GetMapping("{bookid}")
    public String findBook(ModelMap model, @PathVariable("bookid") int id) {
        Book book = bookservice.findById(id);
        model.addAttribute("book", book);
        return "book/showbook";
    }

    @GetMapping("formAddBook")
    public String showFormForAdd(ModelMap model) {
        Book book = new Book();
        List<String> bookSeries = bookservice.findBookSeries();
        List<String> specials = bookservice.findBookSpecials();
        List<Author> authors = authorservice.findAllAuthors();
        List<Category> categories = categoryservice.findAllCategories();
        List<Publisher> publishers = publisherservice.findAllPublishers();
        model.addAttribute("book", book);
        model.addAttribute("bookSeries", bookSeries);
        model.addAttribute("specials", specials);
        model.addAttribute("authors", authors);
        model.addAttribute("categories", categories);
        model.addAttribute("publishers", publishers);
        return "book/bookregister";
    }

    @PostMapping("formAddBook")
    public String saveBook(ModelMap model, @Valid @ModelAttribute("book") Book book, BindingResult result) {
        if (result.hasErrors()){
            return "book/bookregister";
        }
        String isDone;
        if (bookservice.saveBook(book)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/books/";
    }

    @GetMapping("formUpdateBook/{bookid}")
    public String showFormForUpdate(ModelMap model, @PathVariable("bookid") int id) {
        Book book = bookservice.findById(id);
        List<String> bookSeries = bookservice.findBookSeries();
        List<Author> authors = authorservice.findAllAuthors();
        List<Category> categories = categoryservice.findAllCategories();
        List<Publisher> publishers = publisherservice.findAllPublishers();
        model.addAttribute("bookSeries", bookSeries);
        model.addAttribute("authors", authors);
        model.addAttribute("categories", categories);
        model.addAttribute("publishers", publishers);
        model.addAttribute("book", book);
        return "book/bookformUpdate";
    }

    @PostMapping("formUpdateBook")
    public String updateBook(ModelMap model, @Valid @ModelAttribute("book") Book book, BindingResult result ) {
        if (result.hasErrors()){
            return "book/bookformUpdate";
        }
        String isDone;
        if (bookservice.updateBook(book)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/books/";
    }

    @GetMapping("deleteBook/{bookid}")
    public String deleteBook(ModelMap model, @PathVariable("bookid") int id) {
        Book book = bookservice.findById(id);
        String isDone;
        if (bookservice.deleteBook(book)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/books/";
    }

}
