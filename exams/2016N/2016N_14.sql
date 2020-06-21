SELECT
    Estudante.nome AS Estudante,
    Curso.nome AS Curso
FROM Estudante, Curso
WHERE Estudante.anoCurricular = 3 AND Estudante.curso = Curso.ID;
