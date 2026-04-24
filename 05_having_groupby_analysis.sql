-- =====================================
-- FILE: HAVING + GROUP BY Analysis
-- AIM: Combine WHERE, GROUP BY, HAVING, ORDER BY, LIMIT
-- =====================================

USE TechCloud_Store;

-- =====================================
-- 1. High-value customers (Top 3 by units sold)
-- =====================================

SELECT customer_id,
       COUNT(*) AS total_orders,
       SUM(quantity_sold) AS total_units_sold
FROM sales
WHERE quantity_sold >= 1
GROUP BY customer_id
HAVING COUNT(*) >= 3
ORDER BY total_units_sold DESC
LIMIT 3;

-- =====================================
-- 2. Customers with 3 or more orders
-- =====================================

SELECT customer_id,
       COUNT(*) AS total_orders
FROM sales
GROUP BY customer_id
HAVING COUNT(*) >= 3;

-- =====================================
-- 3. Top 5 expensive products
-- =====================================

SELECT product_name,
       unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 5;
