CREATE DEFINER=`root`@`localhost` PROCEDURE `supplier_overview_per_order`()
BEGIN
DROP TEMPORARY TABLE IF EXISTS T1;
Create Temporary Table T1(    
Select supplier.supp_id, supplier.supp_name, supplier_pricing.pricing_id
    FROM supplier
    RIGHT JOIN supplier_pricing ON supplier.supp_id = supplier_pricing.supp_id);
    DROP TEMPORARY TABLE IF EXISTS T2;
Create Temporary Table T2(
Select orders.ord_id, orders.pricing_id, rating.stars
From orders
Right Join rating ON orders.ord_id = rating.ord_id);
 SELECT T1.supp_id AS Supplier_Id, T1.supp_name AS Supplier_Name, T2.stars AS Ratings,
    CASE
        WHEN T2.stars = 5 THEN 'Excellent Service'
        WHEN T2.stars > 4 THEN 'Good Service'
        WHEN T2.stars > 2 THEN 'Average Service'
        ELSE 'Poor Service'
    END AS Type_of_Service
    FROM T1
    RIGHT JOIN T2 ON T1.pricing_id = T2.pricing_id
    ORDER BY T1.supp_id;

    DROP TEMPORARY TABLE IF EXISTS T1;
    DROP TEMPORARY TABLE IF EXISTS T2;
END