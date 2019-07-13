
package com.group.groupproject.dao.book;

import java.util.List;
import com.group.groupproject.entities.Book;

public interface BookDao {
    
    Book findById(int id);
    List<Book> findAllBooks();
    void saveBook(Book book);
    void updateBook(Book book); 
    void deleteBook(Book book);

}
