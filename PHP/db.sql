CREATE DATABASE phone_store;

USE phone_store;

CREATE TABLE phones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);
