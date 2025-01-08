https://leetcode.com/problems/user-activity-for-the-past-30-days-i/description/?envType=study-plan-v2&envId=top-sql-50
1141. User Activity for the Past 30 Days I

Solution:

# Write your MySQL query statement below
WITH ActiveUsers AS (
    SELECT 
        activity_date,
        user_id
    FROM 
        Activity
    WHERE 
        activity_date BETWEEN '2019-06-28' AND '2019-07-27'
    GROUP BY 
        activity_date, user_id
)
SELECT 
    activity_date AS day,
    COUNT(user_id) AS active_users
FROM 
    ActiveUsers
GROUP BY 
    activity_date
ORDER BY 
    activity_date;




Explanation:
Filter Rows:

In the WHERE clause, we limit the rows to the 30-day period ending on 2019-07-27 (BETWEEN '2019-06-28' AND '2019-07-27').
Remove Duplicate Entries:

Using GROUP BY activity_date, user_id in the ActiveUsers Common Table Expression (CTE) ensures each user is counted only once per day.
Count Distinct Users per Day:

In the main query, we count the distinct user_ids for each activity_date to calculate the number of active users per day.
Order the Result:

Finally, the results are ordered by activity_date for readability.
