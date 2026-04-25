-- =====================================
-- FILE: SQL Common Table Expressions (CTE)
-- TOPIC: Chained CTEs, Revenue Segmentation, Category Ranking
-- =====================================

USE TechCloud_Store;

-- =====================================
-- 1. Customer Revenue Segmentation
-- =====================================

WITH CTE1 AS (
    SELECT sal.customer_id,
           SUM(prod.unit_price * sal.quantity_sold) AS total_revenue
    FROM sales AS sal
    INNER JOIN products AS prod
        ON sal.product_id = prod.product_id
    GROUP BY sal.customer_id
),

CTE2 AS (
    SELECT *,
           CASE 
               WHEN total_revenue > 1000 THEN 'HIGH_VALUE'
               WHEN total_revenue BETWEEN 500 AND 1000 THEN 'MID_VALUE'
               WHEN total_revenue < 500 THEN 'LOW_VALUE'
           END AS revenue_category
    FROM CTE1 AS dev_1
)

SELECT *
FROM CTE2
ORDER BY total_revenue DESC;

-- =====================================
-- 2. Category Revenue Ranking per Customer
-- =====================================

WITH CTE_1 AS (
    SELECT sal.customer_id,
           prod.category,
           SUM(prod.unit_price * sal.quantity_sold) AS cat_revenue
    FROM sales AS sal
    INNER JOIN products AS prod
        ON sal.product_id = prod.product_id
    GROUP BY sal.customer_id,
             prod.category
),

CTE_2 AS (
    SELECT *,
           RANK() OVER(
               PARTITION BY customer_id
               ORDER BY cat_revenue DESC
           ) AS category_rank
    FROM CTE_1 AS dev_1
)

SELECT *
FROM CTE_2;