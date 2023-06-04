Use HospitalManagementSystem;

INSERT INTO Disease (Desig) VALUES
('AIDS'),
('Blue-Green Algae'),
('Coronavirus'),
('Diphtheria'),
('Enteroviruses'),
('Hantavirus'),
('Mumps'),
('Fever'),
('Ringworm'),
('Salmonellosis'),
('Zika Virus'),
('Yellow Fever'),
('Tentanus'),
('Melyoma'),
('Depression'),
('Alzheimer'),
('Bipolar'),
('Anxiety')

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
('Luzern',6004)

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
('Tabet','Bildrein',CONVERT(DATETIME,'1955-19-05 04:15 AM')),
('Meta','Reinhard',CONVERT(DATETIME,'1955-18-05 04:15 AM')),
('Greta','Setovic',CONVERT(DATETIME,'1955-14-03 04:15 AM')),
('Tom','Christen', CONVERT(DATETIME,'2022-11-07 07:05 PM')),
('Emma','Mathis', CONVERT(DATETIME,'2023-01-02 08:39 PM')),
('Mia','Niederberger', CONVERT(DATETIME,'2022-10-08 09:10 PM')),
('Sophie','Am Holz', CONVERT(DATETIME,'2011-22-12 10:10 PM')),
('Aline','Mueller', CONVERT(DATETIME,'2018-26-07 11:23 PM')),
('Max','Gottwald', CONVERT(DATETIME,'2017-04-01 12:55 PM')),
('Rolf','Bucher', CONVERT(DATETIME,'2016-04-02 01:20 PM')),
('Fritz','Neapflin', CONVERT(DATETIME,'2002-02-08 02:19 AM')),
('Dave','Berueter',CONVERT(DATETIME,'2020-03-08 03:17 AM')),
('Aidan','Mathis',CONVERT(DATETIME,'2008-03-12 03:16 AM')),
('Rahel','Christen',CONVERT(DATETIME,'2008-23-11 04:15 AM')),
('Silas','Am Boden',CONVERT(DATETIME,'2009-25-07 05:032 AM')),
('Rita','Wasser',CONVERT(DATETIME,'2004-17-05 06:33 AM')),
('Megan','Wasser',CONVERT(DATETIME,'2004-27-06 07:30 AM')),
('Leo','Singenberger',CONVERT(DATETIME,'2002-20-06 07:45 AM')),
('Leonardo','Singenberger',CONVERT(DATETIME,'2005-11-06 07:01 AM')),
('Mike','Stadelmann',CONVERT(DATETIME,'2006-18-08 07:22 PM')),
('Nicole','Bildrein',CONVERT(DATETIME,'2015-30-11 07:43 AM')),
('Yellena','Reinhard',CONVERT(DATETIME,'2021-08-11 05:40 PM')),
('Mustafa','Setovic',CONVERT(DATETIME,'2004-08-04 04:00 AM'));
GO
--In not done Please Change table attribute of Location to Place 
INSERT INTO Hostpital (NameOfHostpital,Fk_Place) VALUES
('UniversiteatsSpialt',1),
('Kantonsspital',2),
('Spitalzentrum',3),
('Spital',4),
('Spital',5),
('Spital',6),
('Klink st.Urban LUPS',12),
('Kantonsspital','10'),
('Universiteats Kinderspital',3),
('Felix Plater Spital',1),
('Privatklink Belair',10),
('Asana Spital Menziken',8),
('Geburtshaus',7)
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
(14,6,'Doctor','Dermatology',CONVERT(DATE,'1979-08-15'))

INSERT INTO Medicine 
(Desig,Producer,Price)
VALUES
('Paliperidon','Invega',80.15),
('Novolin R FlexPen','Afrezza',19.33),
('Neosporin','HLO',45.89),
('Lexapro','Johnson & Johnson',347.33),
('Zocor','Visine',432.54),
('Xanax','CNC',32.22),
('Lipitor','BKL',3892.10),
('Yaz','MCN',37.2),
('Ativan','DLD',11.46),
('Hytrin','GTG',22.99)
GO

INSERT INTO Patient 
(Fk_Disease,Fk_Person,Fk_Stationed)
VALUES
(1,56,1),
(2,57,1),
(2,58,1),
(3,59,2),
(3,60,2),
(3,61,5),
(4,62,5),
(4,63,5),
(4,64,7),
(7,65,7),
(5,66,8),
(8,67,9)


INSERT INTO dbo.Medicine (Desig, Price, Producer)
VALUES ('Aspirin', 5.99, 'Bayer'),
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
       ('Simvastatin', 9.99, 'Merck');