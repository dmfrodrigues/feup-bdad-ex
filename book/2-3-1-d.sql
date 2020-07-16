CREATE TABLE Printer (
    model   INT             PRIMARY KEY REFERENCES Product,
    color   INT,
    type    TEXT            CHECK(type IN ('ink-jet', 'laser')),
    price   NUMERIC(9, 2)   CHECK(price > 0)  
);
