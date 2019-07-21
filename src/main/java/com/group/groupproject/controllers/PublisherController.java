package com.group.groupproject.controllers;

import com.group.groupproject.entities.Category;
import com.group.groupproject.entities.Publisher;
import com.group.groupproject.services.PublisherService;
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
public class PublisherController {

    @Autowired
    private PublisherService publisherservice;

    @GetMapping("publishers")
    public String findAllPublishers(ModelMap model) {
        List<Publisher> publishers = publisherservice.findAllPublishers();
        model.addAttribute("publishers", publishers);
        return "/publisher/listofpublishers";
    }
    
    @GetMapping("publishers/{publisherid}")
    public String findPublisher(ModelMap model, @PathVariable("publisherid") int id) {
        Publisher publisher = publisherservice.findById(id);
        model.addAttribute("publisher", publisher);
        return "/publisher/showpublisher";
    }
    
    @GetMapping("publishers/formAddPublisher")
    public String showFormForAdd(ModelMap model) {
        Publisher publisher = new Publisher();
        model.addAttribute("publisher", publisher);
        return "/publisher/publisherform";
    }
    
    @PostMapping("publishers/formAddPublisher")
    public String savePublisher(ModelMap model, @ModelAttribute("publisher") Publisher publisher) {
        String isDone;
        if (publisherservice.savePublisher(publisher)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/publisher/listofpublishers";
    }
    
    @GetMapping("publishers/formUpdatePublisher/{publisherid}")
    public String showFormForUpdate(ModelMap model, @PathVariable("publisherid") int id) {
        Publisher publisher = publisherservice.findById(id);
        model.addAttribute("publisher", publisher);
        return "/publisher/publisherformUpdate";
    }
    
    @PostMapping("publishers/formUpdatePublisher")
    public String updatePublisher(ModelMap model, @ModelAttribute("publisher") Publisher publisher) {
        String isDone;
        if (publisherservice.updatePublisher(publisher)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/publisher/listofpublishers";
    }
    
    @GetMapping("publishers/deletePublisher/{publisherid}")
    public String deleteCategory(ModelMap model, @PathVariable("publisherid") int id) {
        Publisher publisher = publisherservice.findById(id);
        String isDone;
        if (publisherservice.deletePublisher(publisher)) {
            isDone = "Success";
        } else {
            isDone = "NOT Success";
        }
        model.addAttribute("isDone", isDone);
        return "redirect:/publisher/listofpublishers";
    }

}
