DROP DATABASE IF  EXISTS HospitalManagementSystem
GO
CREATE DATABASE HospitalManagementSystem
GO
USE HospitalManagementSystem
GO
DROP TABLE IF EXISTS Hostpital
GO
CREATE TABLE  Place(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	City VARCHAR(255),
	PostalCode int NOT NULL
);
GO
DROP TABLE IF EXISTS Hostpital
GO
-- TODO FUNCTION/PROCEDUR to count employees
CREATE TABLE Hostpital(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	NameOfHostpital varchar(255),
	LocationName varchar(255),
	Fk_Place int FOREIGN KEY REFERENCES  Place(Id)

);

GO
DROP TABLE IF EXISTS Person
GO
CREATE TABLE Person(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255) NOT NULL,
	Birthday  DATETIME
);

GO
DROP TABLE IF EXISTS Disease
GO
CREATE TABLE Disease(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Desig VARCHAR(255) NOT NULL,
);
GO
DROP TABLE IF EXISTS Patient
GO
CREATE TABLE Patient(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Fk_person int FOREIGN  KEY REFERENCES  Person(Id),
	Fk_stationed int FOREIGN  KEY REFERENCES  Hostpital(Id),
	Fk_Desig int FOREIGN KEY REFERENCES  Disease(Id)

);
GO
DROP TABLE IF EXISTS Employees
GO
CREATE TABLE Employees(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	JobTitle VARCHAR(255),
	HealthSector VARCHAR(255),
	EntryDate DATETIME,
	Fk_person int FOREIGN KEY REFERENCES  Person(Id),
	Fk_WorkingHostpital int FOREIGN KEY REFERENCES  Hostpital(Id)



);
GO
DROP TABLE IF EXISTS Medicine
Go
-- Desig stands for Designation
CREATE TABLE Medicine(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Desig VARCHAR(255),
	Price DECIMAL (9,2),
	Producer VARCHAR(255),

);

GO


--Help table
--CREATE TABLE diseaseHistory();
