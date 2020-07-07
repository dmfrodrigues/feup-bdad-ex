DROP TRIGGER IF EXISTS defaultCliente;

CREATE TRIGGER defaultCliente
AFTER INSERT ON Reparacao
FOR EACH ROW
WHEN New.idCliente IS NULL
BEGIN
    UPDATE Reparacao SET idCliente=(
        SELECT idCliente FROM Carro
        WHERE idCarro=New.idCarro
    );
END;
