-- =====================================
-- FILE: SQL Window Functions Practice
-- TOPIC: OVER(), PARTITION BY, Running Totals, Ranking
-- =====================================

USE TechCloud_Store;

-- =====================================
-- 1. Contribution to total sales quantity (overall)
-- =====================================

SELECT *,
       (quantity_sold / total_quantity) AS contribution
FROM (
    SELECT sale_id,
           customer_id,
           quantity_sold,
           SUM(quantity_sold) OVER() AS total_quantity
    FROM sales
) AS der;

-- =====================================
-- 2. Contribution to customer-level total quantity
-- =====================================

SELECT *,
       (quantity_sold / total_quantity) * 100 AS contribution_percent
FROM (
    SELECT sale_id,
           customer_id,
           quantity_sold,
           SUM(quantity_sold) OVER(PARTITION BY customer_id) AS total_quantity
    FROM sales
) AS der;

-- =====================================
-- 3. Cumulative revenue per customer
-- =====================================

SELECT *,
       SUM(transaction_revenue) OVER(
           PARTITION BY customer_id
           ORDER BY sale_id
       ) AS cum_revenue
FROM (
    SELECT sal.sale_id,
           sal.customer_id,
           sal.product_id,
           (prod.unit_price * sal.quantity_sold) AS transaction_revenue
    FROM sales AS sal
    INNER JOIN products AS prod
        ON sal.product_id = prod.product_id
) AS dev_1;

-- =====================================
-- 4. Purchase sequencing using ROW_NUMBER()
-- =====================================

SELECT *,
       CASE
           WHEN seq_no = 1 THEN 'FIRST PURCHASE'
           WHEN seq_no = 2 THEN 'SECOND PURCHASE'
           WHEN seq_no = 3 THEN 'THIRD PURCHASE'
           WHEN seq_no > 3 THEN 'REPEAT PURCHASE'
       END AS purchase_stage
FROM (
    SELECT sale_id,
           customer_id,
           order_date,
           quantity_sold,
           ROW_NUMBER() OVER(
               PARTITION BY customer_id
               ORDER BY order_date
           ) AS seq_no
    FROM sales
) AS dev_1
ORDER BY order_date;

-- =====================================
-- 5. Customer ranking by total quantity bought
-- =====================================

SELECT *,
       RANK() OVER(
           ORDER BY total_quant_bought DESC
       ) AS rankk,

       DENSE_RANK() OVER(
           ORDER BY total_quant_bought DESC
       ) AS dense_rankk
FROM (
    SELECT customer_id,
           SUM(quantity_sold) AS total_quant_bought
    FROM sales
    GROUP BY customer_id
) AS dev_1;