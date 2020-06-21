SELECT Estudante.nome AS Estudante FROM Estudante
WHERE nome LIKE "%a%"
AND curso IN (SELECT ID FROM Curso WHERE nome LIKE "MIEIC");
