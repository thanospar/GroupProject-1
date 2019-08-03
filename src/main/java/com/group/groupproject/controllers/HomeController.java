package com.group.groupproject.controllers;

import com.group.groupproject.dao.author.AuthorDao;
import com.group.groupproject.dao.book.BookDao;
import com.group.groupproject.dao.publisher.PublisherDao;
import com.group.groupproject.entities.Author;
import com.group.groupproject.entities.Book;
import com.group.groupproject.entities.Invoice;
import com.group.groupproject.entities.Publisher;
import com.group.groupproject.entities.user.User;
import com.group.groupproject.entities.user.UserProfile;
import com.group.groupproject.services.AuthorService;
import com.group.groupproject.services.BookService;
import com.group.groupproject.services.invoice.InvoiceService;
import com.group.groupproject.services.user.UserProfileService;
import com.group.groupproject.services.user.UserService;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import javax.validation.Valid;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    MessageSource messageSource;

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

    @Autowired
    UserProfileService userProfileService;

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

    @RequestMapping(value = {"/single-product-{id}"}, method = RequestMethod.GET)
    public String singleProduct(@PathVariable("id") int id, ModelMap model) {
        Book book = bookService.findById(id);
        model.addAttribute("book", book);
        return "/singleproduct";
    }

    @RequestMapping(value = {"cart/{ids}"}, method = RequestMethod.GET)
    public String cart(@PathVariable("ids") String ids, ModelMap model) {

        JSONArray booksArray = new JSONArray(bookService.findBooksToBuy(ids));
        model.addAttribute("booksArray", booksArray);

        return "/cart";
    }

    @RequestMapping(value = {"/newuser"}, method = RequestMethod.GET)
    public String newUser(ModelMap model) {
        User user = new User();
        Set<UserProfile> userProfiles = new HashSet<UserProfile>();
        userProfiles.add(userProfileService.findById(1));
        user.setUserProfiles(userProfiles);
        model.addAttribute("user", user);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
        return "/loginRegistration";
    }

    @RequestMapping(value = {"/newuser"}, method = RequestMethod.POST)
    public String saveUser(@Valid User user, BindingResult result,
            ModelMap model) {

        if (result.hasErrors()) {
            return "/loginRegistration";
        }

        if (!userService.isUserSSOUnique(user.getId(), user.getSsoId())) {
            FieldError ssoError = new FieldError("user", "ssoId", messageSource.getMessage("non.unique.ssoId", new String[]{user.getSsoId()}, Locale.getDefault()));
            result.addError(ssoError);
            return "/loginRegistration";
        }

        userService.saveUser(user);

        model.addAttribute("success", "User " + user.getFirstName() + " " + user.getLastName() + " registered successfully");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "success";
        return "/shop";
    }

    private String getPrincipal() {
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails) principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

}
