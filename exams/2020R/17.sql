SELECT Name
FROM Speaker INNER JOIN Talk ON Speaker.Id=Talk.speaker
GROUP BY Id
HAVING COUNT(*) > 1;
