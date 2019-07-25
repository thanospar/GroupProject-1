
package com.group.groupproject.dao.invoice;

import com.group.groupproject.entities.Invoice;
import java.util.List;

public interface InvoiceDao {
    
    Invoice findById(int id);
    List<Invoice> findAllInvoices();
    boolean saveInvoice(Invoice invoice);
    boolean updateInvoice(Invoice invoice); 
    boolean deleteInvoice(Invoice invoice);
}
