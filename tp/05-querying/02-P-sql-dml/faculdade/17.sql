SELECT Nome, curso FROM (
    --Para cada aluno e curso, quantas cadeiras fez
    SELECT nr, Nome, COUNT(cod) AS nCadeiras, curso FROM (
        SELECT DISTINCT nr, Nome, cod, curso
        FROM Prova NATURAL JOIN Cadeira NATURAL JOIN Aluno
        WHERE nota>=10
    )
    GROUP BY nr, curso 
) NATURAL JOIN (
    --numero de cadeiras que cada curso tem
    SELECT curso, COUNT(cod) AS nCadeiras FROM Cadeira GROUP BY curso 
);