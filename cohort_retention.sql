
-- Task 1: Multi-Table SQL Queries & Cohort Retention Analysis
-- Database: MySQL
-- Dataset: Sample online shopping data

-- Query 1: Multi-table JOIN
SELECT
    c.customer_name,
    o.order_id,
    o.order_date,
    oi.product,
    oi.amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
ORDER BY o.order_id;

-- Query 2: Customer order count and spending
SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(oi.amount) AS total_spending
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC;

-- Query 3: First purchase date for each customer
SELECT
    customer_id,
    MIN(order_date) AS first_purchase_date
FROM orders
GROUP BY customer_id
ORDER BY customer_id;

-- Query 4: Monthly cohort retention analysis
WITH first_purchase AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_purchase_date
    FROM orders
    GROUP BY customer_id
),
customer_activity AS (
    SELECT DISTINCT
        o.customer_id,
        DATE_FORMAT(fp.first_purchase_date, '%Y-%m')
            AS cohort_month,
        (
            (YEAR(o.order_date) - YEAR(fp.first_purchase_date)) * 12
            + MONTH(o.order_date)
            - MONTH(fp.first_purchase_date)
        ) AS month_number
    FROM orders o
    JOIN first_purchase fp
        ON o.customer_id = fp.customer_id
),
cohort_size AS (
    SELECT
        cohort_month,
        COUNT(DISTINCT customer_id) AS total_customers
    FROM customer_activity
    GROUP BY cohort_month
)
SELECT
    ca.cohort_month,
    ca.month_number,
    cs.total_customers,
    COUNT(DISTINCT ca.customer_id) AS retained_customers,
    ROUND(
        COUNT(DISTINCT ca.customer_id) * 100.0
        / cs.total_customers,
        2
    ) AS retention_percentage
FROM customer_activity ca
JOIN cohort_size cs
    ON ca.cohort_month = cs.cohort_month
GROUP BY
    ca.cohort_month,
    ca.month_number,
    cs.total_customers
ORDER BY ca.cohort_month, ca.month_number;
