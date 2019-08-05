package com.group.groupproject.services.invoice;

import com.group.groupproject.dao.invoice.InvoiceDao;
import com.group.groupproject.entities.Book;
import com.group.groupproject.entities.Bought;
import com.group.groupproject.entities.Invoice;
import com.group.groupproject.entities.user.User;
import com.group.groupproject.services.BookService;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("invoiceService")
public class InvoiceServiceImpl implements InvoiceService {

    @Autowired
    private InvoiceDao invoicedao;
    
    @Autowired
    private BookService bookService;

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
    public boolean saveInvoice(User user, String ids) {

        Invoice invoice = new Invoice();
        invoice.setDate(LocalDate.now());
        invoice.setUser(user);
        List<Book> books = bookService.findBooksToBuy(ids);
        
        List<Bought> boughts = new ArrayList();
        for (Book b : books){
            boughts.add(new Bought(b.getPrice(),b,invoice));
        }
        invoice.setBoughts(boughts);
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
