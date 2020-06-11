.mode columns
.headers on

PRAGMA foreign_keys=OFF;

DROP TABLE IF EXISTS Aluno;
DROP TABLE IF EXISTS Prof;
DROP TABLE IF EXISTS Cadeira;
DROP TABLE IF EXISTS Prova;

PRAGMA foreign_keys=ON;

CREATE TABLE Aluno (
    nr      INT         NOT NULL PRIMARY KEY,
    Nome    CHAR(32)    NOT NULL
);

CREATE TABLE Prof (
    sigla   CHAR(8)     NOT NULL PRIMARY KEY,
    Nome    CHAR(32)    NOT NULL
);

CREATE TABLE Cadeira (
    cod     CHAR(8)     NOT NULL PRIMARY KEY,
    Design  CHAR(64)    NOT NULL,
    curso   CHAR(8)     NOT NULL,
    regente CHAR(8)     NOT NULL REFERENCES Prof
);

CREATE TABLE Prova (
    nr      INT         NOT NULL REFERENCES Aluno,
    cod     CHAR(8)     NOT NULL REFERENCES Cadeira,
    data    DATE        NOT NULL,
    nota    INT         CHECK (0 <= nota AND nota <= 20),
    PRIMARY KEY (nr, cod, data)
);

INSERT INTO Aluno VALUES
(100, "João"),
(110, "Manuel"),
(120, "Rui"),
(130, "Abel"),
(140, "Fernando"),
(150, "Ismael");

INSERT INTO Prof VALUES
("ECO", "Eugénio"),
("FNF", "Fernando"),
("JLS", "João");

INSERT INTO Cadeira VALUES
("TS1", "Teoria dos Sistemas 1"                , "IS", "FNF"),
("BD" , "Bases de Dados"                       , "IS", "ECO"),
("EIA", "Estruturas de Informação e Algoritmos", "IS", "ECO"),
("EP" , "Electrónica de Potência"              , "AC", "JLS"),
("IE" , "Instalações Eléctricas"               , "AC", "JLS");

INSERT INTO Prova VALUES
(100, "TS1", 1992-02-11,  8),
(100, "TS1", 1993-02-02, 11),
(100, "BD" , 1993-02-04, 17),
(100, "EIA", 1992-01-29, 16),
(100, "EIA", 1993-02-02, 13),
(110, "EP" , 1992-01-30, 12),
(110, "IE" , 1992-02-05, 10),
(110, "IE" , 1993-02-01, 14),
(120, "TS1", 1993-01-31, 15),
(120, "EP" , 1993-02-04, 13),
(130, "BD" , 1993-02-04, 12),
(130, "EIA", 1993-02-02,  7),
(130, "TS1", 1992-02-11,  8),
(140, "TS1", 1993-01-31, 10),
(140, "TS1", 1992-02-11, 13),
(140, "EIA", 1993-02-02, 11),
(150, "TS1", 1992-02-11, 10),
(150, "EP" , 1993-02-02, 11),
(150, "BD" , 1993-02-04, 17),
(150, "EIA", 1992-01-29, 16),
(150, "IE" , 1993-02-02, 13);
