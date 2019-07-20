package com.group.groupproject.services;

import com.group.groupproject.entities.Author;
import java.util.List;

/**
 *
 * @author filippos
 */
public interface AuthorService {

    Author findById(int id);

    List<Author> findAllAuthors();

    boolean saveAuthor(Author author);

    boolean updateAuthor(Author author);

    boolean deleteAuthor(Author author);
}
