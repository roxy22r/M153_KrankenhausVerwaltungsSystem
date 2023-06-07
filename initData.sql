Use HospitalManagementSystem;

INSERT INTO Disease (Desig,isHealable) VALUES
('AIDS',0),
('Blue-Green Algae',1),
('Coronavirus',1),
('Diphtheria',0),
('Enteroviruses',1),
('Hantavirus',0),
('Mumps',0),
('Fever',1),
('Ringworm',1),
('Salmonellosis',1),
('Zika Virus',0),
('Yellow Fever',0),
('Tentanus',1),
('Melyoma',0),
('Depression',0),
('Alzheimer',1),
('Bipolar',0),
('Anxiety',1),
('Cancer',1),
('Diabetes',0),
('HIV',0),
('Malaria',0),
('Ebola',0),
('Influenza',0),
('Heart Disease',1),
('Stroke',0),
('Arthritis',1),
('Asthma',0),
('Hepatitis B',0),
('Hepatitis C',0),
('Cholera',0),
('Schizophrenia',0),
('Leprosy',0);
GO
INSERT INTO PLACE (City,PostalCode) VALUES
('Bern',3006),
('Zuerich',8008),
('Basel',4001),
('Thun',3600),
('Stans',6370),
('Frauefeld',9548),
('Altdorf',6460),
('Sarnen',6060),
('Reid',4910),
('Herisau',9112),
('Arogno',6822),
('Zurich', 8091),
('Basel', 4031),
('Geneva', 1205),
('Lausanne', 1011),
('St. Gallen', 9007),
('Bern', 3010),
('Aarau', 5001),
('Baden', 5404),
('Liestal', 4410),
('Luzern', 6000); 
GO

INSERT INTO Person (FirstName,LastName,Birthday) VALUES
('Tom','Mathis', CONVERT(DATETIME,'1940-11-02 04:15 AM')),
('Emma','Christen', CONVERT(DATETIME,'1950-01-02 04:15 AM')),
('Sophie','Am Holz', CONVERT(DATETIME,'1944-05-12 04:15 AM')),
('Aline','Lichtenstein', CONVERT(DATETIME,'2018-06-12 04:15 AM')),
('Max','Gottwald', CONVERT(DATETIME,'1966-04-01 04:15 AM')),
('Rolf','Sommer', CONVERT(DATETIME,'1933-04-02 04:15 AM')),
('Fritz','Winter', CONVERT(DATETIME,'1922-02-04 04:15 AM')),
('Dave','Herbst',CONVERT(DATETIME,'1922-03-06 04:15 AM')),
('Aidan','Althias',CONVERT(DATETIME,'1970-03-12 04:15 AM')),
('Rahel','Masjis',CONVERT(DATETIME,'1988-03-11 04:15 AM')),
('Bibi','Am Boden',CONVERT(DATETIME,'1967-05-07 04:15 AM')),
('Rittarj','Waijy',CONVERT(DATETIME,'1946-07-05 04:15 AM')),
('Megator','Habibi',CONVERT(DATETIME,'1946-01-06 04:15 AM')),
('Leo','Singenberger',CONVERT(DATETIME,'1946-06-10 04:15 AM')),
('Leonardo','Singenberger',CONVERT(DATETIME,'2005-11-09 04:15 AM')),
('Niko','Stadelmann',CONVERT(DATETIME,'1955-08-03 04:15 AM')),
('Tabet','Bildrein',CONVERT(DATETIME,'1955-05-19 04:15 AM')),
('Meta','Reinhard',CONVERT(DATETIME,'1955-05-18 04:15 AM')),
('Greta','Setovic',CONVERT(DATETIME,'1955-03-04 04:15 AM')),
('Tom','Christen', CONVERT(DATETIME,'2022-11-07 07:05 PM')),
('Emma','Mathis', CONVERT(DATETIME,'2023-01-02 08:39 PM')),
('Mia','Niederberger', CONVERT(DATETIME,'2022-10-08 09:10 PM')),
('Sophie', 'Am Holz', CONVERT(DATETIME, '2011-12-22 10:10 PM')),
('Aline', 'Mueller', CONVERT(DATETIME, '2018-07-26 11:23 PM')),
('Max', 'Gottwald', CONVERT(DATETIME, '2017-01-04 12:55 PM')),
('Rolf', 'Bucher', CONVERT(DATETIME, '2016-02-04 01:20 PM')),
('Fritz', 'Neapflin', CONVERT(DATETIME, '2002-08-02 02:19 AM')),
('Dave', 'Berueter', CONVERT(DATETIME, '2020-08-03 03:17 AM')),
('Aidan', 'Mathis', CONVERT(DATETIME, '2008-12-03 03:16 AM')),
('Rahel', 'Christen', CONVERT(DATETIME, '2008-11-23 04:15 AM')),
('Silas', 'Am Boden', CONVERT(DATETIME, '2009-07-25 05:32 AM')),
('Rita', 'Wasser', CONVERT(DATETIME, '2005-05-17 06:33 AM')),
('Megan', 'Wasser', CONVERT(DATETIME, '2006-06-27 07:30 AM')),
('Leo', 'Singenberger', CONVERT(DATETIME, '2006-06-20 07:45 AM')),
('Leonardo', 'Singenberger', CONVERT(DATETIME, '2006-06-11 07:01 AM')),
('Mike', 'Stadelmann', CONVERT(DATETIME, '2008-08-18 07:22 PM')),
('Nicole', 'Bildrein', CONVERT(DATETIME, '2015-11-30 07:43 AM')),
('Yellena', 'Reinhard', CONVERT(DATETIME, '2021-11-08 05:40 PM')),
('Mustafa', 'Setovic', CONVERT(DATETIME, '2008-08-04 04:00 AM')),
('Owl', 'Green', CONVERT(DATETIME, '2008-01-14 01:00 AM')),
('Blue', 'BakerJ', CONVERT(DATETIME, '2019-08-03 01:13 AM')),
('Christin', 'Yetti', CONVERT(DATETIME, '2011-08-04 03:16 AM')),
('Kimm', 'Zenro', CONVERT(DATETIME, '2007-09-15 04:33 AM')),
('Enaro', 'Chia', CONVERT(DATETIME, '2007-03-26 05:44 AM')),
('Maxim', 'Pipe', CONVERT(DATETIME, '2004-11-27 06:55 AM')),
('Johny', 'Line', CONVERT(DATETIME, '1990-01-01 12:56 PM')),
('Bobby', 'Smoke', CONVERT(DATETIME, '1990-03-03 02:56 PM'));
GO

