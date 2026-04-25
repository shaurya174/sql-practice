-- =====================================
-- FILE: SQL Stored Procedures
-- TOPIC: Reusable SQL Logic and Parameters
-- =====================================

USE TechCloud_Store;

-- =====================================
-- 1. Procedure: Customer Revenue Summary
-- =====================================

DELIMITER //

CREATE PROCEDURE GetCustomerRevenue()
BEGIN
    SELECT sal.customer_id,
           SUM(prod.unit_price * sal.quantity_sold) AS total_revenue
    FROM sales AS sal
    INNER JOIN products AS prod
        ON sal.product_id = prod.product_id
    GROUP BY sal.customer_id;
END //

DELIMITER ;

-- Execute procedure
CALL GetCustomerRevenue();

-- =====================================
-- 2. Procedure: Sales by Customer ID
-- =====================================

DELIMITER //

CREATE PROCEDURE GetCustomerSales(IN cust_id INT)
BEGIN
    SELECT sale_id,
           customer_id,
           product_id,
           quantity_sold
    FROM sales
    WHERE customer_id = cust_id;
END //

DELIMITER ;

-- Execute procedure
CALL GetCustomerSales(101);