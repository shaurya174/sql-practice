-- =====================================
-- FILE: SQL Subqueries Practice
-- TOPIC: IN Subquery, Scalar Subquery, Derived Tables
-- =====================================

USE TechCloud_Store;

-- =====================================
-- 1. IN Subquery: Customers with at least one order
-- =====================================

SELECT customer_id, first_name, city
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM sales
);

-- =====================================
-- 2. Scalar Subquery: Total orders per customer
-- =====================================

SELECT customer_id,
       first_name,
       city,
       (SELECT COUNT(*)
        FROM sales s
        WHERE s.customer_id = c.customer_id) AS total_orders
FROM customers c;

-- =====================================
-- 3. Derived Table (Inline View): High-value customers
-- =====================================

SELECT dt.customer_id,
       dt.total_quantity
FROM (
    SELECT customer_id,
           SUM(quantity_sold) AS total_quantity
    FROM sales
    GROUP BY customer_id
) AS dt
WHERE dt.total_quantity > 10;