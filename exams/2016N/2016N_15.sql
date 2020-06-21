SELECT nome FROM Estudante, Amizade
WHERE Estudante.ID = Amizade.ID1
GROUP BY Estudante.ID
HAVING COUNT(*) > 3;
