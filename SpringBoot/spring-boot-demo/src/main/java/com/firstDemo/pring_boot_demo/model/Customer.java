package com.firstDemo.pring_boot_demo.model;

import jakarta.validation.constraints.*;

public class Customer {
    @NotNull(message = "Name of Company is required")
    @Size(min = 1, message = "Name of Company is required")
    private String nameOfCompany;

    @NotNull(message = "Street address is required")
    @Size(min = 1, message = "Street address is required")
    private String streetAddress;

    @NotNull(message = "City is required")
    @Size(min = 1, message = "City is required")
    @Pattern(regexp = "^[a-zA-ZÀ-ỹ\\s]+$", message = "City must not contain numbers.")
    private String city;

    @NotNull(message = "Country is required")
    @Size(min = 1, message = "Country is required")
    private String country;

    @NotNull(message = "PostalCode is required")
    @Size(min = 1, message = "PostalCode is required")
    @Pattern(regexp = "[!@#$%^&*(),.?\":{}|<>]", message = "Invalid")
    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*\\d)[a-zA-Z0-9\\-\\s]+$", message = "PostalCode must contain both letters and numbers.")
    private String postalCode;

    @NotNull(message = "Region is required")
    @Size(min = 1, message = "Region is required")
    @Pattern(regexp = "^[a-zA-ZÀ-ỹ\\s]+$", message = "Region must not contain numbers.")
    private String region;

    public Customer(String nameOfCompany, String streetAddress, String city, String region, String postalCode, String country) {
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
}
