.mode columns
.headers on

PRAGMA foreign_keys=OFF;

DROP TABLE IF EXISTS Pilot;
DROP TABLE IF EXISTS Team;
DROP TABLE IF EXISTS Aircraft;
DROP TABLE IF EXISTS Race;
DROP TABLE IF EXISTS Participation;
DROP TABLE IF EXISTS Duel;

PRAGMA foreign_keys=ON;

CREATE TABLE Team (
    name        CHAR(15)    NOT NULL    PRIMARY KEY,
    country     CHAR(15)    NOT NULL
);

CREATE TABLE Aircraft (
    model       CHAR(15)    NOT NULL    PRIMARY KEY,
    horsepower  INT,
    topspeed    INT,
    width       INT,
    height      INT,
    weight      INT
);

CREATE TABLE Pilot (
    num         INT         NOT NULL    PRIMARY KEY,
    firstname   CHAR(15)    NOT NULL,
    surname     CHAR(15)    NOT NULL,
    nationality CHAR(15)    NOT NULL,
    birthday    DATE,
    name        CHAR(15)    REFERENCES Team,
    model       CHAR(15)    REFERENCES Aircraft
);

CREATE TABLE Race (
    location        CHAR(15)    NOT NULL,
    edition         INT         NOT NULL,
    country         CHAR(15)    NOT NULL,
    date            DATE        NOT NULL    UNIQUE,
    gates           INT,
    eliminations    INT         DEFAULT 1,
    PRIMARY KEY (location, edition)
);

CREATE TABLE Participation (
    num                     INT     REFERENCES Pilot,
    location                CHAR(15),
    edition                 INT,
    trainingtime            INT     CHECK (trainingtime > 0),
    trainingpos             INT     CHECK (trainingpos >= 1),
    trainingpenalty         INT,
    qualificationtime       INT,
    qualificationpos        INT     CHECK (trainingpos >= 1),
    qualificationpenalty    INT,
    eliminationtime         INT,
    eliminationpos          INT     CHECK (trainingpos >= 1),
    eliminationpenalty      INT,
    FOREIGN KEY (location, edition) REFERENCES Race(location, edition)
);

CREATE TABLE Duel (
    numpilot1       INT         REFERENCES Pilot,
    numpilot2       INT         REFERENCES Pilot,
    location        CHAR(15)    NOT NULL,
    edition         INT         NOT NULL,
    dueltype        CHAR(15)    NOT NULL,
    timepilot1      INT         NOT NULL    CHECK (timepilot1 > 0),
    timepilot2      INT         NOT NULL    CHECK (timepilot2 > 0),
    penaltypilot1   INT         NOT NULL,
    penaltypilot2   INT         NOT NULL,
    PRIMARY KEY (raceLocation, raceEdition, pilot1, pilot2),
    FOREIGN KEY (raceLocation, raceEdition) REFERENCES Race(location, edition)
);
