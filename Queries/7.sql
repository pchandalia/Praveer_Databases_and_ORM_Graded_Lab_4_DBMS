SELECT c.cat_id, c.cat_name, p.pro_name, sp.supp_price
FROM category c
JOIN product p ON c.cat_id = p.cat_id
JOIN supplier_pricing sp ON p.pro_id = sp.pro_id
JOIN (
  SELECT p.cat_id, MIN(sp.supp_price) AS min_price
  FROM supplier_pricing sp
  JOIN product p ON p.pro_id = sp.pro_id
  GROUP BY p.cat_id
) min_prices ON p.cat_id = min_prices.cat_id AND sp.supp_price = min_prices.min_price
Order by p.cat_id;
