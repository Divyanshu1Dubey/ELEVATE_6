
-- TASK 6: Sales Trend Analysis Using Aggregations
-- Table: orders

-- 1. Monthly Revenue and Order Volume
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    ROUND(SUM(amount)::numeric, 2) AS monthly_revenue,
    COUNT(DISTINCT invoiceno) AS order_volume
FROM orders
GROUP BY year, month
ORDER BY year, month;

-- 2. Top 3 Months by Sales (Revenue)
SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS year_month,
    ROUND(SUM(amount)::numeric, 2) AS monthly_revenue
FROM orders
GROUP BY year_month
ORDER BY monthly_revenue DESC
LIMIT 3;

-- 3. Monthly Revenue for Year 2020
SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    ROUND(SUM(amount)::numeric, 2) AS monthly_revenue
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2020
GROUP BY month
ORDER BY month;

-- 4. Unique Products Sold Per Month
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT stockcode) AS unique_products_sold
FROM orders
GROUP BY year, month
ORDER BY year, month;

-- 5. Average Order Value (AOV) Per Month
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    ROUND(SUM(amount)::numeric / COUNT(DISTINCT invoiceno), 2) AS avg_order_value
FROM orders
GROUP BY year, month
ORDER BY year, month;
