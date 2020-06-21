SELECT nome FROM (
    SELECT nome, COUNT(*) AS NumAnos FROM (
        -- Anos curriculares em que cada ID tem amigos
        SELECT DISTINCT e1.nome, e1.ID, e2.anoCurricular
        FROM Estudante AS e1, Estudante AS e2, Amizade
        WHERE ID1 = e1.ID AND ID2 = e2.ID
    ) GROUP BY ID
) WHERE NumAnos = 5;
