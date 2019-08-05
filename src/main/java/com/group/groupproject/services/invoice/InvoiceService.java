package com.group.groupproject.services.invoice;

import com.group.groupproject.entities.Book;
import com.group.groupproject.entities.Invoice;
import com.group.groupproject.entities.user.User;
import java.util.List;

public interface InvoiceService {

    Invoice findById(int id);

    List<Invoice> findAllInvoices();
    List<Invoice> findByUser(User user);
    
    List<Book> findBooksBought(User user);
    
    boolean saveInvoice(User user, String ids);

    boolean updateInvoice(Invoice invoice);

    boolean deleteInvoice(Invoice invoice);
}
