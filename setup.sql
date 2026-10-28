
-- Task 1: Database Setup
-- Create sample customer shopping database

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

CREATE TABLE order_items (
    order_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2)
);

-- Insert sample customers
INSERT INTO customers VALUES
(1, 'Asha'),
(2, 'Rahul'),
(3, 'Priya');

-- Insert sample orders
INSERT INTO orders VALUES
(101, 1, '2026-01-10'),
(102, 2, '2026-01-15'),
(103, 1, '2026-02-05'),
(104, 3, '2026-02-12');

-- Insert order items
INSERT INTO order_items VALUES
(101, 'Laptop', 50000),
(102, 'Mouse', 500),
(103, 'Keyboard', 1500),
(104, 'Monitor', 12000);
