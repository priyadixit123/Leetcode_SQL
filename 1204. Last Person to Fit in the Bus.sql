https://leetcode.com/problems/last-person-to-fit-in-the-bus/description/

SELECT TOP 1 person_name
FROM (
    SELECT person_name,
           SUM(weight) OVER (ORDER BY turn) AS total_weight,
           turn
    FROM Queue
) AS boarding
WHERE total_weight <= 1000
ORDER BY turn DESC;
