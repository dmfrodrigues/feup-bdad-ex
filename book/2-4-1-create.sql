PRAGMA foreign_keys=OFF;

DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS PC;
DROP TABLE IF EXISTS Laptop;
DROP TABLE IF EXISTS Printer;

PRAGMA foreign_keys=ON;

CREATE TABLE Product (
    model INT PRIMARY KEY,
    maker VARCHAR(255),
    type  CHAR(10) CHECK(type IN ('pc', 'laptop', 'printer'))
);

CREATE TABLE PC (
    model   INT             PRIMARY KEY REFERENCES Product,
    speed   INT             CHECK(speed > 0),
    ram     INT             CHECK(ram > 0),
    hd      INT             CHECK(hd > 0),
    price   NUMERIC(9, 2)   CHECK(price > 0)  
);

CREATE TABLE Laptop (
    model   INT             PRIMARY KEY REFERENCES Product,
    speed   INT             CHECK(speed > 0),
    ram     INT             CHECK(ram > 0),
    hd      INT             CHECK(hd > 0),
    screen  FLOAT           CHECK(screen > 0),
    price   NUMERIC(9, 2)   CHECK(price > 0)  
);

CREATE TABLE Printer (
    model   INT             PRIMARY KEY REFERENCES Product,
    color   INT,
    type    TEXT            CHECK(type IN ('ink-jet', 'laser')),
    price   NUMERIC(9, 2)   CHECK(price > 0)  
);

INSERT INTO Product(maker, model, type) VALUES
('A', 1001, 'pc'      ),
('A', 1002, 'pc'      ),
('A', 1003, 'pc'      ),
('A', 2004, 'laptop'  ),
('A', 2005, 'laptop'  ),
('A', 2006, 'laptop'  ),
('B', 1004, 'pc'      ),
('B', 1005, 'pc'      ),
('B', 1006, 'pc'      ),
('B', 2007, 'laptop'  ),
('c', 1007, 'pc'      ),
('D', 1008, 'pc'      ),
('D', 1009, 'pc'      ),
('D', 1010, 'pc'      ),
('D', 3004, 'printer' ),
('D', 3005, 'printer' ),
('E', 1011, 'pc'      ),
('E', 1012, 'pc'      ),
('E', 1013, 'pc'      ),
('E', 2001, 'laptop'  ),
('E', 2002, 'laptop'  ),
('E', 2003, 'laptop'  ),
('E', 3001, 'printer' ),
('E', 3002, 'printer' ),
('E', 3003, 'printer' ),
('F', 2008, 'laptop'  ),
('F', 2009, 'laptop'  ),
('G', 2010, 'laptop'  ),
('H', 3006, 'printer' ),
('H', 3007, 'printer' );

INSERT INTO PC(model, speed, ram, hd, price) VALUES
(1001, 2.66, 1024, 250, 21.14),
(1002, 2.10, 512 , 250, 995  ),
(1003, 1.42, 512 , 80 , 478  ),
(1004, 2.80, 1024, 250, 649  ),
(1005, 3.20, 512 , 250, 630  ),
(1006, 3.20, 1024, 320, 1049 ),
(1007, 2.20, 1024, 200, 510  ),
(1008, 2.20, 2048, 250, 770  ),
(1009, 2.00, 1024, 250, 650  ),
(1010, 2.80, 2048, 300, 770  ),
(1011, 1.86, 2048, 160, 959  ),
(1012, 2.80, 1024, 160, 649  ),
(1013, 3.06, 512 , 80 , 529  );

INSERT INTO Laptop(model, speed, ram, hd, screen, price) VALUES
(2001, 2.00, 2048, 240, 20.1, 3673),
(2002, 1.73, 1024, 80 , 17.0, 949 ),
(2003, 1.80, 512 , 60 , 15.4, 549 ),
(2004, 2.00, 512 , 60 , 13.3, 1150),
(2005, 2.16, 1024, 120, 17.0, 2500),
(2006, 2.00, 2048, 80 , 15.4, 1700),
(2007, 1.83, 1024, 120, 13.3, 1429),
(2008, 1.60, 1024, 100, 15.4, 900 ),
(2009, 1.60, 512 , 80 , 14.1, 680 ),
(2010, 2.00, 2048, 160, 15.4, 2300);

INSERT INTO Printer(model, color, type, price) VALUES
(3001, 1, 'ink-jet',  99),
(3002, 0, 'laser'  , 239),
(3003, 1, 'laser'  , 899),
(3004, 1, 'ink-jet', 120),
(3005, 0, 'laser'  , 120),
(3006, 1, 'ink-jet', 100),
(3007, 1, 'laser'  , 200);
