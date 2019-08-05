
package com.group.groupproject.dao.invoice;

import com.group.groupproject.dao.AbstractDao;
import com.group.groupproject.entities.Invoice;
import com.group.groupproject.entities.user.User;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;


@Repository("invoiceDao")
public class InvoiceDaoImpl extends AbstractDao<Integer, Invoice> implements InvoiceDao  {

    @Override
    public Invoice findById(int id) {
        Invoice invoice = getByKey(id);
        if(invoice != null){
            Hibernate.initialize(invoice.getBoughts());
        }
        return getByKey(id);
    }

    @SuppressWarnings("unchecked")
    public List<Invoice> findAllInvoices() {
        
        Criteria criteria = createEntityCriteria();
        return (List<Invoice>) criteria.list();
    }

    @Override
    public List<Invoice> findByUser(User user) {
        
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("user.id", user.getId()));
        List<Invoice> invoices = criteria.list();
        for (int i = 0; i < invoices.size(); i++) {
            Hibernate.initialize(invoices.get(i).getBoughts());
        }
        
        return invoices;
    }
    
    @Override
    public boolean saveInvoice(Invoice invoice) {
        return persist(invoice);
    }

    @Override
    public boolean updateInvoice(Invoice invoice) {
        return update(invoice);
    }

    @Override
    public boolean deleteInvoice(Invoice invoice) {
        return delete(invoice);
    }

    
}
