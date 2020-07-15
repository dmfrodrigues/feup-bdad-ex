SELECT idPost FROM Comments
GROUP BY idPost
HAVING COUNT(*) > (
    SELECT AVG(numComments) FROM (
        -- Contagem de comentários
        SELECT idPost, COUNT(*) AS numComments FROM Comments
        GROUP BY idPost
    )
);
