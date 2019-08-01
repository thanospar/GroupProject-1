package com.group.groupproject.services;

import com.group.groupproject.dao.book.BookDao;
import com.group.groupproject.entities.Book;
import java.util.List;
import java.util.stream.Collectors;
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
    public List<String> findBookSeries() {
        //epistrefei se distinct lista ta bookseries
        List<String> list= bookdao.findBookSeries();
        //aferoume ta null
        while (list.remove(null));
        return list;
    }
    
    @Override
    @Transactional
    public List<String> findBookSpecials() {
        //epistrefei se distinct lista ta bookseries
        List<String> list= bookdao.findBookSpecials();
        //aferoume ta null
        while (list.remove(null));
        return list;
    }
    
    @Override
    @Transactional
    public List<Book> findBooksToBuy(String ids) {
        String[] idsArray = ids.split(",");
        Integer[] idsInt = new Integer[idsArray.length];
        for (int i=0; i<idsArray.length; i++){
            idsInt[i] = Integer.parseInt(idsArray[i]);
        }
        return bookdao.findBooksToBuy(idsInt);
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
