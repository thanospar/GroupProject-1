/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group.groupproject.dao.author;

import com.group.groupproject.dao.AbstractDao;
import com.group.groupproject.entities.Author;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class AuthorDaoImpl extends AbstractDao<Integer, Author> implements AuthorDao {

    @Override
    public Author findById(int id) {
        Author a =  getByKey(id);
        if (a != null) {
            Hibernate.initialize(a.getBooks());
        }
        return a;
    }

    @Override
    public List<Author> findByLastName(String search) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.ilike("lastName", search,MatchMode.ANYWHERE));
        return (List<Author>) criteria.list();
    }
    
    @SuppressWarnings("unchecked")
    public List<Author> findAllAuthors() {
        Criteria criteria = createEntityCriteria();
        List<Author> authors =  (List<Author>) criteria.list();
        for (int i = 0; i < authors.size(); i++) {
            Hibernate.initialize(authors.get(i).getBooks());
        }
        return authors;
    }

    @Override
    public boolean saveAuthor(Author author) {
        return persist(author);
    }

    @Override
    public boolean updateAuthor(Author author) {
        return update(author);
    }

    @Override
    public boolean deleteAuthor(Author author) {
        return delete(author);
    }
    
}
