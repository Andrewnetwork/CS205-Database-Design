c--- setup.sql 
--- Andrew Ribeiro 
--- December 08, 2009
--- CS 205


--- CREATE TABLES ---

CREATE TABLE customer
(
	customerID NUMBER(4) NOT NULL,
	name VARCHAR2(25) NOT NULL,
	streetAddress VARCHAR2(100) NOT NULL,
	city VARCHAR2(15) NOT NULL,
	state CHAR(2) NOT NULL, 
	zip CHAR(5) NOT NULL,
	PRIMARY KEY(customerID)
);

CREATE TABLE reservation
(
	reservationID NUMBER(4) NOT NULL,
	customerID NUMBER(4) NOT NULL, 
	room NUMBER(1) NOT NULL,
	startDate DATE NOT NULL, 
	endDate DATE,
	PRIMARY KEY(reservationID)	
);

CREATE TABLE roomType
(
	type NUMBER(1) NOT NULL,
	nightlyRate NUMBER(10,3) NOT NULL,
	PRIMARY KEY(type)
);

CREATE TABLE visit
(
	visitID NUMBER(4) NOT NULL,
	startDate DATE NOT NULL, 
	endDate DATE NOT NULL, 
	customerID NUMBER(4) NOT NULL, 
	roomNumber NUMBER(1) NOT NULL,
	PRIMARY KEY(visitID)
);

CREATE TABLE room
(
	roomNumber NUMBER(1) NOT NULL,
	roomType NUMBER(1) NOT NULL,
	PRIMARY KEY(roomNumber)
);

--- END CREATE TABLES ---

--- POPULATE TABLES ---

-- Populate table customer --
INSERT INTO customer 
VALUES('1','Andrew Ribeiro','124 Coalpit Hill Rd Unit #34','Danbury','CT','06810');

INSERT INTO customer 
VALUES('2','Jake Vogel','14 Blambord St','Danbury','CT','06810');

INSERT INTO customer 
VALUES('3','Jean Silva','4 Footers Ln','Danbury','CT','06810');

INSERT INTO  customer
VALUES('4','Mat Cambel', '28 Mango St','Bethel','CT','09387');

INSERT INTO  customer
VALUES('5','Blango mango', '50 Cole ln','Rodchester','CT','34563');

INSERT INTO  customer
VALUES('6','Killah Manto', '26 Water Man Ln','Bethel','CT','09387');

INSERT INTO  customer
VALUES('7','Lispo Japo', '99 King St','Yonkers','NY','89432');

INSERT INTO  customer
VALUES('8','Pal Peto', '34 Tomas Ln','Ballah','NY','34567');

INSERT INTO  customer
VALUES('9','Petre Manto', '49 Loper St','Pops','FL','09383');

INSERT INTO  customer
VALUES('10','Manta Ray', '23 Cool Man','Sanga','CA','13847');

INSERT INTO  customer
VALUES('11','Hopskip Mange', '8 Toter Ln','Bethel','CT','09387');


-- Populate table reservation--
INSERT INTO reservation 
VALUES('1','1','1','10-DEC-10','22-DEC-10');

INSERT INTO reservation 
VALUES('2','2','4','01-MAR-10','20-MAR-10');

INSERT INTO reservation 
VALUES('3','3','6','01-JAN-10','20-JAN-10');

INSERT INTO reservation 
VALUES('4','6','7','01-FEB-10','20-FEB-10');

INSERT INTO reservation 
VALUES('5','2','3','01-JAN-10','20-JAN-10');

INSERT INTO reservation 
VALUES('6','9','5','01-JAN-11','20-OCT-11');

INSERT INTO reservation 
VALUES('7','3','6','01-JAN-12','20-JAN-12');

INSERT INTO reservation 
VALUES('8','11','7','01-APR-10','20-MAY-10');

INSERT INTO reservation 
VALUES('9','10','5','01-AUG-10','20-AUG-10');

INSERT INTO reservation 
VALUES('10','2','2','01-JUN-10','23-JUL-10');


-- Populate table roomType--

-- Single Room no Bath
INSERT INTO roomType
VALUES('1','50.00');

-- Single Room with Bath
INSERT INTO roomType
VALUES('2','75.00');

-- Double Room with no Bath 
INSERT INTO roomType
VALUES('3','100.00');

-- Double Room with Bath 
INSERT INTO roomType
VALUES('4','150.00');


-- Populate table visit-- 
INSERT INTO visit
VALUES('1','12-DEC-09', '25-DEC-09','1','1');

INSERT INTO visit
VALUES('2','12-SEP-09', '1-DEC-09','1','1');

INSERT INTO visit
VALUES('3','10-NOV-09', '25-NOV-09','2','7');

INSERT INTO visit
VALUES('4','02-DEC-09', '13-DEC-09','3','2');

INSERT INTO visit
VALUES('5','02-APR-09', '10-MAY-09','4','4');

INSERT INTO visit
VALUES('6','01-DEC-09', '13-DEC-09','5','5');

INSERT INTO visit
VALUES('7','02-DEC-09', '24-DEC-09','6','6');

INSERT INTO visit
VALUES('8','03-FEB-09', '26-DEC-09','7','2');

INSERT INTO visit
VALUES('9','03-DEC-09', '26-DEC-09','8','3');

INSERT INTO visit
VALUES('10','03-FEB-09', '26-DEC-09','9','4');

INSERT INTO visit
VALUES('11','03-AUG-09', '26-DEC-09','10','7');

INSERT INTO visit
VALUES('12','03-MAR-09', '26-JUL-09','11','3');

INSERT INTO visit
VALUES('13','15-DEC-09', '27-DEC-09','11','5');




-- Populate table room -- 
INSERT INTO room
VALUES('1','1');

INSERT INTO room
VALUES('2','1');

INSERT INTO room
VALUES('3','2') 

INSERT INTO room
VALUES('4','2');

INSERT INTO room
VALUES('5','3'); 

INSERT INTO room
VALUES('6','3'); 

INSERT INTO room
VALUES('7','4');


--- END POPULATE TABLES ---

