package com.firstDemo.pring_boot_demo.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "customers")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @NotNull(message = "Name of Company is required")
    @Size(min = 1, message = "Name of Company is required")
    @Column(name = "name_of_company")
    private String nameOfCompany;

    @NotNull(message = "Street address is required")
    @Size(min = 1, message = "Street address is required")
    @Column(name = "street_address")
    private String streetAddress;

    @NotNull(message = "City is required")
    @Size(min = 1, message = "City is required")
    @Pattern(regexp = "^[a-zA-ZÀ-ỹ\\s]+$", message = "City must not contain numbers.")
    @Column(name = "city")
    private String city;

    @NotNull(message = "Country is required")
    @Size(min = 1, message = "Country is required")
    @Column(name = "country")
    private String country;

    @NotNull(message = "PostalCode is required")
    @Size(min = 1, message = "PostalCode is required")
    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*\\d)[a-zA-Z0-9\\-\\s]+$", message = "PostalCode must contain both letters and numbers.")
    @Column(name = "postal_code")
    private String postalCode;

    @NotNull(message = "Region is required")
    @Size(min = 1, message = "Region is required")
    @Pattern(regexp = "^[a-zA-ZÀ-ỹ\\s]+$", message = "Region must not contain numbers.")
    @Column(name = "region")
    private String region;

    public Customer(int id, String nameOfCompany, String streetAddress, String city, String region, String postalCode, String country) {
        this.id = id;
        this.nameOfCompany = nameOfCompany;
        this.streetAddress = streetAddress;
        this.city = city;
        this.region = region;
        this.postalCode = postalCode;
        this.country = country;
    }

    public Customer() {

    }

    public String getNameOfCompany() {
        return nameOfCompany;
    }

    public void setNameOfCompany(String nameOfCompany) {
        this.nameOfCompany = nameOfCompany;
    }

    public String getStreetAddress() {
        return streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }
}
