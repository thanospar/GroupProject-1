package com.group.groupproject.services;

import com.group.groupproject.entities.Publisher;
import java.util.List;

/**
 *
 * @author filippos
 */
public interface PublisherService {

    Publisher findById(int id);

    List<Publisher> findAllPublishers();

    boolean savePublisher(Publisher publisher);

    boolean updatePublisher(Publisher publisher);

    boolean deletePublisher(Publisher publisher);
}
