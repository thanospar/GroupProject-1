package com.group.groupproject.services;

import com.group.groupproject.entities.Book;
import java.util.List;

public interface BookService {

    Book findById(int id);

    List<Book> findAllBooks();

    List<Book> findByTitleOrISBN(String search);

    List<String> findBookSeries();
    
    List<String> findBookSpecials();
    
    List<Book> findBooksToBuy(String ids);
    
    boolean saveBook(Book book);

    boolean updateBook(Book book);

    boolean deleteBook(Book book);
}
