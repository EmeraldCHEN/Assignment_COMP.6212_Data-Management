-- Created by: Yuan Chen(Emerald) 

CREATE DATABASE COMP6212_A2_EmeraldC
Go

USE COMP6212_A2_EmeraldC
GO
 

/* --------  Create 8 tables -----------------      */

CREATE TABLE Vendor
(V#            INT   NOT NULL IDENTITY(1,1),
 VFName		   VARCHAR(25) NOT NULL,
 VLName        VARCHAR(20) NOT NULL,
 VStreet	   VARCHAR(65),
 VCity         VARCHAR(20) NOT NULL, 
 ContactNo	   CHAR(10) NOT NULL,
 CrStatus 	   CHAR(8)  NOT NULL,
 CONSTRAINT Verdor_pk PRIMARY KEY (V#) );
 
 
 
 CREATE TABLE Buyer
(B#             INT   NOT NULL IDENTITY(1,1),
 BFName			VARCHAR(25) NOT NULL,
 BLName         VARCHAR(20) NOT NULL,
 BStreet	    VARCHAR(65),
 BCity          VARCHAR(20) NOT NULL, 
 ContactNo	    CHAR(10) NOT NULL,
 CONSTRAINT Buyer_pk PRIMARY KEY (B#) );
 
 
 CREATE TABLE Category
(C#            INT   NOT NULL IDENTITY(1,1)  PRIMARY KEY,
 CName		   VARCHAR(30) NOT NULL  );
 
 
 CREATE TABLE Suburb
(S#          INT   NOT NULL IDENTITY(1,1),
 SName		 VARCHAR(30) NOT NULL,
 CONSTRAINT Suburb_pk PRIMARY KEY (S#) );

 
 CREATE TABLE Range 
(R#            INT   IDENTITY(1,1) NOT NULL,
 range		   VARCHAR(30)  NOT NULL,
 CONSTRAINT Range_pk PRIMARY KEY (R#) );
 
 
 CREATE TABLE Property 
(P#                     INT   IDENTITY(1,1) NOT NULL ,
 Prop_Address   		VARCHAR(65) NOT NULL,   		
 S#            		    INT   NOT NULL,
 R#						INT   NOT NULL,
 C#						INT   NOT NULL,
 B#						INT   NOT NULL,
 V#						INT   NOT NULL,
 CONSTRAINT Property_pk PRIMARY KEY (P#),
 CONSTRAINT Property_Suburb_fk FOREIGN KEY (S#) REFERENCES Suburb(S#) ON DELETE CASCADE,
 CONSTRAINT Property_Range_fk FOREIGN KEY (R#) REFERENCES Range(R#) ON DELETE CASCADE,
 CONSTRAINT Property_Category_fk FOREIGN KEY (C#) REFERENCES Category(C#) ON DELETE CASCADE,
 CONSTRAINT Property_Buyer_fk FOREIGN KEY (B#) REFERENCES Buyer(B#) ON DELETE CASCADE,
 CONSTRAINT Property_Vendor_fk FOREIGN KEY (V#) REFERENCES Vendor(V#) ON DELETE CASCADE );

 
 CREATE TABLE Offer 
(O#                    INT    NOT NULL IDENTITY(1,1),
 B#   		   		   INT    NOT NULL,
 P#            		   INT    NOT NULL,
 amount_offered		   MONEY  NOT NULL,
 CONSTRAINT Offer_pk PRIMARY KEY (O#),
 CONSTRAINT Offer_Buyer_fk FOREIGN KEY (B#) REFERENCES Buyer(B#) ON DELETE CASCADE,
 CONSTRAINT Offer_Property_fk FOREIGN KEY (P#) REFERENCES Property(P#) ON DELETE CASCADE );
 
 
 CREATE TABLE Requirement 
(Req#                  INT   NOT NULL IDENTITY(1,1),
 B#   		   		   INT   NOT NULL,
 S#            		   INT   NOT NULL,
 R#   		   		   INT   NOT NULL,
 C#            		   INT   NOT NULL,
 CONSTRAINT Requirement_pk PRIMARY KEY (Req#),
 CONSTRAINT Requirement_Buyer_fk FOREIGN KEY (B#) REFERENCES Buyer(B#) ON DELETE CASCADE,
 CONSTRAINT Requirement_Suburb_fk FOREIGN KEY (S#) REFERENCES Suburb(S#) ON DELETE CASCADE,
 CONSTRAINT Requirement_Range_fk FOREIGN KEY (R#) REFERENCES Range(R#) ON DELETE CASCADE,
 CONSTRAINT Requirement_Category_fk FOREIGN KEY (C#) REFERENCES Category(C#) ON DELETE CASCADE  );
 
 
/* --------  Populate 8 tables -----------------      */

INSERT INTO Vendor VALUES
('Robert', 'Dennis','1 Ohio St.','Tauranga','345-3454','good');
INSERT INTO Vendor VALUES
('Rina','Michael', '2 Missisippi Rd.','Tauranga','767-6566','good');
INSERT INTO Vendor VALUES
('Uta','Stone', '3 Alaska Dv.','Auckland','445-5444','good'); 
INSERT INTO Vendor VALUES
('Phillip','Valdez', '29 Faucibus St.','Tauranga','768-6800','good');
INSERT INTO Vendor VALUES
('Walter','Henry', '31 Vel Dv.','Auckland','912-5127','good');

 
 

INSERT INTO Buyer VALUES
('Aimee','Castillo','P.O. Box 620, 8689 Natoque Avenue','Auckland','924-54904'); 
INSERT INTO Buyer VALUES
('Lynn','Bright','4417 Maecenas Rd.','Tauranga','784-42007'); 
INSERT INTO Buyer VALUES
('Heather','Trevino','P.O. Box 281, 1637 Diam. Avenue','Tauranga','707-9574'); 
INSERT INTO Buyer VALUES
('Paula','Watts','7982 Eu Ave','Rotorua','021-41107'); 
INSERT INTO Buyer VALUES
('Ira','Ayala','3962 A, Rd.','Tauranga','749-5524'); 



 
INSERT INTO Category VALUES('Townhouse');
INSERT INTO Category VALUES('Apartment');
INSERT INTO Category VALUES('Villa');
INSERT INTO Category VALUES('House');
INSERT INTO Category VALUES('Unit');

 
 
INSERT INTO Suburb VALUES('City Centre'); 
INSERT INTO Suburb VALUES('Oropi');
INSERT INTO Suburb VALUES('Bayfair');
INSERT INTO Suburb VALUES('Gate Pa');
INSERT INTO Suburb VALUES('Greerton');
 
 
INSERT INTO Range VALUES('$100k to $200k'); 
INSERT INTO Range VALUES('$200k to $300k');
INSERT INTO Range VALUES('$300k to $400k');
INSERT INTO Range VALUES('$400k to $500k');
INSERT INTO Range VALUES('$500k to $600k');

 
INSERT INTO Property VALUES('598 Eros Ave',3,2,1,2,1);
INSERT INTO Property VALUES('1052 Euismod St.',4,5,2,4,5);
INSERT INTO Property VALUES('352 Ante Rd.',1,3,1,2,3);
INSERT INTO Property VALUES('6005 Diam. Road',4,5,1,4,5);
INSERT INTO Property VALUES('72 Orci Av.',1,2,1,2,3);


INSERT INTO Offer VALUES(1,3,101);
INSERT INTO Offer VALUES(2,5,300);
INSERT INTO Offer VALUES(3,1,245.8);
INSERT INTO Offer VALUES(4,2,156.5);
INSERT INTO Offer VALUES(5,4,425);


INSERT INTO Requirement VALUES(2,3,5,5);
INSERT INTO Requirement VALUES(4,3,5,3);
INSERT INTO Requirement VALUES(2,1,2,4);
INSERT INTO Requirement VALUES(2,2,1,5);
INSERT INTO Requirement VALUES(2,4,5,3);


--SELECT * FROM Requirement;

--SELECT * FROM Offer;

--CREATE INDEX IX_Offer_amount_offered
--ON Offer (amount_offered ASC);

--DROP INDEX Offer.IX_Offer_amount_offered;


--CREATE INDEX IX_Range_range
--ON Range (range);

--DROP INDEX Range.IX_Range_range;

CREATE INDEX IX_VName
ON Vendor(VFname, VLname);

CREATE INDEX IX_VContact
ON Vendor(VStreet, VCity, ContactNo);


CREATE INDEX IX_BName
ON Buyer(BFname, BLname);


CREATE INDEX IX_BContact
ON Buyer(BStreet, BCity, ContactNo);



