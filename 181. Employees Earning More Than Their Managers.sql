https://leetcode.com/problems/employees-earning-more-than-their-managers/description/

Sol:


SELECT e.name AS Employee
FROM Employee e
JOIN Employee m ON e.managerId = m.id
WHERE e.salary > m.salary;
