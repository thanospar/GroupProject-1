
package com.group.groupproject.dao.quantity;

import com.group.groupproject.entities.Quantity;

public interface QuantityDao {
    
    Quantity findById(int id);
//    List<Quantity> findAllQuantity();
    boolean saveQuantity(Quantity quantity);
    boolean updateQuantity(Quantity quantity); 
    boolean deleteQuantity(Quantity quantity);
}
