SELECT e1.nome FROM Estudante AS e1, Estudante AS e2, Amizade
WHERE ID1 = e1.ID AND ID2 = e2.ID
AND e2.nome LIKE "Gabriel%";
