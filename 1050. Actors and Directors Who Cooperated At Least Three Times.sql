https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/description/

Sol:

SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;
