USE BITS_copy;

SHOW TABLES;

SELECT *
FROM tasks;

SELECT *
FROM client;

SELECT *
FROM client
ORDER BY balance DESC, creditlimit ASC;

SELECT *
FROM client
ORDER BY balance DESC;

SELECT *
FROM client
ORDER BY city DESC;

SELECT *
FROM client
ORDER BY balance DESC, creditlimit ASC;

SELECT street, city
FROM client
ORDER BY 1 DESC, 2 DESC;

SELECT ABS(balance) AS abs_balance, clientname
FROM client;

SELECT LOG(creditlimit) AS log_credit, zipcode
FROM client;

select *
from consultant;

SELECT rate*hours
FROM consultant;

SELECT POW(Rate, 2) as rate_squared
from consultant;

SELECT SQRT(Rate) as square_root_rate
FROM consultant;

SELECT LEFT (city, 3)
FROM client;

SELECT REVERSE (clientname) as reverse_client
FROM client;

SELECT SUBSTRING(city,2,3) as substring_text
FROM client;

SELECT CONCAT(city, street) as city_street
FROM client;

SELECT CONCAT(clientnum, zipcode) as clientnum_zip
FROM client;

SELECT CHAR_LENGTH (street) as longest_street_name
FROM client
WHERE 1 = MAX(1);

CREATE TABLE category_drm AS
SELECT *
FROM tasks
WHERE category = 'DRM';

SELECT *
FROM category_drm;

ALTER TABLE category_drm
ADD COLUMN email VARCHAR(255);

ALTER TABLE category_drm
DROP COLUMN email;

CREATE TABLE average_credit AS
SELECT state, AVG(CreditLimit) AS average
FROM client
GROUP BY state;

SELECT *
FROM average_credit;

UPDATE category_drm
SET email = 'new.email@email.com'
WHERE taskID = 'DA11';
DELETE FROM category_drm
WHERE TaskID = 'DA11';

SELECT AVG(creditlimit) AS credit_balance, creditlimit
FROM client
GROUP BY creditlimit;

SELECT COUNT(*) AS credit_limit_per_client, creditlimit
FROM client
GROUP BY 2;

SELECT AVG(creditlimit) AS credit_limit_avg, creditlimit
FROM client
GROUP BY ROLLUP(2);

SELECT CreditLimit,
CASE
	WHEN CreditLimit<= 2500 THEN "bad credit"
    WHEN CreditLimit<= 5000 THEN "okay credit"
    WHEN CreditLimit<= 7500 THEN "better credit"
    ELSE "good credit"
END AS credit_rating,
AVG(creditlimit) as average_credit
FROM client
GROUP BY
	CASE
    WHEN CreditLimit<= 2500 THEN "bad credit"
    WHEN CreditLimit<= 5000 THEN "okay credit"
    WHEN CreditLimit<= 7500 THEN "better credit"
    ELSE "good credit"
END AS credit_rating,
COUNT(*) as number_of_creditors
FROM client
GROUP BY
CASE
 WHEN CreditLimit<= 2500 THEN "bad credit"
    WHEN CreditLimit<= 5000 THEN "okay credit"
    WHEN CreditLimit<= 7500 THEN "better credit"
    ELSE "good credit"
    END;

SELECT *
FROM client;

SELECT city,CASE
WHEN city IN ('Easton','Sunland', 'Lizton') THEN "Region 1"
WHEN city IN ('Harpersburg', 'Amo') THEN "REGION 2"
ELSE "REGION 3"
END AS 'region'
FROM client;

SELECT *
FROM client
ORDER BY city,
	CASE
		WHEN city = "Easton" THEN zipcode
        ELSE clientname
	END;

SELECT *
FROM tasks
ORDER BY category
	CASE
		WHEN category = "SOM" THEN price
        ELSE description
	END;

SELECT client.*
	FROM (
		SELECT *
			FROM client
		WHERE creditlimit = 5000
        ) client
	Where LEFT (city,1) <> 'A' ;
    
    SELECT *
    FROM client
    WHERE creditlimit = 5000;
    
SELECT * FROM tasks,

SELECT * FROM
(SELECT * FROM tasks
WHERE price<=65) tasks
WHERE category = 'DRM';

SELECT *
FROM tasks
WHERE price<=65 AND category = 'DRM';

SELECT * FROM tasks
WHERE price<=65;

SHOW TABLES;


SELECT client.clientnum, client.clientname, consultant.consltnum
FROM client
JOIN consultant ON client.consltnum=consultant.consultnum;

