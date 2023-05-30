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
('Anxity')

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
('Tom','Mathis', CONVERT(DATE,'1940-11-02')),
('Emma','Christen', CONVERT(DATE,'1950-01-02')),
('Mia','Holze', CONVERT(DATE,'1956-10-18')),
('Sophie','Am Holz', CONVERT(DATE,'1944-05-12')),
('Aline','Lichtenstein', CONVERT(DATE,'2018-06-17')),
('Max','Gottwald', CONVERT(DATE,'1966-04-01')),
('Rolf','Sommer', CONVERT(DATE,'1933-04-02')),
('Fritz','Winter', CONVERT(DATE,'1922-02-27')),
('Dave','Herbst',CONVERT(DATE,'1922-03-26')),
('Aidan','Althias',CONVERT(DATE,'1970-03-12')),
('Rahel','Masjis',CONVERT(DATE,'1988-03-11')),
('Bibi','Am Boden',CONVERT(DATE,'1967-05-07')),
('Rittarj','Waijy',CONVERT(DATE,'1946-07-05')),
('Megator','Habibi',CONVERT(DATE,'1946-01-06')),
('Leo','Singenberger',CONVERT(DATE,'1946-06-14')),
('Leonardo','Singenberger',CONVERT(DATE,'2005-11-15')),
('Niko','Stadelmann',CONVERT(DATE,'1955-08-30')),
('Tabet','Bildrein',CONVERT(DATE,'1955-09-23')),
('Meta','Reinhard',CONVERT(DATE,'1955-08-22')),
('Greta','Setovic',CONVERT(DATE,'1955-08-13')),
('Tom','Christen', CONVERT(DATE,'2022-11-02')),
('Emma','Mathis', CONVERT(DATE,'2023-01-02')),
('Mia','Niederberger', CONVERT(DATE,'2022-10-18')),
('Sophie','Am Holz', CONVERT(DATE,'2011-05-12')),
('Aline','Mueller', CONVERT(DATE,'2018-06-17')),
('Max','Gottwald', CONVERT(DATE,'2017-04-01')),
('Rolf','Bucher', CONVERT(DATE,'2016-04-02')),
('Fritz','Neapflin', CONVERT(DATE,'2002-02-27')),
('Dave','Berueter',CONVERT(DATE,'2020-03-26')),
('Aidan','Mathis',CONVERT(DATE,'2008-03-12')),
('Rahel','Christen',CONVERT(DATE,'2008-03-11')),
('Silas','Am Boden',CONVERT(DATE,'2009-05-07')),
('Rita','Wasser',CONVERT(DATE,'2004-07-05')),
('Megan','Wasser',CONVERT(DATE,'2004-01-06')),
('Leo','Singenberger',CONVERT(DATE,'2002-06-14')),
('Leonardo','Singenberger',CONVERT(DATE,'2005-11-15')),
('Mike','Stadelmann',CONVERT(DATE,'2006-08-30')),
('Nicole','Bildrein',CONVERT(DATE,'2015-09-23')),
('Yellena','Reinhard',CONVERT(DATE,'2021-08-22')),
('Mustafa','Setovic',CONVERT(DATE,'2004-08-13'))
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
INSERT INTO Employees (Fk_Person,Fk_WorkingHostpital,JobTitle,HealthSector,EntryDate) VALUES
(4,1,'Chief of Radiology','Radiologic technician',CONVERT(DATE,'1970-08-15')),
(15,2,'Surgeon','Cardiac',CONVERT(DATE,'1970-08-15')),
(6,4,'Chief of Radiology','psychologist',CONVERT(DATE,'1970-08-15')),
(7,5,'Surgeon','psychologist',CONVERT(DATE,'1990-08-15')),
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

INSERT INTO diseaseHistory 
(Fk_Patient,Fk_Disease,Fk_Employees,Fk_Hostpital,EntryDate,DischargeDate )
VALUES
(6,4,2,1,CONVERT(DATE,'1970-08-15'),CONVERT(DATE,'1970-08-15'))