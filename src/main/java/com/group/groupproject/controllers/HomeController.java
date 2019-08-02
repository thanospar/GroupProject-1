package com.group.groupproject.controllers;

import com.group.groupproject.dao.author.AuthorDao;
import com.group.groupproject.dao.book.BookDao;
import com.group.groupproject.dao.publisher.PublisherDao;
import com.group.groupproject.entities.Author;
import com.group.groupproject.entities.Book;
import com.group.groupproject.entities.Invoice;
import com.group.groupproject.entities.Publisher;
import com.group.groupproject.services.AuthorService;
import com.group.groupproject.services.BookService;
import com.group.groupproject.services.invoice.InvoiceService;
import com.group.groupproject.services.user.UserService;
import java.time.LocalDate;
import java.util.List;
import java.util.Set;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

        return "index";
    }
    
    @GetMapping(value = "shop")
    public String shop(ModelMap model) {
        List<Book> books = bookService.findAllBooks();
        
        JSONArray booksArray = new JSONArray(books);
        model.addAttribute("booksArray", booksArray);
        
        model.addAttribute("books", books);
        return "/shop";
    }
    
     @GetMapping(value = "cart")
    public String shopCart(ModelMap model) {
 
        return "/cart";
    }
    
    @RequestMapping(value = { "/single-product-{id}" }, method = RequestMethod.GET)
	public String singleProduct(@PathVariable("id") int id, ModelMap model) {
		Book book = bookService.findById(id);
                model.addAttribute("book", book);
		return "/singleproduct";
	}

}
