package com.firstDemo.pring_boot_demo.dao;

import com.firstDemo.pring_boot_demo.model.Customer;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class CustomerDAOImpl implements CustomerDAO {
    private EntityManager em;
    @Autowired
    public CustomerDAOImpl(EntityManager em) {
        this.em = em;
    }

    @Override
    public List<Customer> findAll() {
        TypedQuery<Customer> query = em.createQuery("from Customer", Customer.class);
        return query.getResultList();
    }

    @Override
    public Customer findById(int id) {
        return em.find(Customer.class, id);
    }

    @Override
    @Transactional
    public Customer save(Customer customer) {
        Customer saved = em.merge(customer);

        return saved;
    }

    @Override
    @Transactional
    public void deleteById(int id) {
        Customer customer = em.find(Customer.class, id);
        em.remove(customer);
    }
}
