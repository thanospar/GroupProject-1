
package com.group.groupproject.entities;

public class ChatMessage {
    
    private String name;
    private String message;
    private String subject;
    public ChatMessage() {
    }

    public ChatMessage(String name, String message, String subject) {
        this.name = name;
        this.message = message;
        this.subject = subject;
    }
    
    
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    
    
    @Override
    public String toString() {
        return "ChatMessage{" + "name=" + name + ", message=" + message + '}';
    }
    
    
    
}
