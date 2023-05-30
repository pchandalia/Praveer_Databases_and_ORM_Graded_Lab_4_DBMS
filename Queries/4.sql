DROP TEMPORARY TABLE IF EXISTS T6;

CREATE TEMPORARY TABLE T6 AS (
    SELECT customer.cus_id, customer.cus_name, customer.cus_gender
    FROM customer
    RIGHT JOIN orders ON customer.cus_id = orders.cus_id
    WHERE orders.ord_amount >= 3000
    GROUP BY customer.cus_id, customer.cus_name, customer.cus_gender
    ORDER BY customer.cus_id
);

SELECT cus_id, cus_name, cus_gender, COUNT(cus_id) AS no_of_people
FROM T6
GROUP BY cus_id, cus_name, cus_gender;
DROP TEMPORARY TABLE IF EXISTS T6;