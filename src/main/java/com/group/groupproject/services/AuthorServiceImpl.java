package com.group.groupproject.services;

import com.group.groupproject.dao.author.AuthorDao;
import com.group.groupproject.entities.Author;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author filippos
 */
@Service
public class AuthorServiceImpl implements AuthorService{
    
    @Autowired
    private AuthorDao authorDao;

    @Override
    @Transactional
    public Author findById(int id) {
        return authorDao.findById(id);
    }

    @Override
    @Transactional
    public List<Author> findAllAuthors() {
        return authorDao.findAllAuthors();
    }

    @Override
    @Transactional
    public boolean saveAuthor(Author author) {
        return authorDao.saveAuthor(author);
    }

    @Override
    @Transactional
    public boolean updateAuthor(Author author) {
        return authorDao.updateAuthor(author);
    }

    @Override
    @Transactional
    public boolean deleteAuthor(Author author) {
        return authorDao.deleteAuthor(author);
    }
    
}
