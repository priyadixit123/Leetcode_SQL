https://leetcode.com/problems/product-price-at-a-given-date/description/

Sol:
SELECT 
    p.product_id,
    COALESCE(pc.new_price, 10) AS price
FROM 
    (SELECT DISTINCT product_id FROM Products) p
LEFT JOIN 
    Products pc 
    ON p.product_id = pc.product_id
    AND pc.change_date = (
        SELECT MAX(change_date)
        FROM Products
        WHERE product_id = p.product_id
          AND change_date <= '2019-08-16'
    );
