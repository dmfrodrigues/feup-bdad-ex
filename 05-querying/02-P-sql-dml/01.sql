.mode columns
.headers on
SELECT nr FROM Aluno;                                                                                            --1
SELECT cod, Design FROM Cadeira WHERE curso='AC';                                                                --2
SELECT DISTINCT Nome FROM Aluno NATURAL JOIN Prof;                                                               --3
SELECT DISTINCT Nome from Aluno EXCEPT SELECT Nome FROM Prof;                                                    --4
SELECT Nome from Aluno UNION SELECT Nome FROM Prof;                                                              --5
SELECT Nome FROM (SELECT DISTINCT nr, Nome FROM Aluno NATURAL JOIN Prova WHERE cod='TS1');                       --6
SELECT Nome FROM Aluno NATURAL JOIN (SELECT DISTINCT nr FROM Cadeira NATURAL JOIN Prova WHERE curso='IS');       --7
SELECT Nome FROM (
    SELECT nr, Nome, COUNT(cod) as nCod FROM (SELECT DISTINCT nr, Nome, cod FROM Prova NATURAL JOIN Cadeira NATURAL JOIN Aluno WHERE curso='IS' AND nota>=10) GROUP BY nr
) NATURAL JOIN (
    SELECT COUNT(cod) as nCod FROM Cadeira WHERE curso='IS'
);                                                                                                               --8
SELECT MAX(nota) FROM Prova;                                                                                     --9
SELECT AVG(nota) FROM Prova WHERE cod='BD';                                                                      --10
SELECT COUNT(nr) FROM Aluno;                                                                                     --11
SELECT curso, COUNT(cod) FROM Cadeira GROUP BY curso;                                                            --12
SELECT nr, COUNT(*) as nProvas FROM Prova GROUP BY nr;                                                           --13
SELECT AVG(nProvas) FROM (SELECT nr, COUNT(*) as nProvas FROM Prova GROUP BY nr);                                --14
SELECT Nome, avgNota FROM (SELECT Nome, nr, AVG(nota) AS avgNota FROM (Prova NATURAL JOIN Aluno) GROUP BY nr);   --15
SELECT Nome, cod, MAX(nota) as maxNota FROM Prova NATURAL JOIN Aluno GROUP BY cod;                               --16
SELECT Nome, curso FROM (
    SELECT nr, Nome, COUNT(cod) as nCadeiras, curso FROM (SELECT DISTINCT nr, Nome, cod, curso FROM Prova NATURAL JOIN Cadeira NATURAL JOIN Aluno WHERE nota>=10) GROUP BY nr, curso --Para cada aluno e curso, quantas cadeiras fez
) NATURAL JOIN (
    SELECT curso, COUNT(cod) as nCadeiras FROM Cadeira GROUP BY curso --numero de cadeiras que cada curso tem
);                                                                                                               --17
