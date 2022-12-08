CREATE DATABASE Careem;

CREATE TABLE customer(
cust_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cust_Name VARCHAR(50),
cust_ContactNo VARCHAR (50),
Location VARCHAR(50)
);

CREATE TABLE rides(
ride_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
ride_No VARCHAR(50),
cust_ID	INT,
FOREIGN KEY (cust_ID) REFERENCES customer(cust_ID)
);

CREATE TABLE captain(
capt_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
capt_Name VARCHAR(50),
capt_ContactNo VARCHAR(50),
capt_lisenceNo VARCHAR(50),
cust_ID	INT,
FOREIGN KEY (cust_ID) REFERENCES customer(cust_ID)
);

CREATE TABLE booking(
booking_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
booking_Type ENUM('Now Booking','Later Booking'),
capt_ID	INT,
FOREIGN KEY (capt_ID) REFERENCES captain(capt_ID),
cust_ID	INT,
FOREIGN KEY (cust_ID) REFERENCES customer(cust_ID),
ride_ID INT,
FOREIGN KEY (ride_ID) REFERENCES rides(ride_ID)
);


CREATE TABLE trip(
trip_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
fare_Detail VARCHAR(50),
estimated_Time VARCHAR(50),
destination VARCHAR(50),
booking_ID INT,
FOREIGN KEY (booking_ID) REFERENCES booking(booking_ID)
);

CREATE TABLE vehicles(
vehicle_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
vehicle_Model VARCHAR(50),
vehicle_Type ENUM('Go Mini', 'Go+', 'Business Class', 'Rikshaw', 'Bike'),
booking_ID INT,
FOREIGN KEY (booking_ID) REFERENCES booking(booking_ID)
);

CREATE TABLE payment(
payment_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
payment_Type ENUM('Card', 'Cash'),
payment_Time VARCHAR(50),
trip_ID INT,
FOREIGN KEY (trip_ID) REFERENCES trip(trip_ID)
);

INSERT INTO customer(cust_ID, cust_Name, cust_ContactNo, Location)
VALUES(1, 'Zain Khan', 03002666114, "Gulshan-e-Iqbal"),
(2, 'Syed Hamza', 03215557746, "FB Area"),
(3, 'Osama', 03302543168, "Jahur"),
(4, 'Taha', 03218887710, "Malir");


INSERT INTO captain(capt_ID, capt_Name, capt_ContactNo, capt_lisenceNo, cust_ID)
VALUES(1, 'Uzair', 03216543279, '2999EX1210', 1),
(2, 'Abdullah', 03216543279, '2779YS5674', 2),
(3, 'Malik', 03245543731, '2765TZ1223', 3),
(4, 'Faizan', 03216543279, '1219CZ1098', 4);


INSERT INTO rides(ride_ID, ride_No, cust_ID)
VALUE(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);


INSERT INTO booking(booking_ID, booking_Type, capt_ID, cust_ID, ride_ID)
VALUES(1, 'Now Booking', 1, 1, 1),
(2, 'Now Booking', 2, 2, 2),
(3, 'Later Booking', 3, 3, 3),
(4, 'Now Booking', 4, 4, 4);


INSERT INTO vehicles(vehicle_ID, vehicle_Model, vehicle_Type, booking_ID)
VALUES(1, 2016, 'Business Class', 1),
(2, 2013, 'Go Mini', 2),
(3, 2020, 'Bike', 3),
(4, 2022, 'Rikshaw', 4);


INSERT INTO trip(trip_ID, fare_Detail, estimated_Time, destination, booking_ID)
VALUES(1, 'Maximum Fare AED15','05:00 pm','Iqra University', 1),
(2, 'Minimum Fare FED14','09:05 am','Gulberg town', 2),
(3, 'Minimum Fare VTD13','02:10 pm','Saddar', 3),
(4, 'Maximum Fare AX05','04:30 pm','Power House', 4);


INSERT INTO payment(payment_ID, payment_Type, payment_Time, trip_ID)
VALUES(1, 'Card', '07:00 pm', 1),
(2, 'Card', '11:00 am', 2),
(3, 'Cash', '03:00 pm', 3),
(4, 'Cash', '06:00 pm', 4);

SELECT c.*,t.*
	FROM customer c,trip t
	WHERE c.cust_ID=t.trip_ID;
	
	SELECT c.*,t.fare_Detail,t.estimated_Time,p.payment_ID,p.payment_Type,p.payment_time
	FROM customer c,trip t,payment p
	WHERE c.cust_ID=t.trip_ID
	AND t.trip_ID=p.trip_ID

SELECT c.*,b.booking_Type,r.*
	FROM customer c,booking b,rides r
	WHERE c.cust_ID=b.booking_ID
	AND b.booking_ID=r.ride_ID
	
	
SELECT c.cust_ID,c.cust_Name,c.cust_ContactNo,capt_Name,capt_ContactNo
FROM customer c
INNER JOIN captain cap ON c.cust_ID=capt_ID

SELECT c.*,t.*
FROM customer c
LEFT JOIN trip t ON c.cust_ID=trip_ID;


UPDATE vehicles SET vehicle_Model=2018 WHERE vehicle_ID=1;

UPDATE captain SET capt_Name="Ahmed",capt_ContactNo='0321953530' WHERE capt_ID = 3

#FIND SECOND MAX HIGHEST VALUE
SELECT MAX(capt_ContactNo)FROM captain
WHERE capt_ContactNo<
(SELECT MAX(capt_ContactNo)FROM captain)


SELECT CHAR_LENGTH(cust_name) AS LengthOfName FROM customer;


SELECT INSTR("Gulshan-e-Iqbal", "Iqbal") AS MatchPosition FROM customer;


ALTER TABLE customer ADD COLUMN  city VARCHAR (50);
SELECT CONCAT(location," ", city) AS customer detail FROM customer;
ALTER TABLE customer DROP COLUMN city;

SELECT UCASE(booking_type) AS booking_type , UCASE(booking_ID)AS booking_ID FROM booking;
 

SELECT cust_ID, cust_Name, cust_ContactNo FROM customer  WHERE location="FB Area";
