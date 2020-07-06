-- Nomes dos clientes que não têm carro
SELECT nome FROM Cliente
WHERE idCliente NOT IN (
    -- Clientes que têm carro
    SELECT idCliente FROM Carro
);