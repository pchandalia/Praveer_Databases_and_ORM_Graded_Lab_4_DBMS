CREATE DEFINER=`root`@`localhost` PROCEDURE `supplier_overview_avg`()
BEGIN
    DROP TEMPORARY TABLE IF EXISTS T1;
    CREATE TEMPORARY TABLE T1 AS
    SELECT supplier.supp_id, supplier.supp_name, supplier_pricing.pricing_id
    FROM supplier
    RIGHT JOIN supplier_pricing ON supplier.supp_id = supplier_pricing.supp_id;

    DROP TEMPORARY TABLE IF EXISTS T2;
    CREATE TEMPORARY TABLE T2 AS
    SELECT orders.ord_id, orders.pricing_id, rating.stars
    FROM orders
    RIGHT JOIN rating ON orders.ord_id = rating.ord_id;

    DROP TEMPORARY TABLE IF EXISTS T3;
    CREATE TEMPORARY TABLE T3 AS
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

    DROP TEMPORARY TABLE IF EXISTS T4;
    CREATE TEMPORARY TABLE T4 AS
    SELECT T3.Supplier_Id, T3.Supplier_Name, AVG(T3.Ratings) AS Average_Ratings
    FROM T3
    GROUP BY Supplier_Id, Supplier_Name;

    SELECT T4.Supplier_Id, T4.Supplier_Name, T4.Average_Ratings,
        CASE
            WHEN T4.Average_Ratings = 5 THEN 'Excellent Service'
            WHEN T4.Average_Ratings > 4 THEN 'Good Service'
            WHEN T4.Average_Ratings > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS Type_of_Service
    FROM T4;

    DROP TEMPORARY TABLE IF EXISTS T1;
    DROP TEMPORARY TABLE IF EXISTS T2;
    DROP TEMPORARY TABLE IF EXISTS T3;
    DROP TEMPORARY TABLE IF EXISTS T4;
END