-- =====================================
-- FILE: SQL JOINs Practice
-- TOPIC: INNER, LEFT, RIGHT, SELF, MULTI-JOIN
-- =====================================

USE TechCloud_Store;

-- =====================================
-- 1. INNER JOIN: Product Sales Analysis
-- =====================================

SELECT prod.product_name,
       prod.category,
       SUM(sal.quantity_sold) AS total_sales,
       SUM(sal.quantity_sold) * prod.unit_price AS revenue
FROM products AS prod
INNER JOIN sales AS sal
    ON sal.product_id = prod.product_id
GROUP BY sal.product_id;

-- =====================================
-- 2. INNER JOIN: Customer Sales Summary
-- =====================================

SELECT cust.customer_id,
       cust.first_name,
       cust.city,
       COUNT(sal.sale_id) AS total_sales,
       SUM(sal.quantity_sold) AS total_quantity
FROM customers AS cust
INNER JOIN sales AS sal
    ON cust.customer_id = sal.customer_id
GROUP BY sal.customer_id,
         cust.first_name,
         cust.city;

-- =====================================
-- 3. LEFT JOIN: All customers with sales (if any)
-- =====================================

SELECT c.customer_id,
       c.first_name,
       s.sale_id,
       s.quantity_sold
FROM customers c
LEFT JOIN sales s
    ON c.customer_id = s.customer_id;

-- =====================================
-- 4. RIGHT JOIN: All sales with customer info
-- =====================================

SELECT c.customer_id,
       c.first_name,
       s.sale_id,
       s.quantity_sold
FROM customers c
RIGHT JOIN sales s
    ON c.customer_id = s.customer_id;

-- =====================================
-- 5. SELF JOIN: Customers in same city
-- =====================================

SELECT c1.customer_id,
       c1.first_name,
       c2.customer_id,
       c2.first_name,
       c1.city
FROM customers c1
JOIN customers c2
    ON c1.city = c2.city
WHERE c1.customer_id < c2.customer_id;

-- =====================================
-- 6. MULTI-TABLE JOIN: Full Sales Analysis
-- =====================================

SELECT cust.customer_id,
       cust.first_name,
       cust.city,
       prod.product_name,
       prod.category,
       sal.quantity_sold,
       prod.unit_price,
       prod.unit_price * sal.quantity_sold AS total_spent
FROM customers AS cust
INNER JOIN sales AS sal
    ON cust.customer_id = sal.customer_id
INNER JOIN products AS prod
    ON prod.product_id = sal.product_id;