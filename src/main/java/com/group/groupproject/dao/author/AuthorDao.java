
package com.group.groupproject.dao.author;

import com.group.groupproject.entities.Author;
import java.util.List;

public interface AuthorDao {
    
    Author findById(int id);
    List<Author> findAllAuthors();
    List<Author> findByLastName(String search);
    boolean saveAuthor(Author author);
    boolean updateAuthor(Author author); 
    boolean deleteAuthor(Author author);

}
