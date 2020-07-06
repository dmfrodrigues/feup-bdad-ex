SELECT dataInicio, dataFim, nome
FROM Cliente NATURAL JOIN Reparacao INNER JOIN Carro ON Reparacao.idCarro=Carro.idCarro
GROUP BY Reparacao.idCarro
HAVING COUNT(*) > 1;