USE  HospitalManagementSystem;

SELECT * FROM Person;

SELECT * FROM Medicine;
SELECT * FROM Place;
SELECT
Fk_WorkingHostpital,JobTitle,
HealthSector,EntryDate,
LastName,FirstName,Birthday
FROM Employees e
Left Join Person per ON per.Id= e.Fk_person
Left Join Hostpital h ON h.Id=e.Fk_WorkingHostpital
Left Join Place plc ON plc.Id=h.Fk_Place;

SELECT p.Id ,per.FirstName,per.LastName,hos.NameOfHostpital,dis.Desig FROM Patient p
LEFT JOIN Person per ON per.Id= p.Fk_Person
LEFT JOIN Hostpital hos ON hos.Id = p.Fk_Stationed
LEFT JOIN Disease dis ON dis.Id = p.Fk_Disease;
