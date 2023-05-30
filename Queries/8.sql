SELECT o.ord_date, o.ord_id, sp.pro_id, pr.pro_name, c.cus_name
FROM orders o
JOIN supplier_pricing sp ON o.pricing_id = sp.pricing_id
JOIN product pr ON sp.pro_id = pr.pro_id
JOIN customer c ON o.cus_id = c.cus_id
WHERE o.ord_date > '2021-10-05'
LIMIT 0, 1000;
