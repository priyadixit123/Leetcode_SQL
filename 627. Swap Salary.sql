https://leetcode.com/problems/swap-salary/description/

Sol:

UPDATE Salary
SET sex = CASE 
             WHEN sex = 'm' THEN 'f'
             ELSE 'm'
          END;
