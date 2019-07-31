package com.group.groupproject.dao.book;

import com.group.groupproject.dao.AbstractDao;
import com.group.groupproject.entities.Book;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository("bookDao")
public class BookDaoImpl extends AbstractDao<Integer, Book> implements BookDao {

    @Override
    public List<Book> findByTitleOrISBN(String search) {
        Criteria criteria = createEntityCriteria();

        criteria.add(Restrictions.or(Restrictions.ilike("title", search, MatchMode.ANYWHERE),
                Restrictions.eq("isbn", search)));
        List<Book> books = (List<Book>) criteria.list();

        for (int i = 0; i < books.size(); i++) {
            Hibernate.initialize(books.get(i).getAuthors());
            Hibernate.initialize(books.get(i).getCategories());
        }
        return books;
    }

    @Override
    public List<String> findBookSeries() {
        Criteria criteria = createEntityCriteria();
        criteria.setProjection(Projections.distinct(Projections.property("bookSeries")));
        return (List<String>) criteria.list();
    }
    
    @Override
    public List<String> findBookSpecials() {
        Criteria criteria = createEntityCriteria();
        criteria.setProjection(Projections.distinct(Projections.property("special")));
        return (List<String>) criteria.list();
    }

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
        List<Book> books = (List<Book>) criteria.list();

        for (int i = 0; i < books.size(); i++) {
            Hibernate.initialize(books.get(i).getAuthors());
            Hibernate.initialize(books.get(i).getCategories());
        }
        return books;
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
