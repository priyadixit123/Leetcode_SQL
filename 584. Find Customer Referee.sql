Problem : https://leetcode.com/problems/find-customer-referee/?envType=study-plan-v2&envId=top-sql-50
Sol:

 SELECT 
    name 
FROM 
    Customer 
WHERE 
    referee_id IS NULL OR referee_id != 2;
