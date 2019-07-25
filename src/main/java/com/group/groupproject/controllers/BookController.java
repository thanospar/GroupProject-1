package com.group.groupproject.controllers;

import com.group.groupproject.entities.Author;
import com.group.groupproject.entities.Book;
import com.group.groupproject.entities.Category;
import com.group.groupproject.services.AuthorService;
import com.group.groupproject.services.BookService;
import com.group.groupproject.services.CategoryService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class BookController {

    @Autowired
    private BookService bookservice;
    @Autowired
    private AuthorService authorservice;
    @Autowired
    private CategoryService categoryservice;

    @GetMapping("books")
    public String findAllBooks(ModelMap model, @ModelAttribute("isDone") String isDone) {
        List<Book> books = bookservice.findAllBooks();
        model.addAttribute("books", books);
        return "book/listofbooks";
    }

    @GetMapping("books/{bookid}")
    public String findBook(ModelMap model, @PathVariable("bookid") int id) {
        Book book = bookservice.findById(id);
        model.addAttribute("book", book);
        return "book/showbook";
    }

    @GetMapping("books/formAddBook")
    public String showFormForAdd(ModelMap model) {
        Book book = new Book();
        List<Author> authors = authorservice.findAllAuthors();
        List<Category> categories = categoryservice.findAllCategories();
        model.addAttribute("book", book);
        model.addAttribute("authors", authors);
        model.addAttribute("categories", categories);
        return "book/bookform";
    }

    @PostMapping("books/formAddBook")
    public String saveBook(ModelMap model, @ModelAttribute("book") Book book) {
        String isDone;
        if (bookservice.saveBook(book)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/books";
    }

    @GetMapping("books/formUpdateBook/{bookid}")
    public String showFormForUpdate(ModelMap model, @PathVariable("bookid") int id) {
        Book book = bookservice.findById(id);
        model.addAttribute("book", book);
        return "book/bookformUpdate";
    }

    @PostMapping("books/formUpdateBook")
    public String updateBook(ModelMap model, @ModelAttribute("book") Book book) {
        String isDone;
        if (bookservice.updateBook(book)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/books";
    }

    @GetMapping("books/deleteBook/{bookid}")
    public String deleteBook(ModelMap model, @PathVariable("bookid") int id) {
        Book book = bookservice.findById(id);
        String isDone;
        if (bookservice.deleteBook(book)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/books";
    }

}
