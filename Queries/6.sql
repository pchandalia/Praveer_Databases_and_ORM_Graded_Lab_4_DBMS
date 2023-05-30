SELECT s.supp_id, s.supp_name, s.supp_city, s.supp_phone
FROM supplier s
INNER JOIN supplier_pricing sp ON s.supp_id = sp.supp_id
GROUP BY s.supp_id, s.supp_name, s.supp_city, s.supp_phone
HAVING COUNT(DISTINCT sp.pro_id) > 1;
