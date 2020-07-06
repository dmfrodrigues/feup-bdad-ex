SELECT Nome FROM (
    SELECT nr, Nome, COUNT(cod) AS nCod FROM (
        SELECT DISTINCT nr, Nome, cod
        FROM Prova NATURAL JOIN Cadeira NATURAL JOIN Aluno
        WHERE curso='IS' AND nota>=10
    ) GROUP BY nr
) NATURAL JOIN (
    SELECT COUNT(cod) AS nCod FROM Cadeira WHERE curso='IS'
);