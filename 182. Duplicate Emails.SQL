https://leetcode.com/problems/duplicate-emails/description/

Sol:

SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;
