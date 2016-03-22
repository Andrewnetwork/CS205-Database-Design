--- implementationQueries.sql 
--- Andrew Ribeiro 
--- December 08, 2009
--- CS 205


-- Describe all of the tables 

DESCRIBE customer; 

DESCRIBE reservation;

DESCRIBE roomType;

DESCRIBE room;

DESCRIBE visit; 

-- End describe 


-- Select all of the data

SELECT * 
FROM customer; 

SELECT *
FROM reservation; 

SELECT *
FROM roomType;


SELECT *
FROM room;


SELECT *
FROM visit; 


-- End select all of the data


-- Report 1.) Room rental frequency -- 

SELECT roomNumber"Room Number", count(roomNumber)"Rental Frequency"
FROM visit
GROUP BY roomNumber
ORDER BY "Rental Frequency"
DESC;


-- END OF REPORT 1 --

-- Report 2.) End of month bills  --

---- Notes ----
-- > Bill only if the visit ended in this month.  
---------------

SELECT customer.name"Occupant Name",visit.startDate"Visit start",
       customer.streetAddress"Street Address",customer.zip"zip code",
       customer.city,customer.state,roomType.nightlyRate * abs(visit.startDate - visit.endDate)Total
FROM visit,room,roomType,customer
WHERE visit.roomNumber = room.roomNumber AND
      room.roomType = roomType.type AND
      customer.customerID = visit.customerID  AND
      TO_CHAR(visit.endDate,'MON-YYYY') = (SELECT TO_CHAR(CURRENT_DATE, 'MON-YYYY')
                                           FROM dual)
ORDER BY visit.customerID; 


-- END OF REPORT 2 --
