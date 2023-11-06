-- Task 1
SELECT Customers.customer_id, Customers.name, Customers.email, Customers.location, COUNT(Orders.order_id) AS total_orders
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id, Customers.name, Customers.email, Customers.location
ORDER BY total_orders DESC;


-- Task 2

SELECT Orders.order_id, Products.name AS product_name, Order_Items.quantity, Order_Items.unit_price * Order_Items.quantity AS total_amount
FROM Order_Items
JOIN Orders ON Order_Items.order_id = Orders.order_id
JOIN Products ON Order_Items.product_id = Products.product_id
ORDER BY Orders.order_id ASC;


-- Task 3
SELECT Categories.name AS category_name, SUM(Products.price * Order_Items.quantity) AS total_revenue
FROM Categories
LEFT JOIN Products ON Categories.category_id = Products.category_id
LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id
GROUP BY Categories.name
ORDER BY total_revenue DESC;

-- Task 4
SELECT Customers.name AS customer_name, SUM(Order_Items.quantity * Order_Items.unit_price) AS total_purchase_amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id
GROUP BY Customers.name
ORDER BY total_purchase_amount DESC
LIMIT 5;

