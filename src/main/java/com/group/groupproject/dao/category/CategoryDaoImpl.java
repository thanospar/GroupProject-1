/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group.groupproject.dao.category;

import com.group.groupproject.dao.AbstractDao;
import com.group.groupproject.entities.Category;
import java.util.List;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("categoryDao")
@Transactional
public class CategoryDaoImpl extends AbstractDao<Integer, Category> implements CategoryDao {

    @Override
    public Category findById(int id) {
        return getByKey(id);
    }

    @SuppressWarnings("unchecked")
    public List<Category> findAllCategories() {
        Criteria criteria = createEntityCriteria();
        return (List<Category>) criteria.list();
    }

    @Override
    public boolean saveCategory(Category category) {
        return persist(category);
    }

    @Override
    public boolean updateCategory(Category category) {
        return update(category);
    }

    @Override
    public boolean deleteCategory(Category category) {
        return delete(category);
    }
    
}
