package com.group.groupproject.converter;

import com.group.groupproject.entities.Publisher;
import com.group.groupproject.services.PublisherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class PublisherFromFormToEntity implements Converter<Object, Publisher> {

    @Autowired
    PublisherService publisherService;

    @Override
    public Publisher convert(Object s) {
        Integer id = Integer.parseInt((String) s);
        Publisher publisher = publisherService.findById(id);
        return publisher;
    }

}
