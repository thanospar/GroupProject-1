
package com.group.groupproject.entities;

import com.group.groupproject.converter.LocalDatePersistenceConverter;
import com.group.groupproject.entities.user.User;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "invoices")
public class Invoice implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "invoice_id", nullable = false)
    private Integer id;
    
    @Column(name = "date", nullable = true)
    @Convert(converter = LocalDatePersistenceConverter.class)
    private LocalDate date;
        
    @ManyToOne(optional = false)
    @JoinColumn(name = "user_id")
    private User user;
    
    @OneToMany(mappedBy = "invoice", cascade = CascadeType.ALL)
    private List<Bought> boughts;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Bought> getBoughts() {
        return boughts;
    }

    public void setBoughts(List<Bought> boughts) {
        this.boughts = boughts;
    }


    @Override
    public String toString() {
        return "Invoice{" + "id=" + id + ", date=" + date + ", user=" + user + '}';
    }
    
    
}
