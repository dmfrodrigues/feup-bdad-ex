CREATE TABLE Outcomes (
    ship    CHAR(64)    REFERENCES Ships,
    battle  CHAR(64)    REFERENCES Battles,
    result  CHAR(16)    CHECK(result IN ('sunk', 'damaged', 'ok'))
);
