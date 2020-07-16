CREATE TABLE Laptop (
    model   INT             PRIMARY KEY REFERENCES Product,
    speed   INT             CHECK(speed > 0),
    ram     INT             CHECK(ram > 0),
    hd      INT             CHECK(hd > 0),
    screen  FLOAT           CHECK(screen > 0),
    price   NUMERIC(9, 2)   CHECK(price > 0)  
);
