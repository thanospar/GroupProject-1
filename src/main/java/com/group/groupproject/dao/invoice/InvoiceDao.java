
package com.group.groupproject.dao.invoice;

import com.group.groupproject.entities.Invoice;
import com.group.groupproject.entities.user.User;
import java.util.List;

public interface InvoiceDao {
    
    Invoice findById(int id);
    List<Invoice> findAllInvoices();
    List<Invoice> findByUser(User user);
    boolean saveInvoice(Invoice invoice);
    boolean updateInvoice(Invoice invoice); 
    boolean deleteInvoice(Invoice invoice);
}
