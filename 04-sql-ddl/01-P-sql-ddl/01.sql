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
    name        CHAR(15)    PRIMARY KEY,
    country     CHAR(15)
);

CREATE TABLE Aircraft (
    model       CHAR(15)    PRIMARY KEY,
    horsepower  INT,
    topspeed    INT,
    width       INT,
    height      INT,
    weight      INT
);

CREATE TABLE Pilot (
    num         INT     PRIMARY KEY,
    firstname   CHAR(15),
    surname     CHAR(15),
    nationality CHAR(15),
    birthday    DATE,
    name        CHAR(15)    REFERENCES Team,
    model       CHAR(15)    REFERENCES Aircraft
);

CREATE TABLE Race (
    location        CHAR(15),
    edition         INT,
    country         CHAR(15),
    date            DATE,
    gates           INT,
    eliminations    INT,
    PRIMARY KEY (location, edition)
);

CREATE TABLE Participation (
    num                     INT     REFERENCES Pilot,
    location                CHAR(15),
    edition                 INT,
    trainingtime            INT,
    trainingpos             INT,
    trainingpenalty         INT,
    qualificationtime       INT,
    qualificationpos        INT,
    qualificationpenalty    INT,
    eliminationtime         INT,
    eliminationpos          INT,
    eliminationpenalty      INT,
    FOREIGN KEY (location, edition) REFERENCES Race(location, edition)
);

CREATE TABLE Duel (
    numpilot1       INT     REFERENCES Pilot,
    numpilot2       INT     REFERENCES Pilot,
    location        CHAR(15),
    edition         INT,
    dueltype        CHAR(15),
    timepilot1      INT,
    timepilot2      INT,
    penaltypilot1   INT,
    penaltypilot2   INT,
    PRIMARY KEY (raceLocation, raceEdition, pilot1, pilot2),
    FOREIGN KEY (raceLocation, raceEdition) REFERENCES Race(location, edition)
);
