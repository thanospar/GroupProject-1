package com.group.groupproject.dao.publisher;

import com.group.groupproject.dao.AbstractDao;
import com.group.groupproject.entities.Publisher;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.springframework.stereotype.Repository;

@Repository
public class PublisherDaoImpl extends AbstractDao<Integer, Publisher> implements PublisherDao {

    @Override
    public Publisher findById(int id) {
        Publisher p = getByKey(id);
        if (p != null) {
            Hibernate.initialize(p.getBooks());
        }
        return p;
    }

    @SuppressWarnings("unchecked")
    public List<Publisher> findAllPublishers() {
        Criteria criteria = createEntityCriteria();
        List<Publisher> publishers = (List<Publisher>) criteria.list();
        for (int i = 0; i < publishers.size(); i++) {
            Hibernate.initialize(publishers.get(i).getBooks());
        }
        return publishers;
    }

    @Override
    public boolean savePublisher(Publisher publisher) {
        return persist(publisher);
    }

    @Override
    public boolean updatePublisher(Publisher publisher) {
        return update(publisher);
    }

    @Override
    public boolean deletePublisher(Publisher publisher) {
        return delete(publisher);
    }

}
