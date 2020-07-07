DROP TRIGGER IF EXISTS insertOnView;

CREATE TRIGGER insertOnView
INSTEAD OF INSERT ON modelosMarcas
FOR EACH ROW
BEGIN
    INSERT INTO Marca(nome) VALUES (New.nomeMarca);
    INSERT INTO Modelo(nome, idMarca)
        SELECT NEW.nomeModelo, idMarca FROM Marca WHERE Marca.nome=NEW.nomeMarca;
END;
