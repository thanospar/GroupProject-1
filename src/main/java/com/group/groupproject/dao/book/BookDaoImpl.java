package com.group.groupproject.dao.book;

import com.group.groupproject.dao.AbstractDao;
import com.group.groupproject.entities.Book;
import java.util.List;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("bookDao")
@Transactional
public class BookDaoImpl extends AbstractDao<Integer, Book> implements BookDao {

    @Override
    public Book findById(int id) {
        return getByKey(id);
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
