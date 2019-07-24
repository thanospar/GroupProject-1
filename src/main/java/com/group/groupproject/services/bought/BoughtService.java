
package com.group.groupproject.services.bought;

import com.group.groupproject.entities.Bought;
import java.util.List;

public interface BoughtService {
    
    Bought findById(int id);

    List<Bought> findAllBoughts();

    boolean saveBought(Bought bought);

    boolean updateBought(Bought bought);

    boolean deleteBought(Bought bought);
}
