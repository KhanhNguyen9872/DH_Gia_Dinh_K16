package com.firstDemo.pring_boot_demo.service;

import com.firstDemo.pring_boot_demo.dao.CustomerDAO;
import com.firstDemo.pring_boot_demo.model.Customer;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CustomerServiceImpl implements CustomerService {
    private CustomerDAO customerDAO;
    @Autowired
    public CustomerServiceImpl(CustomerDAO customerDAO) {
        this.customerDAO = customerDAO;
    }

    @Override
    public List<Customer> findAll() {
        return customerDAO.findAll();
    }

    @Override
    public Customer findById(int id) {
        return customerDAO.findById(id);
    }

    @Override
    public Customer save(Customer customer) {
        return customerDAO.save(customer);
    }

    @Override
    @Transactional
    public void deleteById(int id) {
        customerDAO.deleteById(id);
    }
}
