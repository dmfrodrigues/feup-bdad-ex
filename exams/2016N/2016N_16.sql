SELECT nome,anoCurricular FROM Estudante
WHERE ID NOT IN (
    -- Estudantes com amigos noutros anos
    SELECT DISTINCT ID FROM Estudante AS e, Amizade AS a
    WHERE e.ID = a.ID1
    AND a.ID2 IN (
        SELECT ID FROM Estudante
        WHERE AnoCurricular <> e.AnoCurricular
    )
)
AND ID IN (
    -- Estudantes com amigos
    SELECT ID1 FROM Amizade
)
ORDER BY anoCurricular, nome;
