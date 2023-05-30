SELECT c.cus_name, c.cus_gender, COUNT(o.cus_id) AS total_orders
FROM customer c
LEFT JOIN orders o ON c.cus_id = o.cus_id
WHERE c.cus_name LIKE 'A%' OR c.cus_name LIKE '%A'
GROUP BY c.cus_id, c.cus_name, c.cus_gender;
