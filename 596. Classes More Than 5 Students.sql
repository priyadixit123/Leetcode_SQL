https://leetcode.com/problems/classes-more-than-5-students/description/

Sol:

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
