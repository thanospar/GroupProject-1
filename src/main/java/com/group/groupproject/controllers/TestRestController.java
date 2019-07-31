
package com.group.groupproject.controllers;

import com.group.groupproject.entities.Book;
import com.group.groupproject.entities.ChatMessage;
import com.group.groupproject.services.BookService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequestMapping("/chatapi")
public class TestRestController {
    
    List<ChatMessage> chatMessages = new ArrayList();
    
    @Autowired
    private BookService bookservice;
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ResponseEntity<List<Book>> listAllChats() {
        
        List<Book> bs = bookservice.findAllBooks();
        
        return new ResponseEntity<List<Book>>(bs, HttpStatus.OK);
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ResponseEntity<Void> createChatMessage(@RequestBody ChatMessage chatMessage, UriComponentsBuilder ucBuilder) {
        chatMessages.add(chatMessage);

        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/chatapi/").buildAndExpand().toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

}
