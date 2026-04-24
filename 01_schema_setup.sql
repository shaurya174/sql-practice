-- This script creates a sample e-commerce database for SQL practice

-- =========================================
-- DATABASE: TechCloud Store (Practice Setup)
-- =========================================

DROP DATABASE IF EXISTS `TechCloud_Store`;
CREATE DATABASE `TechCloud_Store`;
USE `TechCloud_Store`;

-- =========================================
-- TABLE: Products
-- =========================================

CREATE TABLE products (
  product_id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(100),
  category VARCHAR(50),
  unit_price DECIMAL(10, 2),
  stock_quantity INT,
  brand VARCHAR(50),
  PRIMARY KEY (product_id)
);

-- =========================================
-- TABLE: Customers
-- =========================================

CREATE TABLE customers (
  customer_id INT NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  city VARCHAR(50),
  membership_level VARCHAR(20), 
  join_date DATE,
  PRIMARY KEY (customer_id)
);

-- =========================================
-- TABLE: Sales Transactions
-- =========================================

CREATE TABLE sales (
  sale_id INT NOT NULL AUTO_INCREMENT,
  order_date DATE,
  customer_id INT,
  product_id INT,
  quantity_sold INT,
  discount_applied DECIMAL(5, 2), 
  store_region VARCHAR(50),
  payment_method VARCHAR(20),
  PRIMARY KEY (sale_id)
);

-- =========================================
-- INSERT DATA: Products
-- =========================================

INSERT INTO products (product_name, category, unit_price, stock_quantity, brand)
VALUES
('Quantum Laptop Pro', 'Computers', 1500.00, 45, 'TechNova'),
('Quantum Laptop Air', 'Computers', 950.00, 60, 'TechNova'),
('Ergo Mouse Wireless', 'Accessories', 45.50, 120, 'LogiPlus'),
('4K Monitor 27in', 'Displays', 350.00, 30, 'ViewSonic'),
('Mechanical Keyboard RGB', 'Accessories', 89.99, 60, 'Razer'),
('Pro Tablet 11', 'Computers', 750.00, 25, 'Apple'),
('Webcam Ultra HD', 'Accessories', 55.00, 15, 'LogiPlus'),
('Smart Watch Series 5', 'Wearables', 199.00, 80, 'Samsung'),
('Noise-Canceling Headphones', 'Audio', 299.00, 40, 'Sony'),
('USB-C Hub 7-in-1', 'Accessories', 35.00, 200, 'Anker'),
('Gaming Chair Z-Core', 'Furniture', 250.00, 10, 'SecretLab'),
('Smart Light Starter Kit', 'Home Automation', 120.00, 55, 'Philips');

-- =========================================
-- INSERT DATA: Customers
-- =========================================

INSERT INTO customers (customer_id, first_name, last_name, email, city, membership_level, join_date)
VALUES
(101, 'Alice', 'Vance', 'alice@tech.com', 'New York', 'Gold', '2022-01-15'),
(102, 'Bob', 'Miller', 'bob@mail.com', 'San Francisco', 'Silver', '2022-05-20'),
(103, 'Charlie', 'Davis', 'charlie@web.com', 'Chicago', 'Bronze', '2023-02-10'),
(104, 'Diana', 'Prince', 'diana@amazon.com', 'Seattle', 'Gold', '2021-11-30'),
(105, 'Ethan', 'Hunt', 'ethan@imf.com', 'Miami', 'Silver', '2023-08-14'),
(106, 'Fiona', 'Gallagher', 'fiona@south.com', 'Chicago', 'Bronze', '2024-01-05'),
(107, 'George', 'Costanza', 'george@vandelay.com', 'New York', 'Silver', '2023-11-12'),
(108, 'Hannah', 'Abbott', 'hannah@hogwarts.edu', 'London', 'Gold', '2022-09-03'),
(109, 'Ian', 'Malcolm', 'ian@dino.com', 'Austin', 'Bronze', '2024-02-28'),
(110, 'Julia', 'Roberts', 'julia@hollywood.com', 'Los Angeles', 'Silver', '2023-06-21');

-- =========================================
-- INSERT DATA: Sales
-- =========================================

INSERT INTO sales (order_date, customer_id, product_id, quantity_sold, discount_applied, store_region, payment_method)
VALUES
('2024-01-10', 101, 1, 1, 0.05, 'North', 'Credit Card'),
('2024-01-12', 102, 3, 2, 0.00, 'West', 'PayPal'),
('2024-01-15', 104, 4, 1, 0.10, 'West', 'Credit Card'),
('2024-01-20', 108, 9, 1, 0.00, 'International', 'Credit Card'),
('2024-02-01', 101, 5, 1, 0.00, 'North', 'Debit Card'),
('2024-02-05', 103, 3, 4, 0.15, 'Midwest', 'PayPal'),
('2024-02-14', 110, 8, 1, 0.05, 'West', 'Credit Card'),
('2024-02-20', 105, 6, 1, 0.00, 'South', 'Credit Card'),
('2024-03-01', 107, 10, 3, 0.00, 'North', 'PayPal'),
('2024-03-05', 101, 8, 1, 0.05, 'North', 'Debit Card'),
('2024-03-10', 104, 1, 1, 0.10, 'West', 'Credit Card'),
('2024-03-12', 106, 10, 1, 0.00, 'Midwest', 'Debit Card'),
('2024-03-15', 109, 2, 1, 0.00, 'South', 'Cash'),
('2024-03-20', 108, 11, 1, 0.10, 'International', 'Credit Card'),
('2024-03-22', 102, 4, 1, 0.00, 'West', 'PayPal'),
('2024-03-25', 105, 12, 2, 0.05, 'South', 'Credit Card'),
('2024-03-28', 103, 5, 1, 0.00, 'Midwest', 'Credit Card'),
('2024-04-01', 110, 2, 1, 0.05, 'West', 'Debit Card'),
('2024-04-02', 101, 12, 1, 0.00, 'North', 'Credit Card'),
('2024-04-05', 107, 9, 1, 0.00, 'North', 'PayPal');

-- =========================================
-- BASIC VERIFICATION QUERY
-- =========================================

SELECT * FROM products;