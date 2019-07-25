
package com.group.groupproject.dao.bought;

import com.group.groupproject.dao.AbstractDao;
import com.group.groupproject.entities.Bought;
import java.util.List;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

@Repository("boughtDao")
public class BoughtDaoImpl extends AbstractDao<Integer, Bought> implements BoughtDao {

    @Override
    public Bought findById(int id) {
        return getByKey(id);
    }

    @SuppressWarnings("unchecked")
    public List<Bought> findAllBoughts() {
        Criteria criteria = createEntityCriteria();
        return (List<Bought>) criteria.list();
    }

    @Override
    public boolean saveBought(Bought bought) {
        return persist(bought);
    }

    @Override
    public boolean updateBought(Bought bought) {
        return update(bought);
    }

    @Override
    public boolean deleteBought(Bought bought) {
        return delete(bought);
    }
    
}
