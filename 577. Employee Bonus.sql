https://leetcode.com/problems/employee-bonus/description/?envType=study-plan-v2&envId=top-sql-50

577. Employee Bonus

Solution:

# Write your MySQL query statement below
SELECT 
    e.name,
    b.bonus
FROM 
    Employee e
LEFT JOIN 
    Bonus b
ON 
    e.empId = b.empId
WHERE 
    b.bonus < 1000 OR b.bonus IS NULL;
