
-- Detail information about suppliers and the number of products they provide
SELECT s.supplier_name,s.telephone`online-shop``online-shop`, COUNT(p.product_id) AS product_count
FROM Suppliers s
JOIN Products p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_name;