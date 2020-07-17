SELECT Carro.idCarro, IFNULL(SUM(julianday(dataFim)-julianday(dataInicio)+1), 0) AS tempoReparacoes
FROM Carro LEFT JOIN Reparacao ON Carro.idCarro=Reparacao.idCarro
GROUP BY Carro.idCarro;