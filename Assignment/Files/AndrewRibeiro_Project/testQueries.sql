--- testQueries.sql 
--- Andrew Ribeiro 
--- December 14, 2009
--- CS 205
--- Note: I did most of the test queries, but did my own at the end to compencate for the mising tests. 


-- EXERCISE 2 - TABLE  OPERATIONS
-- QUERYING  TABLES
-- SELECT...FROM...WHERE...
-- The following command would be used to select all the columns from the visit table:

SELECT *
FROM VISIT; 


-- The following command selects only visitID of all visits

SELECT visitID
FROM VISIT; 


-- COPYING TABLES
-- CREATE TABLE...AS...
-- The following command would be used to copy all the columns and all the rows
-- of the visit table to a new table called  visit_backup:

CREATE TABLE visit_backup 
AS (SELECT * 
    FROM visit);


-- The following command would be used to visually check that visit_backup is correct:

describe visit_backup;

-- USING THE WHERE CLAUSE
-- The following command would be used to select the visit of only those visits which ended in december

SELECT * 
FROM visit
WHERE TO_CHAR(endDate,'MON') = 'DEC';  

-- COPYING PART OF A TABLE
-- CREATE...TABLE...AS...

CREATE TABLE visitor
AS (SELECT customerID
    FROM VISIT); 

-- The following command would be used to create a table called . . .containing the . . . 
-- which . . . . from the table . . . .:


-- The following command would be used to check that the table was successfully 
-- created and desired records were successfully inserted:

DESCRIBE newTable;
SELECT * FROM newTable; 


-- DELETING  ROWS
-- DELETE  FROM...WHERE...
-- The following command would be used to delete a visit from the visit table:

DELETE FROM visit 
WHERE customerID = 1;


-- The following command would be used to delete those rows from the . . .table where . . .


-- DELETING ALL ROWS FROM A TABLE
-- The following command would be used to delete all the rows left in the visit table.

DELETE FROM visit;

-- DELETING TABLES
-- DROP TABLE...
-- The following command would be used to drop the visit table.


DROP TABLE visit;


-- LISTING TABLES
-- SELECT... FROM TAB
-- The following command would be used to list the tables that are owned by the user.

SELECT *
FROM TAB;


-- EXERCISE 3 - DATA MANIPULATION
-- DATE COMPARISON WITH RELATIONAL OPERATORS
-- The following command would be used to display the visits that begain after 01-DEC-09


SELECT * 
FROM VISIT 
WHERE startDate > '01-DEC-09';

-- USING AND AND OR IN THE WHERE CLAUSE
-- The following command would be used to display visits that ended between 01-DEC-09 and 25-DEC-09

SELECT * 
FROM VISIT 
WHERE startDate > '01-DEC-09' AND startDate < '25-DEC-09';


-- The following command would be used to display the visits that checked in in febuary or november

SELECT * 
FROM VISIT
WHERE TO_CHAR(startDate,'MON') = 'FEB' OR TO_CHAR(startDate,'MON') = 'NOV';

-- USING ARITHMETIC EXPRESSIONS IN QUERIES
-- ARITHMETIC IN THE WHERE CLAUSE
-- The following command would be used to select the visits that are longer than 30 days

SELECT *
FROM visit
WHERE (endDate - startDate) > 30;

-- ARITHMETIC IN THE SELECTCLAUSE
-- The following command would be used to show the length of all visits. 

SELECT endDate,startDate,endDate-startDate
FROM visit; 

-- BETWEEN...
-- The following command would be used to display the visits that started between '20-NOV-09' AND '30-DEC-09'

SELECT * 
FROM visit 
WHERE startDate BETWEEN '20-NOV-09' AND '30-DEC-09';

-- USING WILDCARD CHARACTERS
-- LIKE...
-- The following command would be used to display users where their last name starts with an R



SELECT SUBSTR(name,INSTR(name,' ')+1,LENGTH(name)+1-INSTR(name,' '))"Last Name"
FROM customer
WHERE SUBSTR(name,INSTR(name,' ')+1,LENGTH(name)+1-INSTR(name,' ')) LIKE 'R%';

-- The following command would retrieve users with the last name starting with M

SELECT SUBSTR(name,INSTR(name,' ')+1,LENGTH(name)+1-INSTR(name,' '))"Last Name"
FROM customer
WHERE SUBSTR(name,INSTR(name,' ')+1,LENGTH(name)+1-INSTR(name,' ')) LIKE 'M%';
  
-- ORDERING ROWS 
-- ORDER BY...ASCENDING
-- The following command would be used to select users in alphabetical order

SELECT name
FROM customer
ORDER BY name
ASC;

-- ORDER BY...DESCENDING
-- The following command would be used to select users in reverse alphabetical order
SELECT name
FROM customer
ORDER BY name
DESC;


-- GROUP FUNCTIONS
-- AVG... 
-- The following command would be used to calculate the average room rate.

