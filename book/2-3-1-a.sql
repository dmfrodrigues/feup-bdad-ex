CREATE TABLE Product (
    model INT PRIMARY KEY,
    maker VARCHAR(255),
    type  CHAR(10) CHECK(type IN ('pc', 'laptop', 'printer'))
);
