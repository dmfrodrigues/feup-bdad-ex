SELECT nome, anoCurricular
FROM Estudante, (
    -- Contagem de amigos
    SELECT ID1,COUNT(*) AS NAmigos FROM Amizade GROUP BY ID1
) AS T2
WHERE Estudante.ID=T2.ID1
AND NAmigos IN (
    SELECT MAX(Namigos) FROM (
        -- Contagem de amigos
        SELECT COUNT(*) AS NAmigos FROM Amizade GROUP BY ID1
    )
);
