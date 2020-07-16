CREATE TABLE Ships (
    name        CHAR(64)    PRIMARY KEY,
    class       CHAR(64)    REFERENCES Classes,
    launched    INT
);
