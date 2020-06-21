CREATE TRIGGER AmizadeMesmoAno
AFTER INSERT ON Estudante
FOR EACH ROW
BEGIN
    INSERT INTO Amizade(ID1, ID2)
    SELECT e1.ID as ID1, e2.ID as ID2
        FROM Estudante AS e1, Estudante AS e2
        WHERE (e1.ID = NEW.ID OR e2.ID = NEW.ID)
        AND e1.anoCurricular = e2.anoCurricular
        AND e1.ID != e2.ID;
END;
