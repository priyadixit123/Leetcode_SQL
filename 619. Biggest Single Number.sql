https://leetcode.com/problems/biggest-single-number/description/


Sol

SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) AS Singles;
