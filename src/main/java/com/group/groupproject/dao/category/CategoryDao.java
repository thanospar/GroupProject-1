
package com.group.groupproject.dao.category;

import com.group.groupproject.entities.Category;
import java.util.List;

public interface CategoryDao {
    
    Category findById(int id);
    List<Category> findAllCategories();
    boolean saveCategory(Category category);
    boolean updateCategory(Category category); 
    boolean deleteCategory(Category category);
}