SELECT client.clientnum, client.clientnam, consultant.consultnum
FROM client
INNER JOIN consultant ON client.consltnum=consultant.consltnum;

SELECT a.clientnum, a.clientname, b.consltnum
FROM client a 
INNER JOIN consultant b ON a.consltnum=b.consltnum;




CREATE TABLE category_drm AS
SELECT *
FROM tasks
WHERE category = 'DRM';

SELECT *
FROM category_drm;

ALTER TABLE category_drm
ADD COLUMN email VARCHAR(255);

ALTER TABLE category_drm
DROP COLUMN email;

CREATE TABLE average_credit AS
SELECT state, AVG(CreditLimit) AS average
FROM client
GROUP BY state;

SELECT *
FROM average_credit;

UPDATE category_drm
SET email = 'new.email@email.com'
WHERE taskID = 'DA11';
DELETE FROM category_drm
WHERE TaskID = 'DA11';

SELECT AVG(creditlimit) AS credit_balance, creditlimit
FROM client
GROUP BY creditlimit;

SELECT COUNT(*) AS credit_limit_per_client, creditlimit
FROM client
GROUP BY 2;

SELECT AVG(creditlimit) AS credit_limit_avg, creditlimit
FROM client
GROUP BY ROLLUP(2);


CREATE TABLE Consultant (
    ConsltNum CHAR(2) PRIMARY KEY,
    LastName CHAR(15),
    FirstName CHAR(15),
    Street CHAR(15),
    City CHAR(15),
    State CHAR(2),
    ZipCode CHAR(5),
	Hours DECIMAL(4, 2 ),
	Rate DECIMAL(5, 2 )
);

CREATE TABLE Client (
    ClientNum CHAR(3) PRIMARY KEY,
    ClientName CHAR(35) NOT NULL,
    Street CHAR(20),
    City CHAR(15),
    State CHAR(2),
    ZipCode CHAR(5),
    Balance DECIMAL(8 , 2 ),
    CreditLimit DECIMAL(8 , 2 ),
    ConsltNum CHAR(2)
);

CREATE TABLE WorkOrders (
    OrderNum CHAR(5) PRIMARY KEY,
    OrderDate DATE,
    ClientNum CHAR(3)
);

CREATE TABLE Tasks (
    TaskID CHAR(4) PRIMARY KEY,
    Description CHAR(30),

    Category CHAR(3),
    Price DECIMAL(6 , 2 )
);

CREATE TABLE OrderLine (
    OrderNum CHAR(5),
    TaskID CHAR(4),
    ScheduledDate DATE,
    QuotedPrice DECIMAL(6 , 2 ),
    PRIMARY KEY (OrderNum , TaskID)
);

INSERT INTO Consultant
VALUES
('19', 'Turner', 'Christopher', '554 Brown Dr.', 'Tri City', 'FL', '32889', 40, 22.50)
;
INSERT INTO Consultant
VALUES
('22', 'Jordan', 'Patrick', '2287 Port Rd.', 'Easton', 'FL', '33998', 40, 22.50)
;
INSERT INTO Consultant
VALUES
('35', 'Allen', 'Sarah', '82 Elliott St.', 'Lizton', 'FL', '34344', 35, 20.00)
;
INSERT INTO Consultant
VALUES
('51', 'Shields', 'Tom', '373 Lincoln Ln.', 'Sunland', 'FL', '39876', 10, 15.00)
;


INSERT INTO Client
VALUES
('143','Hershey, Jarrod','135 E. Mill Street','Easton','FL','33998',1904.55,2500.00,'19')
;
INSERT INTO Client
VALUES
('75','Goduto, Sean','12 Saratoga Parkway','Tri City','FL','32889',2814.55,5000.00,'19')
;
INSERT INTO Client
VALUES
('299','Two Crafty Cousins','9787 NCR 350 West','Sunland','FL','39876',8354.00,10000.00,'22')
;
INSERT INTO Client
VALUES
 ('322','Prichards Pizza & Pasta','501 Air Parkway','Lizton','FL','34344',7335.55,10000.00,'35')
 ;
INSERT INTO Client
VALUES
 ('363','Salazar, Jason','56473 Cherry Tree Dr','Easton','FL','33998',900.75,2500.00,'35')
 ;
INSERT INTO Client
VALUES
 ('405','Fishermans Spot Shop','49 Elwood Ave.','Harpersburg','FL','31234',4113.40,7500.00,'19')
 ;
