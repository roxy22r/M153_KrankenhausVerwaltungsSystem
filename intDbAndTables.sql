DROP DATABASE IF  EXISTS HospitalManagementSystem
GO
CREATE DATABASE HospitalManagementSystem
GO
USE HospitalManagementSystem
GO
DROP TABLE IF EXISTS Hostpital
GO
-- TODO FUNCTION/PROCEDUR to count employees
CREATE TABLE hostpital(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	NameOfHostpital varchar(255),
	locationName varchar(255),
);

GO
DROP TABLE IF EXISTS person
GO
CREATE TABLE person(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255) NOT NULL,
	Birthday  DATETIME
);

GO
DROP TABLE IF EXISTS disease

CREATE TABLE disease(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Desig VARCHAR(255),
);

DROP TABLE IF EXISTS patient
GO
CREATE TABLE patient(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	fk_person int FOREIGN  KEY REFERENCES  person(Id),
	fk_stationed int FOREIGN  KEY REFERENCES  hostpital(Id),
	fk_Desig int FOREIGN KEY REFERENCES  disease(Id)

);
GO
DROP TABLE IF EXISTS employees
GO
CREATE TABLE employees(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	JobTitle VARCHAR(255),
	HealthSector VARCHAR(255),
	EntryDate DATETIME,
	fk_person int FOREIGN KEY REFERENCES  person(Id),
	fk_WorkingHostpital int FOREIGN KEY REFERENCES  hostpital(Id)



);
GO
DROP TABLE IF EXISTS medicine
go
-- Desig stands for Designation
CREATE TABLE medicine(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Desig VARCHAR(255),
	Price DOUBLE (9,2),
	Producer VARCHAR(255),

);


--Help table
--CREATE TABLE diseaseHistory();
