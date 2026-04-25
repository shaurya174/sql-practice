-- =====================================
-- FILE: SQL Triggers and Events
-- TOPIC: Automation and Scheduled Tasks
-- =====================================

USE TechCloud_Store;

-- =====================================
-- 1. Trigger: Update stock after new sale
-- =====================================

DELIMITER //

CREATE TRIGGER UpdateStockAfterSale
AFTER INSERT ON sales
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock_quantity = stock_quantity - NEW.quantity_sold
    WHERE product_id = NEW.product_id;
END //

DELIMITER ;

-- =====================================
-- 2. Event: Delete sales older than 1 year
-- =====================================

CREATE EVENT DeleteOldSales
ON SCHEDULE EVERY 1 DAY
DO
DELETE FROM sales
WHERE order_date < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);