-- Use database
CREATE DATABASE sales_project;
USE sales_project;

-- Create tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    amount INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert data
INSERT INTO customers VALUES (1, 'Charan', 'Hyderabad');
INSERT INTO customers VALUES (2, 'Ravi', 'Chennai');
INSERT INTO customers VALUES (3, 'Sai', 'Bangalore');
INSERT INTO customers VALUES (4, 'Kiran', 'Hyderabad');

INSERT INTO orders VALUES (101, 1, 'Laptop', 60000, '2025-01-10');
INSERT INTO orders VALUES (102, 2, 'Mobile', 20000, '2025-01-11');
INSERT INTO orders VALUES (103, 1, 'Tablet', 30000, '2025-01-12');
INSERT INTO orders VALUES (104, 3, 'Laptop', 65000, '2025-01-13');
INSERT INTO orders VALUES (105, 4, 'Mobile', 25000, '2025-01-14');

-- Analysis Queries

-- 1. Join query
SELECT customers.name, orders.product, orders.amount
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

-- 2. Total spent by customer
SELECT customers.name, SUM(orders.amount) AS total_spent
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.name;

-- 3. Top customer
SELECT customers.name, SUM(orders.amount) AS total_spent
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.name
ORDER BY total_spent DESC
LIMIT 1;

-- 4. Product analysis
SELECT product, COUNT(*) AS total_orders
FROM orders
GROUP BY product;

-- 5. City-wise sales
SELECT customers.city, SUM(orders.amount) AS total_sales
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.city;

-- 6. Customer category
SELECT customers.name,
SUM(orders.amount) AS total_spent,
CASE
    WHEN SUM(orders.amount) > 100000 THEN 'VIP'
    WHEN SUM(orders.amount) > 50000 THEN 'Regular'
    ELSE 'New'
END AS customer_type
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.name;






























