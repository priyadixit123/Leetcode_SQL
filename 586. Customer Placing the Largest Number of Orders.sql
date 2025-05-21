https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/description/


Sol:


SELECT TOP 1 customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC;
