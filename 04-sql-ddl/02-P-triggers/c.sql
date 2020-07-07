DROP TRIGGER IF EXISTS validaPecasReparacao;

CREATE TRIGGER validaPecasReparacao
AFTER INSERT ON ReparacaoPeca
FOR EACH ROW
BEGIN
    UPDATE Peca
    SET quantidade=quantidade-New.quantidade
    WHERE idPeca=New.idPeca;
END;
