SELECT idReparacao,
       Cliente.idCliente,
       Cliente.nome AS nomeCliente,
       Proprietario.idCliente AS idProprietario,
       Proprietario.nome AS nomeProprietario
FROM Reparacao
INNER JOIN Carro ON Reparacao.idCarro=Carro.idCarro
INNER JOIN Cliente ON Reparacao.idCliente=Cliente.idCliente
INNER JOIN Cliente AS Proprietario ON Carro.idCliente=Proprietario.idCliente
WHERE Cliente.idCliente!=Proprietario.idCliente;