
-- 10 best-selling products with the total amount and their supplier
SELECT p.product_name, s.supplier_name, SUM(oi.quantity) AS total_sold, SUM(oi.quantity * oi.price) AS total_amount
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
JOIN Suppliers s ON p.supplier_id = s.supplier_id
GROUP BY p.product_name, s.supplier_name
ORDER BY total_sold DESC
LIMIT 10;