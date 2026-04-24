-- =====================================
-- BASIC RETRIEVAL
-- =====================================

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM sales;

-- =====================================
-- COLUMN SELECTION
-- =====================================

SELECT first_name, last_name, city, membership_level
FROM customers;

-- =====================================
-- DERIVED COLUMN
-- =====================================

-- Applying 10% discount
SELECT product_name, category, unit_price,
(unit_price * 0.90) AS discounted_price
FROM products;

-- =====================================
-- DISTINCT VALUES
-- =====================================

SELECT DISTINCT category FROM products;