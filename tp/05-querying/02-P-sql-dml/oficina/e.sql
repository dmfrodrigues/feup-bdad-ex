SELECT Carro.idCarro, COUNT(Reparacao.idCarro) AS numReparacoes
FROM Carro LEFT JOIN Reparacao ON Carro.idCarro=Reparacao.idCarro
GROUP BY Carro.idCarro;