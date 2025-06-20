 https://leetcode.com/problems/capital-gainloss/description/


SOL:

WITH BuyCTE AS (
  SELECT stock_name, price AS buy_price, 
         ROW_NUMBER() OVER (PARTITION BY stock_name ORDER BY operation_day) AS rn
  FROM Stocks
  WHERE operation = 'Buy'
),
SellCTE AS (
  SELECT stock_name, price AS sell_price, 
         ROW_NUMBER() OVER (PARTITION BY stock_name ORDER BY operation_day) AS rn
  FROM Stocks
  WHERE operation = 'Sell'
),
Matched AS (
  SELECT b.stock_name, s.sell_price - b.buy_price AS capital_gain_loss
  FROM BuyCTE b
  JOIN SellCTE s 
    ON b.stock_name = s.stock_name AND b.rn = s.rn
)
SELECT stock_name, SUM(capital_gain_loss) AS capital_gain_loss
FROM Matched
GROUP BY stock_name;
