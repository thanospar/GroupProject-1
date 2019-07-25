package com.group.groupproject.services;

import com.group.groupproject.dao.book.BookDao;
import com.group.groupproject.entities.Book;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("bookService")
public class BookServiceImpl implements BookService {
    
    @Autowired
    private BookDao bookdao;

    @Override
    @Transactional
    public List<Book> findByTitleOrISBN(String search) {
        return bookdao.findByTitleOrISBN(search);
    }
    
    @Override
    @Transactional
    public Book findById(int id) {
        return bookdao.findById(id);
    }

    @Override
    @Transactional
    public List<Book> findAllBooks() {
        return bookdao.findAllBooks();
    }

    @Override
    @Transactional
    public boolean saveBook(Book book) {
        return bookdao.saveBook(book);
    }

    @Override
    @Transactional
    public boolean updateBook(Book book) {
        return bookdao.updateBook(book);
    }

    @Override
    @Transactional
    public boolean deleteBook(Book book) {
        return bookdao.deleteBook(book);
    }

    
    
}
