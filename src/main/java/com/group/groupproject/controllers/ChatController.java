package com.group.groupproject.controllers;

import com.group.groupproject.entities.ChatMessage;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/chat/")
public class ChatController {

    List<ChatMessage> chatMessages = new ArrayList();

    @RequestMapping(method = RequestMethod.GET)
    public String serveMessages(ModelMap model) {
//        if (chatMessages.isEmpty()) {
//            chatMessages.add(new ChatMessage("ilias", "Hello how is going?", "Sales"));
//            chatMessages.add(new ChatMessage("giannis", "im fine, you?", "Sales"));
//        }
        ChatMessage cmessage = new ChatMessage();
        JSONArray messages = new JSONArray(chatMessages);

        model.addAttribute("messages", messages);
        model.addAttribute("cmessage", cmessage);
        return "/chat/chat";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String postMessage(@ModelAttribute("cmessage") ChatMessage cmessage, ModelMap model) {

        chatMessages.add(0, cmessage);
        return "redirect:/chat/";
    }

}
