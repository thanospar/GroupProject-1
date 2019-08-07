package com.group.groupproject.controllers;

import com.group.groupproject.entities.Invoice;
import com.group.groupproject.services.invoice.InvoiceService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author filippos
 */
@Controller
@RequestMapping("/invoices/")
public class InvoiceController {
    
    @Autowired
    private InvoiceService invoiceservice;
    
    @GetMapping
    public String findAllInvoices(ModelMap model, @ModelAttribute("isDone") String isDone) {
        List<Invoice> invoices = invoiceservice.findAllInvoices();
        model.addAttribute("invoices", invoices);
        return "invoice/listofinvoices";
    }
    
    
}
