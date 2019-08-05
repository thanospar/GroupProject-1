package com.group.groupproject.services.invoice;

import com.group.groupproject.entities.Invoice;
import com.group.groupproject.entities.user.User;
import java.util.List;

public interface InvoiceService {

    Invoice findById(int id);

    List<Invoice> findAllInvoices();

    boolean saveInvoice(User user, String ids);

    boolean updateInvoice(Invoice invoice);

    boolean deleteInvoice(Invoice invoice);
}