--In not done Please Change table attribute of Location to Place 
INSERT INTO Hostpital (NameOfHostpital,Fk_Place) VALUES
('Universiteats Spialt',1),
('Kantonsspital',2),
('Spitalzentrum',3),
('Spital ',4),
('Spital ',5),
('Spital ',6),
('Spital ',3),
('Spital ',15),
('Spital ',16),
('Klink st.Urban LUPS',12),
('Kantonsspital',10),
('Universiteats Kinderspital',3),
('Felix Plater Spital',1),
('Privatklink Belair',10),
('Asana Spital Menziken',8),
('Geburtshaus',7),
('Mia Gina Spital',1),
('klink Belair',10),
('Neona Spital ',8),
('Getto Spital',7)
GO
INSERT INTO Employee (Fk_Person,Fk_WorkingHostpital,JobTitle,HealthSector,EntryDate) VALUES
(4,1,'Chief of Radiology','Radiologic technician',CONVERT(DATE,'1970-08-15')),
(15,2,'Surgeon','Cardiac',CONVERT(DATE,'1970-08-15')),
(6,4,'Chief of Radiology','psychologist',CONVERT(DATE,'1970-08-15')),
(7,5,'Surgeon','Psychologist',CONVERT(DATE,'1990-08-15')),
(8,6,'Surgeon','Radiologic technician',CONVERT(DATE,'1970-08-15')),
(9,7,'Chief of Radiology','Neurologists',CONVERT(DATE,'1971-08-15')),
(11,8,'Obstetricians','Birth',CONVERT(DATE,'1988-08-15')),
(12,9,'Doctor','Gynecologist',CONVERT(DATE,'1988-08-15')),
(13,10,'Doctror','Urologists',CONVERT(DATE,'1978-08-15')),
(18,6,'Doctor','Dermatology',CONVERT(DATE,'1979-08-15')),
(19,1,'Chief of Radiology','Radiologic technician',CONVERT(DATE,'1970-08-15')),
(17,2,'Surgeon','Cardiac',CONVERT(DATE,'1970-08-15')),
(16,4,'Chief of Radiology','psychologist',CONVERT(DATE,'1970-08-15')),
(27,5,'Surgeon','Psychologist',CONVERT(DATE,'1990-08-15')),
(28,6,'Surgeon','Radiologic technician',CONVERT(DATE,'1970-08-15')),
(29,7,'Chief of Radiology','Neurologists',CONVERT(DATE,'1971-08-15')),
(31,8,'Obstetricians','Birth',CONVERT(DATE,'1988-08-15')),
(32,9,'Doctor','Gynecologist',CONVERT(DATE,'1988-08-15')),
(33,10,'Doctror','Urologists',CONVERT(DATE,'1978-08-15')),
(34,6,'Doctor','Dermatology',CONVERT(DATE,'1979-08-15'))

