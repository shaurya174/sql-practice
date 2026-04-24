-- =====================================
-- FILE: Basic Filtering (WHERE Clause Practice)
-- =====================================

-- 1. Products with price >= 200
SELECT product_name, unit_price
FROM products
WHERE unit_price >= 200;

-- 2. Customers from Chicago
SELECT first_name, last_name, city 
FROM customers
WHERE city = 'Chicago';

-- 3. Customers who are not Silver members
SELECT first_name, last_name, membership_level 
FROM customers
WHERE membership_level != 'Silver';

-- 4. Multiple conditions (category, price, stock)
SELECT product_name,
       category,
       unit_price,
       stock_quantity
FROM products
WHERE (category = 'Accessories' OR category = 'Computers')
  AND unit_price > 100
  AND stock_quantity >= 30;

-- 5. Product names starting with 'Smart'
SELECT product_name, category 
FROM products
WHERE product_name LIKE 'Smart%';

-- 6. First names matching pattern '_an%'
SELECT first_name, city
FROM customers
WHERE first_name LIKE '_an%';