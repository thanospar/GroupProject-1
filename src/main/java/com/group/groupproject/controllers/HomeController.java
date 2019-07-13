
package com.group.groupproject.controllers;

import com.group.groupproject.dao.book.BookDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HomeController {
    
//    @Autowired
//    BookDao bookDao;
    
    @RequestMapping(method = RequestMethod.GET)
    public String sayHello(ModelMap model) {
//        System.out.println(bookDao.findAllBooks());
        
        return "index";
    }
    
}