GO
INSERT INTO Patient 
(Fk_Disease,Fk_Person,Fk_Stationed,Fk_ResponsibleEmployee)
VALUES
(1,20,1,1),
(2,21,1,2),
(2,22,1,2),
(3,23,2,2),
(3,24,2,3),
(3,25,5,3),
(4,26,5,3),
(4,27,5,5),
(4,28,7,6),
(7,29,7,6),
(5,30,8,6),
(8,40,9,6),
(10,24,2,7),
(10,25,5,8),
(10,26,5,8),
(11,27,5,8),
(11,28,7,9),
(11,29,7,9),
(11,30,8,10),
(30,40,9,10);
GO
INSERT INTO dbo.Medicine (Desig, Price, Producer) VALUES
('Aspirin', 5.99, 'Bayer'),
('Lipitor', 12.50, 'Pfizer'),
('Ibuprofen', 3.25, 'Johnson & Johnson'),
('Amoxicillin', 8.75, 'Novartis'),
('Advil', 9.99, 'Johnson & Johnson'),
('Tylenol', 6.50, 'Johnson & Johnson'),
('Zantac', 7.25, 'GlaxoSmithKline'),
('Lisinopril', 15.75, 'Merck'),
('Metformin', 4.99, 'Novartis'),
('Nexium', 10.99, 'AstraZeneca'),
('Zoloft', 8.50, 'Pfizer'),
('Ventolin', 6.25, 'GlaxoSmithKline'),
('Omeprazole', 12.75, 'Teva'),
('Simvastatin', 9.99, 'Merck'),
('Paliperidon',80.15,'Invega'),
('Novolin R FlexPen',19.33,'Afrezza'),
('Neosporin',45.89,'HLO'),
('Lexapro',347.33,'Johnson & Johnson'),
('Zocor',432.54,'Visine'),
('Xanax',32.22,'CNC'),
('Lipitor',3892.10,'BKL'),
('Yaz',37.20,'MCN'),
('Ativan',11.46,'DLD'),
('Hytrin',22.99,'GTG');
GO

INSERT INTO Supplier (CompanyName,fk_Contact)
     VALUES
           ('MED DELIV', 33),
           ('MEDICCAT BY JOE ', 31),
           ('MEDICCAT BY ELISA', 32),
           ('DELIVRY FLY MED', 34),
           ('DELIVRY CCOPTER', 35),
           ('MEDYY DELVERY', 36),
           ('GOT U DELVERD', 37),
           ('HEAL BY DELEVERY', 38),
           ('MAxI SEND', 39),
           ('SPEED MED', 24),
           ('NICE DELIV', 25),
           ('PRY DELIVRY',26),
           ('MED-Copter', 27),
           ('MED Fight Bringer', 28),
           ('YEET HEAR', 39),
           ('Speedo Mo', 11),
           ('LIL DELIVERY', 12),
           ('SEE U SPEED DELIVRY', 13),
           ('FLIGHT DELIV', 14),
           ('FLY DELIVOO', 15),
           ('MAGIC DELVERY', 10);
GO

INSERT INTO SupplierDelivers 
(UnitsInStock, UnitsOnOrder, fk_Supplier, fk_Medication, fk_Hospital)
VALUES
(100,40,1,1,1),
(45,12,1,2,2),
(33,11,1,3,3),
(22,132,1,4,4),
(22,190,1,5,5),
(11,130,2,6,1),
(13,10,3,7,1),
(1,130,4,8,1),
(339,149,5,9,1),
(512,133,6,10,1),
(23,200,20,11,2),
(1340,30,19,12,2),
(55,534,18,13,2),
(16,234,17,14,2),
(89,13,1,16,2),
(69,41,15,15,20),
(70,51,15,16,20),
(77,27,15,17,20),
(87,75,8,18,20),
(99,31,8,19,15),
(23,41,8,19,15),
(12,41,9,4,15),
(11,671,9,6,5),
(7,561,2,7,5),
(33,71,2,8,5);

INSERT INTO DiseaseHistory (Fk_Hostpital, Fk_Patient, Fk_Employee, Fk_Medicine, EntryDate, isHealed)
	VALUES (1, 1, 1, 1, GETDATE(), 0);