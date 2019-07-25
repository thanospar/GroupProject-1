package com.group.groupproject.dao;

import java.io.Serializable;

import java.lang.reflect.ParameterizedType;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class AbstractDao<PK extends Serializable, T> {

    private final Class<T> persistentClass;

    @SuppressWarnings("unchecked")
    public AbstractDao() {
        this.persistentClass = (Class<T>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[1];
    }

    @Autowired
    private SessionFactory sessionFactory;

    protected Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @SuppressWarnings("unchecked")
    public T getByKey(PK key) {
        return (T) getSession().get(persistentClass, key);
    }

    public boolean persist(T entity) {
        boolean ok = false;
        try {
            getSession().persist(entity);
            ok = true;
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return ok;
    }

    public boolean update(T entity) {
        boolean ok = false;
        try {
            getSession().update(entity);
            ok = true;
        } catch (HibernateException e) {
        }
        return ok;
    }

    public boolean delete(T entity) {
        boolean ok = false;
        try {
            getSession().delete(entity);
            ok = true;
        } catch (HibernateException e) {
        }
        return ok;
    }

    protected Criteria createEntityCriteria() {
        return getSession().createCriteria(persistentClass);
    }

}
