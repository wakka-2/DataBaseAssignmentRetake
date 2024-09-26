--  List of customers and their total purchases

SELECT 
    c.customer_id, 
    c.full_name, 
    COUNT(DISTINCT o.order_id) AS order_count,  -- Count of distinct orders per customer
    SUM(oi.price * oi.quantity) AS total_purchases -- Total purchases for each customer
FROM 
    Customers c
JOIN 
    Orders o ON c.customer_id = o.customer_id
JOIN 
    Order_Items oi ON o.order_id = oi.order_id
GROUP BY 
    c.customer_id, c.full_name
ORDER BY 
    total_purchases DESC; -- show the customers with the highest purchases first
