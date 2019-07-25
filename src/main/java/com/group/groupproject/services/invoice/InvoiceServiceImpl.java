package com.group.groupproject.services.invoice;

import com.group.groupproject.dao.invoice.InvoiceDao;
import com.group.groupproject.entities.Invoice;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("invoiceService")
public class InvoiceServiceImpl implements InvoiceService {
    
    @Autowired
    private InvoiceDao invoicedao;

    @Override
    @Transactional
    public Invoice findById(int id) {
        return invoicedao.findById(id);
    }

    @Override
    @Transactional
    public List<Invoice> findAllInvoices() {
        return invoicedao.findAllInvoices();
    }

    @Override
    @Transactional
    public boolean saveInvoice(Invoice invoice) {
        return invoicedao.saveInvoice(invoice);
    }

    @Override
    @Transactional
    public boolean updateInvoice(Invoice invoice) {
        return invoicedao.updateInvoice(invoice);
    }

    @Override
    @Transactional
    public boolean deleteInvoice(Invoice invoice) {
        return invoicedao.deleteInvoice(invoice);
    }

    
    
}
