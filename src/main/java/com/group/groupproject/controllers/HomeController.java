package com.group.groupproject.controllers;

import com.group.groupproject.dao.author.AuthorDao;
import com.group.groupproject.dao.book.BookDao;
import com.group.groupproject.dao.publisher.PublisherDao;
import com.group.groupproject.entities.Book;
import com.group.groupproject.entities.Invoice;
import com.group.groupproject.entities.Publisher;
import com.group.groupproject.services.AuthorService;
import com.group.groupproject.services.BookService;
import com.group.groupproject.services.invoice.InvoiceService;
import com.group.groupproject.services.user.UserService;
import java.time.LocalDate;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    AuthorService authorService;

    @Autowired
    BookService bookService;

    @Autowired
    PublisherDao publisherDao;
    @Autowired
    InvoiceService invoiceService;
    
    @Autowired
    UserService userService;
    
    @RequestMapping(method = RequestMethod.GET)
    public String sayHello(ModelMap model) {
        
//        Invoice i = new Invoice();
//        i.setDate(LocalDate.now());
//        i.setUser(userService.findById(1));
        invoiceService.findById(1);
        System.out.println(invoiceService.findById(1).getBoughts());
//
//        Book b =bookService.findById(1);
//
//        System.out.println(b.getAuthors());
//        
//        System.out.println(b.getPublisher());
//        System.out.println(b.getCategories());
//        
//        System.out.println(b.getQuantity().getQuantity());
        return "index";
    }

}
