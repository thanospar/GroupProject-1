
package com.group.groupproject.controllers;

import com.group.groupproject.dao.author.AuthorDao;
import com.group.groupproject.dao.book.BookDao;
import com.group.groupproject.entities.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HomeController {
    
    @Autowired
    AuthorDao authorDao;
    
    @RequestMapping(method = RequestMethod.GET)
    public String sayHello(ModelMap model) {
        
        System.out.println(authorDao.findAllAuthors().get(0).getBooks());
//        System.out.println(bookDao.findAllBooks());
//        Book b  = bookDao.findById(1);
//        b.setSummary("best best best");
//        if(bookDao.saveBook(b)){
//            System.out.println("saved");
//        }
//        else{
//            System.out.println("not saved");
//        }
//        if(bookDao.updateBook(b)){
//            System.out.println("updated");
//        }
//        else{
//            System.out.println("not updated");
//        }
        return "index";
    }
    
}
