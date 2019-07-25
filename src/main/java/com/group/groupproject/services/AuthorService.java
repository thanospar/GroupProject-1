
package com.group.groupproject.services;

import com.group.groupproject.entities.Author;
import java.util.List;

public interface AuthorService {

    Author findById(int id);

    List<Author> findAllAuthors();

    List<Author> findByLastName(String search);

    boolean saveAuthor(Author author);

    boolean updateAuthor(Author author);

    boolean deleteAuthor(Author author);
}
