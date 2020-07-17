SELECT Matricula FROM Carro AS c, Reparacao AS r
WHERE c.idCarro=r.idCarro
AND dataFim LIKE "2010-09-%";