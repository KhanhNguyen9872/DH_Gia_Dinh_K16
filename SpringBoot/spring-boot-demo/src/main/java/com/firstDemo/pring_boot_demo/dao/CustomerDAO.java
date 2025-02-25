package com.firstDemo.pring_boot_demo.dao;


import com.firstDemo.pring_boot_demo.model.Customer;

import java.util.List;

public interface CustomerDAO {
    List<Customer> findAll();
    Customer findById(int id);
    Customer save(Customer customer);
    void deleteById(int id);
}
