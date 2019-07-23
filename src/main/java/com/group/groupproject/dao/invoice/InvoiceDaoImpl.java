
package com.group.groupproject.dao.invoice;

import com.group.groupproject.dao.AbstractDao;
import com.group.groupproject.entities.Invoice;
import java.util.List;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;


@Repository("invoiceDao")
public class InvoiceDaoImpl extends AbstractDao<Integer, Invoice> implements InvoiceDao  {

    @Override
    public Invoice findById(int id) {
        return getByKey(id);
    }

    @SuppressWarnings("unchecked")
    public List<Invoice> findAllInvoices() {
        
        Criteria criteria = createEntityCriteria();
        return (List<Invoice>) criteria.list();
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