SELECT AVG(nightlyRate)"Average nightly rate"
FROM roomType; 


-- COUNT...
-- The following command would be used to count to total number of visits.

SELECT COUNT(visitID)"Total number of visits" 
FROM visit; 

-- REMOVING DUPLICATE VALUES
-- DISTINCT...

-- The following command would be used to display the name of customers that have had reservations made. 

SELECT name 
FROM customer 
WHERE customerID IN(SELECT DISTINCT customerID 
		    FROM reservation);

-- EXERCISE 4 - TABLE MODIFICATION
-- ALTER TABLE... ADD...
-- The following command adds a numeric column called  extra with a width of 2 to the
-- visit table:

ALTER TABLE visit 
ADD(extra NUMBER(2));

-- ALTER TABLE...MODIFY...
-- The following command would be used to change the  extra column from NUMBER(2) to NUMBER(3)

ALTER TABLE visit
MODIFY (extra NUMBER(3));

-- UPDATING TABLE DATA
-- We will use a criteria based update on a partial copy of the customer table.
CREATE TABLE reservationCustomer AS SELECT * FROM customer WHERE customer IN reservation table;

CREATE TABLE reservationCustomer
AS (SELECT * 
    FROM customer 
    WHERE customerID IN( SELECT customerID 
                         FROM reservation));

SELECT * FROM reservationCustomer;

-- UPDATE...WHERE...
-- The following command increases a reservations end date by two days 

UPDATE reservation
SET endDate = endDate + 2
WHERE reservationID = 1; 

-- DELETING COLUMNS
-- The following command would be used to delete the whole column endDate from the 
-- table reservation and change the table definition accordingly:

DESCRIBE reservation; 

ALTER TABLE reservation 
DROP COLUMN endDate;

DESCRIBE reservation; 

-- COMMANDS  COMMIT AND ROLLBACK	
-- COMMIT
. .  . .

COMMIT;

DELETE FROM visit; 

-- ROLLBACK
ROLLBACK; 

-- The following commands create a new record in customer table, update the name, and commit 
-- the finished transaction.

COMMIT; 


INSERT INTO customer 
VALUES('12','Sam Peeters','88 Algorithm RD','Danbury','CT','06810');

UPDATE customer 
SET name = 'Sam Peters'
WHERE customerID = '12'; 


COMMIT;



-- EXERCISE 5 - QUERYING  SETS
-- QUERYING SETS  WHERE... IN...
-- The following command displays customer names in the reservation table. 

SELECT name
FROM customer 
WHERE customerID IN(SELECT customerID 
                    FROM reservation);

-- GROUPING QUERY RESULTS
-- The following command would be used to count the total number of reservations 

SELECT count(reservationID)"Number of reservations"
FROM reservation; 

-- GROUP BY...
-- The following command would be used to group rooms with their times rented.

SELECT roomNumber"Room Number", count(roomNumber)"Rental Frequency"
FROM visit
GROUP BY roomNumber
ORDER BY "Rental Frequency"
DESC;


-- VIEWS
-- The following command would be used to create a view which displays room rental frequencies

                             
CREATE VIEW customerBackup AS SELECT * FROM customer; 


-- UPDATABLE VIEWS
-- The following  UPDATE command may be used to update the visit table using the roomRentalFrequency
-- view. 

UPDATE customerBackup
SET name = 'Andrew Farts'
WHERE customerID = 1; 

-- The following command would be used to drop the . . . view:
-- DROP VIEW...

DROP VIEW customerBackup;

-- EXERCISE 6 - TABLE JOINS
-- THE WHERE CLAUSE JOINS TWO TABLES WITH A COMMON FIELD

SELECT customer.name, visit.roomNumber, visit.startDate, visit.endDate 
FROM customer,visit
WHERE customer.customerID = visit.customerID
ORDER BY customer.name,visit.startDate
ASC;

-- A JOIN BETWEEN THE customer AND visit TABLES ON id and name LIKE 'A%'
-- The following command would be used to display . . .

SELECT customer.name, visit.roomNumber, visit.startDate, visit.endDate 
FROM customer,visit
WHERE customer.customerID = visit.customerID AND name LIKE 'A%'
ORDER BY customer.name,visit.startDate
ASC;

-- JOINING FOUR TABLES
-- The following command displays the name room, room number,room type, and nightly rate for every visit.  

SELECT customer.name, visit.roomNumber, room.roomType, roomType.nightlyRate
FROM customer,visit,room,roomType 
WHERE customer.customerID = visit.customerID AND
      room.roomType = roomType.type AND 
      visit.roomNumber = room.roomNumber; 

-- NOTE: Column aliases have been used to reduce the length and improve the readability 
-- of the result. The alias "DATE" is a single word, but still needs to be in quotes, because 
-- the word DATE is reserved for the date data type.
-- The following example shows two other aspects of joins  -  EQUI- vs. NON-EQUI 
-- joins and joining a table to itself.
-- EQUI- AND NON-EQUI JOINS
-- JOINING A TABLE TO ITSELF WITH A NON-EQUI-JOIN
-- The following command would be used to perform a non-equi join of a table onto 
-- itself to show the visits that lasted longer than each of customer 1's visits. 

