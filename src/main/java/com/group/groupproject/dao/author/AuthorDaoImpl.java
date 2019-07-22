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
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class AuthorDaoImpl extends AbstractDao<Integer, Author> implements AuthorDao {

    @Override
    public Author findById(int id) {
        return getByKey(id);
    }

    @Override
    public List<Author> findByLastName(String search) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.ilike("lastName", search,MatchMode.ANYWHERE));
        return (List<Author>) criteria.list();
    }
    
    @Override
    public List<Author> findAllAuthors() {
        Criteria criteria = createEntityCriteria();
        return (List<Author>) criteria.list();
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
