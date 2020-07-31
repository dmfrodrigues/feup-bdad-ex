SELECT Name, Title, Country
FROM Speaker INNER JOIN Talk ON Speaker.Id=Talk.speaker
ORDER BY Country;
