package com.firstDemo.pring_boot_demo.service;

import com.firstDemo.pring_boot_demo.model.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> findAll();
    Customer findById(int id);
    Customer save(Customer customer);
    void deleteById(int id);
}
