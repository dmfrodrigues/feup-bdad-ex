-- Nomes dos clientes proprietários de carros que utilizaram peças com custo superior a 10€
SELECT nome FROM Cliente
WHERE idCliente IN (
    -- Clientes proprietários de carros que utilizaram peças com custo superior a 10€
    SELECT DISTINCT idCliente FROM Carro
    WHERE idCarro IN (
        -- Carros que utilizaram peças com custo superior a 10€
        SELECT idCarro FROM Reparacao
        WHERE idReparacao IN (
            -- Reparações que usaram peças com custo superior a 10€
            SELECT idReparacao FROM ReparacaoPeca
            WHERE idPeca IN (
                -- Peças com custo superior a 10€
                SELECT idPeca FROM Peca WHERE custoUnitario>10
            )
        )
    )
);