
package com.group.groupproject.dao.bought;

import com.group.groupproject.entities.Bought;
import java.util.List;

public interface BoughtDao {
    
    Bought findById(int id);
    List<Bought> findAllBoughts();
    boolean saveBought(Bought bought);
    boolean updateBought(Bought bought); 
    boolean deleteBought(Bought bought);
}
