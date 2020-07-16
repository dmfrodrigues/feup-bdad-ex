CREATE TABLE Classes (
    class           CHAR(64)    PRIMARY KEY,
    type            CHAR(2)     CHECK(type IN ('bb', 'bc')),
    country         CHAR(64),
    numGuns         INT         CHECK(numGuns >= 0) DEFAULT 0,
    bore            FLOAT       CHECK(bore > 0),
    displacement    FLOAT       CHECK(displacement > 0)
);
