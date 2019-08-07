package com.group.groupproject.converter;

import com.group.groupproject.entities.Publisher;
import com.group.groupproject.services.publisher.PublisherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class PublisherFromFormToEntity implements Converter<String, Publisher> {

    @Autowired
    PublisherService publisherService;

    @Override
    public Publisher convert(String s) {
        Integer id = Integer.parseInt(s);
        Publisher publisher = publisherService.findById(id);
        return publisher;
    }

}
