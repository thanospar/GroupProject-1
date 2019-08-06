package com.group.groupproject.services.publisher;

import com.group.groupproject.dao.publisher.PublisherDao;
import com.group.groupproject.entities.Publisher;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author filippos
 */
@Service
public class PublisherServiceImpl implements PublisherService{
    
    @Autowired
    private PublisherDao publisherdao;

    @Override
    @Transactional
    public Publisher findById(int id) {
        return publisherdao.findById(id);
    }

    @Override
    @Transactional
    public List<Publisher> findAllPublishers() {
        return publisherdao.findAllPublishers();
    }

    @Override
    @Transactional
    public boolean savePublisher(Publisher publisher) {
        return publisherdao.savePublisher(publisher);
    }

    @Override
    @Transactional
    public boolean updatePublisher(Publisher publisher) {
        return publisherdao.updatePublisher(publisher);
    }

    @Override
    @Transactional
    public boolean deletePublisher(Publisher publisher) {
        return publisherdao.deletePublisher(publisher);
    }
    
}
