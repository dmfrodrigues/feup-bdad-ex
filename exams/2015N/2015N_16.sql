SELECT AVG(numUsers) as Media FROM (
    -- Numero de pessoas que aparecem em cada foto com mais de 3 likes
    SELECT COUNT(*) AS numUsers FROM AppearsIn
    WHERE photo IN (
        -- Fotos com mais de 3 likes
        SELECT photo FROM Likes GROUP BY photo HAVING COUNT(*) > 3
    ) GROUP BY photo
);
