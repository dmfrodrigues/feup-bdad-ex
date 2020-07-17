SELECT Nome FROM (
    SELECT DISTINCT nr, Nome
    FROM Aluno NATURAL JOIN Prova
    WHERE cod='TS1'
);