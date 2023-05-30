SELECT c.cus_id, c.cus_name, o.ord_id, pr.pro_name, pr.pro_desc
FROM customer c
JOIN orders o ON c.cus_id = o.cus_id
JOIN supplier_pricing sp ON o.pricing_id = sp.pricing_id
JOIN product pr ON sp.pro_id = pr.pro_id
WHERE c.cus_id = 2;
