-- =====================================
-- FILE: SQL UNION Operations Practice
-- TOPIC: UNION, UNION ALL, Multi-Source Reporting
-- =====================================

USE TechCloud_Store;

-- =====================================
-- 1. UNION: Customers from Chicago and New York
-- =====================================

SELECT first_name 
FROM customers
WHERE city = 'Chicago'

UNION DISTINCT

SELECT first_name 
FROM customers
WHERE city = 'New York';

-- =====================================
-- 2. UNION ALL: Mixed reporting dataset
-- =====================================

-- Customer basic info
SELECT customer_id AS id,
       'CUSTOMER' AS label,
       first_name AS metric
FROM customers

UNION ALL

-- Total orders per customer
SELECT customer_id AS id,
       'TOTAL_ORDERS' AS label,
       COUNT(*) AS metric
FROM sales
GROUP BY customer_id

UNION ALL

-- Product names
SELECT product_id AS id,
       'PRODUCT' AS label,
       product_name AS metric
FROM products

UNION ALL

-- High value products
SELECT product_id AS id,
       'HIGH_VALUE_PRODUCT' AS label,
       unit_price AS metric
FROM products
WHERE unit_price > 200;