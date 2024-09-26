
-- List of returned items

SELECT r.return_id, oi.order_item_id, p.product_name AS product_name, r.return_date, r.reason
FROM Returns r
JOIN Order_Items oi ON r.order_item_id = oi.order_item_id
JOIN Products p ON oi.product_id = p.product_id;