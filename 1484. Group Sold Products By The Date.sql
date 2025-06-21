https://leetcode.com/problems/group-sold-products-by-the-date/description/

Sol->


SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    STRING_AGG(product, ',') WITHIN GROUP (ORDER BY product) AS products
FROM (
    SELECT DISTINCT sell_date, product
    FROM Activities
) AS distinct_products
GROUP BY sell_date
ORDER BY sell_date;
