-- List of products in Fashion Category that were sold last month

SELECT 
    p.product_id, 
    p.product_name AS product_name
FROM 
    Products p
JOIN 
    Order_Items oi ON p.product_id = oi.product_id
JOIN 
    Orders o ON oi.order_id = o.order_id
WHERE 
    p.product_category = 'Fashion'
    AND o.order_date >= DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH) 
    AND o.order_date < CURRENT_DATE
GROUP BY 
    p.product_id, p.product_name;
