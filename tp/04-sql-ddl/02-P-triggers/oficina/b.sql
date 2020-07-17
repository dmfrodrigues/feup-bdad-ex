DROP TRIGGER IF EXISTS AtualizaStockPecas;

CREATE TRIGGER AtualizaStockPecas
BEFORE INSERT ON ReparacaoPeca
FOR EACH ROW
WHEN (
    -- Modelo do carro que vai ser reparado 
    SELECT idModelo
    FROM Reparacao
    INNER JOIN Carro ON Reparacao.idCarro=Carro.idCarro
    WHERE idReparacao=New.idReparacao
) NOT IN (
    -- Modelos com que a peça é compatível
    SELECT idModelo
    FROM PecaModelo
    WHERE idPeca=New.idPeca
) OR (
    SELECT quantidade FROM Peca
    WHERE idPeca=New.idPeca
) < New.quantidade
BEGIN
    SELECT raise(rollback, "failed");
END;
