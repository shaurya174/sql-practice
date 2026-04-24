-- =====================================
-- FILE: Group By & Aggregation Analysis
-- DATABASE: TechCloud_Store
-- =====================================

USE TechCloud_Store;

-- =====================================
-- 1. Total orders per customer
-- =====================================

SELECT customer_id, COUNT(*) AS total_orders
FROM sales
GROUP BY customer_id;

-- =====================================
-- 2. Store region analysis
--    (Count, total quantity, average quantity)
-- =====================================

SELECT store_region,
       COUNT(*) AS total_sales,
       SUM(quantity_sold) AS total_quantity,
       AVG(quantity_sold) AS avg_quantity
FROM sales
GROUP BY store_region;

-- =====================================
-- 3. Filtered regional performance
--    Only sales with quantity >= 2
-- =====================================

SELECT store_region,
       COUNT(*) AS total_sales,
       SUM(quantity_sold) AS total_quantity
FROM sales
WHERE quantity_sold >= 2
GROUP BY store_region
ORDER BY total_quantity DESC,
         total_sales ASC;