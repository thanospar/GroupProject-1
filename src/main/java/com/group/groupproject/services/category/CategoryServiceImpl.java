package com.group.groupproject.services.category;

import com.group.groupproject.dao.category.CategoryDao;
import com.group.groupproject.entities.Category;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author filippos
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryDao categorydao;

    @Override
    @Transactional
    public Category findById(int id) {
        return categorydao.findById(id);
    }

    @Override
    @Transactional
    public List<Category> findAllCategories() {
        return categorydao.findAllCategories();
    }

    @Override
    @Transactional
    public boolean saveCategory(Category category) {
        return categorydao.saveCategory(category);
    }

    @Override
    @Transactional
    public boolean updateCategory(Category category) {
        return categorydao.updateCategory(category);
    }

    @Override
    @Transactional
    public boolean deleteCategory(Category category) {
        return categorydao.deleteCategory(category);
    }

}
