
package com.group.groupproject.dao.publisher;

import java.util.List;
import com.group.groupproject.entities.Publisher;

public interface PublisherDao {
    
    Publisher findById(int id);
    List<Publisher> findAllPublishers();
    boolean savePublisher(Publisher publisher);
    boolean updatePublisher(Publisher publisher); 
    boolean deletePublisher(Publisher publisher);

}
