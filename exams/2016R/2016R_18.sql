SELECT nome1, nome2 FROM (
    -- Pares de amigos de diferentes cursos
    SELECT ID1, ID2, e1.nome AS nome1, e2.nome AS nome2
    FROM Estudante AS e1, Estudante AS e2, Amizade AS a
    WHERE e1.ID=a.ID1 AND e2.ID=a.ID2 AND e1.curso != e2.curso
) WHERE ID1 < ID2 OR (ID2, ID1) NOT IN (
    -- Pares de amigos de diferentes cursos
    SELECT ID1, ID2
    FROM Estudante AS e1, Estudante AS e2, Amizade AS a
    WHERE e1.ID=a.ID1 AND e2.ID=a.ID2 AND e1.curso != e2.curso
);