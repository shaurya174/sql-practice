-- =====================================
-- FILE: SQL String Functions Practice
-- TOPIC: LENGTH, UPPER, LOWER, TRIM, CONCAT, SUBSTRING
-- =====================================

USE TechCloud_Store;

-- =====================================
-- 1. LENGTH: Email analysis
-- =====================================

SELECT customer_id,
       first_name,
       email,
       LENGTH(email) AS email_length
FROM customers
WHERE LENGTH(email) > 15
ORDER BY email_length DESC, customer_id ASC;

-- =====================================
-- 2. UPPER & LOWER: Standardization
-- =====================================

SELECT customer_id,
       first_name,
       email,
       UPPER(email) AS email_upper,
       LOWER(city) AS city_lower
FROM customers
WHERE city = 'Chicago' OR city = 'New York'
ORDER BY customer_id ASC;

-- =====================================
-- 3. TRIM operations
-- =====================================

SELECT customer_id,
       first_name,
       city,
       TRIM(first_name) AS trimmed_first_name,
       LTRIM(city) AS left_trimmed_city,
       RTRIM(email) AS right_trimmed_email
FROM customers
ORDER BY customer_id ASC;

-- =====================================
-- 4. LEFT & RIGHT string extraction
-- =====================================

SELECT customer_id,
       email,
       LEFT(email, 3) AS email_prefix,
       RIGHT(email, 4) AS email_suffix,
       first_name
FROM customers
ORDER BY customer_id;

-- =====================================
-- 5. CONCAT: Building labels
-- =====================================

SELECT customer_id,
       first_name,
       city,
       CONCAT(first_name, ' (', city, ')') AS customer_label
FROM customers
ORDER BY customer_id ASC;

-- =====================================
-- 6. LOCATE & SUBSTRING: Domain extraction
-- =====================================

SELECT customer_id,
       email,
       LOCATE('@', email) AS at_position,
       SUBSTRING(email, LOCATE('@', email) + 1, LENGTH(email)) AS domain_name,
       first_name
FROM customers;

-- =====================================
-- 7. REPLACE: Email transformation
-- =====================================

SELECT customer_id,
       first_name,
       email,
       REPLACE(email, '.com', '.in') AS updated_email
FROM customers
ORDER BY customer_id;
