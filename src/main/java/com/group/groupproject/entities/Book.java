package com.group.groupproject.entities;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "books")
public class Book implements Serializable {
    
//    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "book_id", nullable = false)
    private Integer id;

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "summary")
    private String summary;

    @Column(name = "isbn", nullable = false)
    private String isbn;

    @Column(name = "cover", nullable = false)
    private String cover;

    @Column(name = "year_published", nullable = false)
    private int yearPublished;

    @Column(name = "url_path")
    private String urlPath;

    @Column(name = "publisher_id", nullable = false)
    private int publisherId;

    @Column(name = "book_series_id", nullable = false)
    private int bookSeriesId;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "written_by", 
             joinColumns = { @JoinColumn(name = "book_id") }, 
             inverseJoinColumns = { @JoinColumn(name = "author_id") })
    private Set<Author> authors = new HashSet();
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public int getYearPublished() {
        return yearPublished;
    }

    public void setYearPublished(int yearPublished) {
        this.yearPublished = yearPublished;
    }

    public String getUrlPath() {
        return urlPath;
    }

    public void setUrlPath(String urlPath) {
        this.urlPath = urlPath;
    }

    public int getPublisherId() {
        return publisherId;
    }

    public void setPublisherId(int publisherId) {
        this.publisherId = publisherId;
    }

    public int getBookSeriesId() {
        return bookSeriesId;
    }

    public void setBookSeriesId(int bookSeriesId) {
        this.bookSeriesId = bookSeriesId;
    }

    public Set<Author> getAuthors() {
        return authors;
    }

    public void setAuthors(Set<Author> authors) {
        this.authors = authors;
    }

    @Override
    public String toString() {
        return "Book{" + "id=" + id + ", title=" + title + ", summary=" + summary + ", isbn=" + isbn + ", cover=" + cover + ", yearPublished=" + yearPublished + ", urlPath=" + urlPath + ", publisherId=" + publisherId + ", bookSeriesId=" + bookSeriesId + '}';
    }

}