INSERT INTO Client
VALUES
 ('449','Seymour, Lindsey','4091 Brentwood Ln','Amo','FL','34466',557.70,5000.00,'22')
 ;
INSERT INTO Client
VALUES
('458','Bonnies Beautiful Boutique','9565 Ridge Rd.','Tri City','FL','32889',4053.80,7500.00,'22');
INSERT INTO Client
VALUES
 ('677','Yates, Nick','231 Day Rd.','Sunland','FL','39876',2523.80,2500.00,'35')
 ;
INSERT INTO Client
VALUES
 ('733','Howler, Laura','1368 E. 1000 S.','Lizton','FL','34344',3658.05,5000.00,'22')
 ;
INSERT INTO Client
VALUES
 ('826','Harpersburg Bank','65 Forrest Blvd.','Harpersburg','FL','31234',6824.55,10000.00,'19')
 ;
INSERT INTO Client
VALUES
 ('867','MarketPoint Sales','826 Host St.','Easton','FL','33998',3089.00,5000.00,'19')
;

INSERT INTO WORKORDERS
VALUES
('67101','2018-09-06','733')
;
INSERT INTO WORKORDERS
VALUES
 ('67313','2018-09-07','458')
;
INSERT INTO WORKORDERS
VALUES
 ('67424','2018-09-10','322')
;
INSERT INTO WORKORDERS
VALUES
 ('67838','2018-09-10','867')
;
INSERT INTO WORKORDERS
 VALUES
 ('67949','2018-09-10','322')
;
INSERT INTO WORKORDERS
VALUES
 ('68252','2018-09-12','363')
;
INSERT INTO WORKORDERS
VALUES
 ('68868','2018-09-14','867')
;
INSERT INTO WORKORDERS
VALUES
 ('68979','2018-09-17','826')
;

INSERT INTO TASKS
VALUES
('AC65','Accessories','ACC',80.00)
;
INSERT INTO TASKS
VALUES
('DA11','Data recovery major','DRM',175.00)
;
INSERT INTO TASKS
VALUES
('DI85','Data recovery minor','DRM',50.00)
;
INSERT INTO TASKS
VALUES
('HA63','Hardware major','HAM',225.00)
;
INSERT INTO TASKS
VALUES
('HI31','Hardware minor','HAM',165.00)
;
INSERT INTO TASKS
VALUES
('LA81','Local area networking (LAN)','LAN',104.00)
;
INSERT INTO TASKS
VALUES
('MO49','Mobility','MOB',65.00)
;
INSERT INTO TASKS
VALUES
('OT99','Other work','OTH',99.99)
;
INSERT INTO TASKS
VALUES
('PI54','Printing issues','PRI',50.00)
;
INSERT INTO TASKS
VALUES
('SA44','Software major','SOM',200.00)
;
INSERT INTO TASKS
VALUES
('SI77','Software minor','SOM',144.00)
;
INSERT INTO TASKS
VALUES
('SI91','Security install/repair','SIR',126.00)
;
INSERT INTO TASKS
VALUES
('UP38','Upgrades','UPG',185.00)
;
INSERT INTO TASKS
VALUES
('VR39','Virus removal','VIR',90.00)
;
INSERT INTO TASKS
VALUES
('WA33','Wide area networking (WAN)','WAN',130.00)
;
INSERT INTO TASKS
VALUES
('WC19','Web connectivity','WEC',75.00)
;

INSERT INTO OrderLine
VALUES
('67101','SI77','2018-09-10',144.00)
;
INSERT INTO OrderLine
VALUES
('67313','LA81','2018-09-12',104.00)
;
INSERT INTO OrderLine
VALUES
('67424','MO49','2018-09-14',65.00)
;
INSERT INTO OrderLine
VALUES
('67424','UP38','2018-09-14',185.00)
;
INSERT INTO OrderLine
VALUES
('67838','LA81','2018-09-14',104.00)
;
INSERT INTO OrderLine
VALUES
('67949','PI54','2018-09-21',50.00)
;
INSERT INTO OrderLine
VALUES
('67949','VR39','2018-09-21',88.00)
;
INSERT INTO OrderLine
VALUES
('67949','WA33','2018-09-21',126.00)
;
INSERT INTO OrderLine
VALUES
('68252','DI85','2018-09-24',50.00)
;
INSERT INTO OrderLine
VALUES
('68868','SA44','2018-09-24',200.00)
;
INSERT INTO OrderLine
VALUES
('68979','AC65','2018-09-27',77.00)
;
INSERT INTO OrderLine
VALUES
('68979','DA11','2018-09-27',970.00)
;

