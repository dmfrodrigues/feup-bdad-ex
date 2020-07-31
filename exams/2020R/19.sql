SELECT Name, COUNT(Day)
FROM (
    SELECT DISTINCT Id, Name, Day
    FROM Topic
    LEFT JOIN Talk ON Topic.Id=Talk.topic
)
GROUP BY Id
ORDER BY Name;
