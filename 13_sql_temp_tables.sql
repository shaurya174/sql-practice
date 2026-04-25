-- =====================================
-- FILE: SQL Temporary Tables
-- TOPIC: Intermediate Storage and Reusable Analysis
-- =====================================

USE TechCloud_Store;

-- =====================================
-- 1. Temporary Customer Revenue Table
-- =====================================

CREATE TEMPORARY TABLE temp_customer_revenue AS
SELECT sal.customer_id,
       SUM(prod.unit_price * sal.quantity_sold) AS total_revenue
FROM sales AS sal
INNER JOIN products AS prod
    ON sal.product_id = prod.product_id
GROUP BY sal.customer_id;

-- High revenue customers
SELECT *
FROM temp_customer_revenue
WHERE total_revenue > 1000;

-- =====================================
-- 2. Temporary Category Sales Table
-- =====================================

CREATE TEMPORARY TABLE temp_category_sales AS
SELECT sal.customer_id,
       prod.category,
       SUM(sal.quantity_sold) AS total_quantity
FROM sales AS sal
INNER JOIN products AS prod
    ON sal.product_id = prod.product_id
GROUP BY sal.customer_id,
         prod.category;

-- Category ranking per customer
SELECT *,
       RANK() OVER (
           PARTITION BY customer_id
           ORDER BY total_quantity DESC
       ) AS category_rank
FROM temp_category_sales;