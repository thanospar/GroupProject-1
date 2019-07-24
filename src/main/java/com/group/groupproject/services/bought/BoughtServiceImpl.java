
package com.group.groupproject.services.bought;

import com.group.groupproject.dao.bought.BoughtDao;
import com.group.groupproject.entities.Bought;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boughtService")
public class BoughtServiceImpl implements BoughtService{

    @Autowired
    BoughtDao boughtDao;
    
    @Override
    public Bought findById(int id) {
        return boughtDao.findById(id);
    }

    @Override
    public List<Bought> findAllBoughts() {
        return boughtDao.findAllBoughts();
    }

    @Override
    public boolean saveBought(Bought bought) {
        return boughtDao.saveBought(bought);
    }

    @Override
    public boolean updateBought(Bought bought) {
        return boughtDao.updateBought(bought);
    }

    @Override
    public boolean deleteBought(Bought bought) {
        return boughtDao.deleteBought(bought);
    }
    
}
