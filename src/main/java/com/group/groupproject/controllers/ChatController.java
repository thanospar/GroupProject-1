package com.group.groupproject.controllers;

import com.group.groupproject.entities.Book;
import com.group.groupproject.entities.ChatMessage;
import com.group.groupproject.services.BookService;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
@RequestMapping("/chat/")
public class ChatController {

    
    List<ChatMessage> chatMessages = new ArrayList();

    @RequestMapping(method = RequestMethod.GET)
    public String serveMessages(ModelMap model) {

    chatMessages.add(new ChatMessage("ilias","minima minasd sadsadas saddsaas saddas","Sales"));
    chatMessages.add(new ChatMessage("dimitris","minima","Sales"));
        ChatMessage cmessage = new ChatMessage();
        JSONArray messages = new JSONArray(chatMessages);
        
        model.addAttribute("messages", messages);
        model.addAttribute("cmessage", cmessage);
        return "/chat/index";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String postMessage(@ModelAttribute("cmessage") ChatMessage cmessage, ModelMap model) {

        chatMessages.add(cmessage);
        return "redirect:/chat/";
    }

}
