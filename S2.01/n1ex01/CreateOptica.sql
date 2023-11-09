-- Crear esquema:
CREATE DATABASE IF NOT EXISTS n1ex01 CHARACTER SET utf8mb4;
USE n1ex01;

-- Crear tablas:
CREATE TABLE IF NOT EXISTS buyer
(
    buyerID INT ,
    referal_clientID INT NULL,
    name VARCHAR(20),
    country VARCHAR(56),
    city VARCHAR(58),
    street VARCHAR(20),
    street_number INT,
    floor INT,
    door CHARACTER(1),
    postal_code INT,
    phone_number INT,
    email VARCHAR(35),
    register_date DATETIME,
    PRIMARY KEY(buyerID)
);
CREATE TABLE IF NOT EXISTS glasses
(
    glassesID INT NOT NULL,
    brand VARCHAR(30),
    model VARCHAR(30),
    graduationR FLOAT(24),
    graduationL FLOAT(24),
    frame VARCHAR(25),
    frame_colour VARCHAR(25),
    glass_colour VARCHAR(25),
    price FLOAT(24),
    PRIMARY KEY(glassesID)
);

CREATE TABLE IF NOT EXISTS supplier
(
    NIF VARCHAR(30) NOT NULL,
    name VARCHAR(20),
    country VARCHAR(56),
    city VARCHAR(58),
    street VARCHAR(20),
    street_number INT,
    floor INT,
    door CHARACTER(1),
    postal_code INT,
    fax INT,
    PRIMARY KEY(NIF)
);

CREATE TABLE IF NOT EXISTS seller
(
    sellerID INT NOT NULL,
    name VARCHAR(20),
    country VARCHAR(56),
    city VARCHAR(58),
    street VARCHAR(20),
    street_number INT,
    floor INT,
    door CHARACTER(1),
    postal_code INT,
    phone_number INT,
    email VARCHAR(35),
    PRIMARY KEY(sellerID)
);

CREATE TABLE IF NOT EXISTS bill
(
    billID INT NOT NULL,
    glassesID INT NOT NULL,
    price FLOAT(24),
    date DATETIME,
    sellerID INT,
    buyerID INT,
    PRIMARY KEY(billID, glassesID)
);

CREATE TABLE IF NOT EXISTS brandSupplier
(
    brand VARCHAR(30) NOT NULL,
    supplierNIF VARCHAR(30),
    PRIMARY KEY(brand)
);

-- Crear Referencias
ALTER TABLE brandSupplier
    ADD    FOREIGN KEY (supplierNIF)
    REFERENCES supplier(NIF)
;
    
ALTER TABLE glasses
    ADD    FOREIGN KEY (brand)
    REFERENCES brandSupplier(brand)
;

ALTER TABLE buyer
    ADD    FOREIGN KEY (referal_clientID)
    REFERENCES buyer(buyerID)
;

ALTER TABLE bill
    ADD    FOREIGN KEY (glassesID)
    REFERENCES glasses(glassesID)
;
    
ALTER TABLE bill
    ADD    FOREIGN KEY (sellerID)
    REFERENCES seller(sellerID)
;
    
ALTER TABLE bill
    ADD    FOREIGN KEY (buyerID)
    REFERENCES buyer(buyerID)
;

-- inserts en la base de datos:
INSERT INTO supplier
VALUES("B27843264","Alco","Spain","Barcelona","Calle notanfalsa",52,1,'A',05253,663555234);
INSERT INTO supplier
VALUES("A18472452","GafasLocas","Spain","Girona","Calle alixpres",22,1,'C',03006,663123434);
INSERT INTO brandSupplier 
VALUES ("Gafaslocas", "B27843264");
INSERT INTO brandSupplier 
VALUES ("Affelou", "A18472452");
INSERT INTO glasses
VALUES(1,"Affelou","SPLL14",3.5,4.5,"metalic","black","colorless",500);
INSERT INTO glasses
VALUES(2,"Affelou","SPLL90",3.5,4.5,"metalic","black","colorless",500);
INSERT INTO glasses
VALUES(3,"Affelou","SPLL42",3.1,3.2,"paste","white","colorless",450.24);
INSERT INTO glasses
VALUES(4,"Gafaslocas","SPLU24",3.6,4.7,"metalic","white","colorless",442.23);
INSERT INTO seller
VALUES (21856354,"Carlos","Spain","Barcelona","Calle falsa",17,2,'B',08005,663555819,"carlosfalso@gmail.com");
INSERT INTO buyer
VALUES(35624158,null,"Juan","Spain","Barcelona","Calle mediofalsa",25,3,'2',08245,773655819,"juanfalso@gmail.com",'2023-10-28 08:00:00');
INSERT INTO bill
VALUES (1,1,500,'2023-10-28 08:49:00',21856354,35624158);
INSERT INTO bill
VALUES (2,2,500,'2021-10-28 06:32:00',21856354,35624158);
INSERT INTO bill
VALUES (3,3,450.24,'2023-10-16 06:32:00',21856354,35624158);   
