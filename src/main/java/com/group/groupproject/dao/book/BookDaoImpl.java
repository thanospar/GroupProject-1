package com.group.groupproject.dao.book;

import com.group.groupproject.dao.AbstractDao;
import com.group.groupproject.entities.Book;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("bookDao")
public class BookDaoImpl extends AbstractDao<Integer, Book> implements BookDao {

    @Override
    public Book findById(int id) {
        Book b = getByKey(id);
        if (b != null) {
            Hibernate.initialize(b.getAuthors());
            
            Hibernate.initialize(b.getCategories());
        }
        return b;
    }

    @SuppressWarnings("unchecked")
    public List<Book> findAllBooks() {
        Criteria criteria = createEntityCriteria();
        return (List<Book>) criteria.list();
    }

    @Override
    public boolean saveBook(Book book) {
        return persist(book);
    }

    @Override
    public boolean updateBook(Book book) {
        return update(book);
    }

    @Override
    public boolean deleteBook(Book book) {
        return delete(book);
    }

}
