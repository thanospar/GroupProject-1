package com.group.groupproject.services.category;

import com.group.groupproject.entities.Category;
import java.util.List;

/**
 *
 * @author filippos
 */
public interface CategoryService {

    Category findById(int id);

    List<Category> findAllCategories();

    boolean saveCategory(Category category);

    boolean updateCategory(Category category);

    boolean deleteCategory(Category category);
}