SELECT x.customerID,(x.endDate-x.startDate)"ndays",y.customerID,(y.endDate-y.startDate)"ndays"
FROM visit x, visit y
WHERE (x.endDate-x.startDate) < (y.endDate-y.startDate) AND
       x.customerID = '1' AND 
       y.customerID != '1';


-- EXERCISE 7 - SUBQUERIES
-- The following command would be used to display customer names in the visit table 

SELECT name 
FROM customer 
WHERE customerID IN( SELECT customerID 
                     FROM visit);

-- WHERE...NOT IN...SUBQUERY
-- The following examples are based on the subquery below, which returns customers that have never mad a reservation

SELECT name"No reservation customers"
FROM customer 
WHERE customerID NOT IN( SELECT customerID 
                         FROM reservation); 


-- The next example also has a main query and two subqueries;

-- USING ANY...WITH A SUBQUERY

-- *	The second subquery returns . . . .
-- *	The first subquery returns . . .
-- *	The main query returns ...

-- USING EQUALS ('=') WITH A SUBQUERY
-- The following command would be used to show the room type with the maximum room rate

SELECT type
FROM roomType 
WHERE nightlyRate = (SELECT MAX(nightlyRate)
                     FROM roomType);

 -- USING HAVING... WITH A SUBQUERY
-- The following command would be used to show the customer with more than one visit. 



-- EXERCISE 8 - INDEXES AND FUNCTIONS
-- CREATE UNIQUE INDEX...
-- The following command would be used to create a unique index called cool on the name
-- column of the customer table:

CREATE UNIQUE INDEX cool 
ON customer(name);

-- CREATE INDEX...
-- The following command would be used to create a secondary index on the ...table 
-- using a concatenated key of . . .and . . .

-- DROP INDEX...
-- The following command would be used to drop the concatenated index on the city
-- and zip fields of the customer table:

CREATE INDEX location_idx 
ON customer(city,zip);

-- FUNCTIONS WITH DATES
-- The following commands  would be used to display the customer name, start month, and end month of each visit

SELECT customer.name,TO_CHAR(visit.startDate,'MON')"Start Month",TO_CHAR(visit.endDate,'MON')"End Month"
FROM customer,visit
WHERE visit.customerID = customer.customerID
ORDER BY visit.startDate
DESC;

-- DATE FORMAT ELEMENTS
-- The following commands illustrate the use of date formats:

SELECT TO_CHAR(visit.startDate,'MONTH","DD SYEAR" in the "Q"th quarter"')"Start Month"
FROM visit;

-- WORKING WITH CHARACTERS
-- The following commands illustrate working with characters:
-- DECODE... AND LIKE...
-- The DECODE command is used to "translate" one value to another.
-- The following command would be used to decode the customerID to display Andrew Riberio for 1:

SELECT customerID,DECODE(customerID,'1','Andrew Ribeiro')
FROM customer
WHERE customerID = '1';

------ ADDITIONAL QUERIES ------ 
-- Get the current date 
SELECT TO_CHAR(CURRENT_DATE, 'MON-YYYY')"current_date"
FROM dual;

-- Get the room rates. 
SELECT room.roomNumber,roomType.nightlyRate
FROM room , roomType 
WHERE room.roomType = roomType.type; 

-- Get the length of a stay in days 
SELECT abs(startDate - endDate)
FROM visit;

-- Adjusting the length of a visit
-- Customer 1
UPDATE visit 
SET endDate = '27-DEC-09'
WHERE customerID = 1;

-- Removing a customer completely from the db 
-- Customer 1
DELETE FROM reservation
WHERE customerID = 1; 

DELETE FROM visit 
WHERE customerID = 1; 
                 
-- Show unocupided rooms 
SELECT room.roomNumber"Unoccupied Rooms"
FROM room
WHERE room.roomNumber NOT IN(SELECT roomNumber 
                             FROM visit 
                             WHERE endDate <= (SELECT CURRENT_DATE
                         		       FROM dual) AND
                                   startDate >= (SELECT CURRENT_DATE
                         		         FROM dual));

                         		     
-- Remove a reservation for a customer 
-- For the reservation starting on the first of January 2010
DELETE FROM reservation 
WHERE TO_CHAR(startDate,'dd-MON-yy') = '01-JAN-10';

-- List the total income for the room house 
SELECT SUM(Total)"Total Revenu"
       FROM (SELECT roomType.nightlyRate * abs(visit.startDate - visit.endDate)Total
             FROM visit,room,roomType
             WHERE visit.roomNumber = room.roomNumber AND
             room.roomType = roomType.type);

-- List the visitors and the the frequency of visits ordered by the number of visits. 
-- Enables user to see the most prolific customers. 

SELECT customerID
FROM visit






