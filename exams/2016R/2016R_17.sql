DROP TABLE IF EXISTS AmizadeTransitiva;

CREATE TABLE AmizadeTransitiva(
    ID1 INT REFERENCES Estudante(ID),
    ID2 INT REFERENCES Estudante(ID),
    PRIMARY KEY (ID1, ID2)
);

INSERT INTO AmizadeTransitiva(ID1, ID2)
SELECT DISTINCT a1.ID1, a2.ID2 FROM Amizade as a1, Amizade as a2
WHERE a1.ID2 = a2.ID1
AND a1.ID1 != a2.ID2
AND (a1.ID1, a2.ID2) NOT IN (SELECT * FROM Amizade)
ORDER BY a1.ID1, a2.ID2;

SELECT * FROM AmizadeTransitiva;
