.mode columns
.headers on

PRAGMA foreign_keys=OFF;

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS College;
DROP TABLE IF EXISTS Apply;

PRAGMA foreign_keys=ON;

CREATE TABLE Student (
    sID INTEGER PRIMARY KEY,
    sName CHAR(10),
    GPA REAL,
    HS INT
);

CREATE TABLE College (
    cName CHAR(10) PRIMARY KEY,
    state CHAR(2),
    enr INT
);

CREATE TABLE Apply (
    sID INT REFERENCES Student,
    cName CHAR(10) REFERENCES College,
    major CHAR(10),
    dec CHAR(1),
    PRIMARY KEY (sID, cName, major)
);

INSERT INTO Student VALUES
(123, "Amy", 3.9, 1000),
(234, "Bob", 3.6, 1500),
(345, "Bob", 3.6, 500),
(347, "Bobby", 3.5, NULL);

INSERT INTO College VALUES
("FADEUP", "PT", 1500),
("FEUP", "PT", 55000),
("FCUP", "PT", 4500);

INSERT INTO Apply VALUES
(123, "FEUP", "MIEIC", "Y"),
(234, "FCUP", "LCC", "N"),
(345, "FEUP", "MIEEC", "Y");

INSERT INTO Student(sName, GPA) VALUES
('Louise', 3.9);

SELECT * FROM Student;
