
package com.group.groupproject.dao.quantity;

import com.group.groupproject.dao.AbstractDao;
import com.group.groupproject.entities.Quantity;

public class QuantityDaoImpl  extends AbstractDao<Integer, Quantity> implements QuantityDao {

    @Override
    public Quantity findById(int id) {
        return getByKey(id);
    }

    @Override
    public boolean saveQuantity(Quantity quantity) {
        return persist(quantity);
    }

    @Override
    public boolean updateQuantity(Quantity quantity) {
        return update(quantity);
    }

    @Override
    public boolean deleteQuantity(Quantity quantity) {
        return delete(quantity);
    }
    
}
