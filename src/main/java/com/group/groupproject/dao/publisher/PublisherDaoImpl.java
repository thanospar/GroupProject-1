package com.group.groupproject.dao.publisher;

import com.group.groupproject.dao.AbstractDao;
import com.group.groupproject.entities.Publisher;
import java.util.List;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("publisherDao")
@Transactional
public class PublisherDaoImpl extends AbstractDao<Integer, Publisher> implements PublisherDao {

    @Override
    public Publisher findById(int id) {
        return getByKey(id);
    }

    @SuppressWarnings("unchecked")
    public List<Publisher> findAllPublishers() {
        Criteria criteria = createEntityCriteria();
        return (List<Publisher>) criteria.list();
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
