-- =====================================
-- FILE: CASE WHEN Segmentation Practice
-- TOPIC: Business Logic, Customer Segmentation
-- =====================================

USE TechCloud_Store;

-- =====================================
-- 1. Customer Purchase Behavior Segmentation
-- =====================================

SELECT 
    cust.customer_id,
    cust.first_name,
    SUM(sal.quantity_sold) AS total_quantity,

    CASE
        WHEN SUM(sal.quantity_sold) >= 10 THEN 'POWER BUYER'
        WHEN SUM(sal.quantity_sold) BETWEEN 5 AND 9 THEN 'REGULAR BUYER'
        WHEN SUM(sal.quantity_sold) BETWEEN 1 AND 4 THEN 'LIGHT BUYER'
    END AS customer_category

FROM customers AS cust
INNER JOIN sales AS sal
    ON cust.customer_id = sal.customer_id

GROUP BY 
    cust.customer_id,
    cust.first_name

ORDER BY total_quantity DESC;

-- =====================================
-- 2. Multi-Dimensional Customer Segmentation
-- =====================================

SELECT customer_id,
       first_name,
       city,
       membership_level,

       CASE 
           WHEN membership_level = 'Gold' THEN 'HIGH_VALUE'
           WHEN membership_level = 'Silver' THEN 'MID_VALUE'
           WHEN membership_level = 'Bronze' THEN 'LOW_VALUE'
           ELSE 'UNKNOWN'
       END AS value_segment,

       CASE 
           WHEN city IN ('New York', 'Chicago') THEN 'URBAN'
           ELSE 'NON_URBAN'
       END AS location_segment,

       CASE 
           WHEN membership_level = 'Gold' AND city = 'New York' THEN 'TARGET_A'
           WHEN membership_level = 'Gold' THEN 'TARGET_B'
           ELSE 'GENERAL'
       END AS marketing_segment

FROM customers
ORDER BY customer_id;