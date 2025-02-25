package com.firstDemo.pring_boot_demo.controller;

import com.firstDemo.pring_boot_demo.model.Customer;
import com.firstDemo.pring_boot_demo.service.CustomerService;
import jakarta.validation.Valid; // Import the @Valid annotation
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

@Controller
public class CustomerController {
    private List<String> countries = Arrays.asList("USA", "Canada", "United Kingdom", "Australia", "Germany", "India");
    private CustomerService customerService;
    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        binder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @GetMapping("/")
    public String list(Model model) {
        List<Customer> customers = customerService.findAll();
        model.addAttribute("customers", customers);
        return "list-customer";
    }

    @GetMapping("/customer-form")
    public String customerForm(@ModelAttribute("customer") Customer customer, Model model) {
        model.addAttribute("countries", countries);
        model.addAttribute("formAction", "/save");
        return "customerApplicationForm";
    }

    @GetMapping("/customer-form-update")
    public String customerFormUpdate(@RequestParam("id") int id, Model model) {
        Customer customer = customerService.findById(id);
        model.addAttribute("customer", customer);
        model.addAttribute("countries", countries);
        model.addAttribute("formAction", "/update");
        return "customerApplicationForm";
    }

    @GetMapping("/customer-form-delete")
    public String customerFormDelete(@RequestParam("id") int id, Model model) {
        customerService.deleteById(id);
        return "redirect:/";
    }

    @PostMapping("/update")
    public String processUpdate(
            @Valid @ModelAttribute("customer") Customer customer,
            BindingResult bindingResult,
            Model model
    ) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("customer", customer);
            model.addAttribute("countries", countries);
            model.addAttribute("formAction", "/update");
            return "customerApplicationForm";
        } else {
            Customer dbCustomer = customerService.findById(customer.getId());
            if (dbCustomer == null) {
                return "redirect:/";
            }

            dbCustomer.setNameOfCompany(customer.getNameOfCompany());
            dbCustomer.setStreetAddress(customer.getStreetAddress());
            dbCustomer.setCity(customer.getCity());
            dbCustomer.setRegion(customer.getRegion());
            dbCustomer.setPostalCode(customer.getPostalCode());
            dbCustomer.setCountry(customer.getCountry());

            customerService.save(dbCustomer);
            return "redirect:/";
        }
    }

    @PostMapping("/save")
    public String processSave(
            @Valid @ModelAttribute("customer") Customer customer,
            BindingResult bindingResult,
            Model model
    ) {
        if (bindingResult.hasErrors()) {
            return customerForm(customer, model);
        } else {
            customerService.save(customer);
            return "redirect:/";
        }
    }
}