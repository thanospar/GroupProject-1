
package com.group.groupproject.dao.book;

import java.util.List;
import com.group.groupproject.entities.Book;

public interface BookDao {
    
    Book findById(int id);
    List<Book> findAllBooks();
    List<Book> findByName(String search);
    boolean saveBook(Book book);
    boolean updateBook(Book book); 
    boolean deleteBook(Book book);

}
