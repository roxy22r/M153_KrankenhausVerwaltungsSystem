DROP FUNCTION IF EXISTS GetSupplierDeliversTable;
GO

CREATE FUNCTION GetSupplierDeliversTable()
	RETURNS TABLE
AS RETURN
	(SELECT sd.Id,s.CompanyName,h.NameOfHostpital,m.Desig,sd.UnitsInStock,sd.UnitsOnOrder 
		FROM SupplierDelivers sd
		LEFT JOIN Supplier s ON s.Id = sd.fk_Supplier
		LEFT JOIN Medicine m ON m.Id = sd.fk_Medication
		LEFT JOIN Hostpital h ON h.Id = sd.fk_Hospital
		WHERE sd.fk_Supplier=s.Id);

GO

SELECT * FROM GetSupplierDeliversTable();
GO

DROP FUNCTION IF EXISTS GetPatientTable;
GO

CREATE FUNCTION GetPatientTable()
	RETURNS TABLE
AS RETURN
	(SELECT pati.Id,pers.FirstName,pers.LastName,pers.Birthday,hos.NameOfHostpital,dis.Desig as 'Reason for residence',dis.isHealable  
		FROM Patient pati
		LEFT JOIN Person pers On pers.Id = pati.Fk_Person
		LEFT JOIN Hostpital hos ON hos.Id = pati.Fk_Stationed
		LEFT JOIN Disease  dis ON dis.Id =pati.Fk_Disease
		WHERE pati.Fk_Person=pers.Id);
GO

SELECT * FROM GetPatientTable();
GO

DROP FUNCTION IF EXISTS GetEmployeeTable;
GO

CREATE FUNCTION GetEmployeeTable()
	RETURNS TABLE 
AS RETURN
	(SELECT emp.Id,pers.FirstName,pers.LastName,pers.Birthday,(hos.NameOfHostpital+' '+pla.City) as 'Works at',emp.EntryDate,emp.HealthSector,emp.JobTitle 
		FROM Employee emp
		LEFT JOIN Person pers ON pers.Id = emp.Fk_Person
		LEFT JOIN Hostpital hos ON hos.Id=emp.Fk_WorkingHostpital
		LEFT JOIN Place pla ON pla.Id=hos.Fk_Place);
GO

SELECT * FROM GetEmployeeTable();
GO

DROP FUNCTION IF EXISTS GetHostpitalTable;
GO

CREATE FUNCTION GetHostpitalTable()
	RETURNS TABLE 
AS RETURN
	(SELECT hos.Id,hos.NameOfHostpital,pla.City,pla.PostalCode 
		FROM Hostpital hos
		LEFT JOIN Place pla ON pla.Id = hos.Id);
GO

SELECT * FROM GetHostpitalTable();
GO

DROP FUNCTION IF EXISTS GetSupplierTable;
GO

CREATE FUNCTION GetSupplierTable()
	RETURNS TABLE 
AS RETURN
	(SELECT sup.Id,sup.CompanyName,pers.FirstName+' '+pers.LastName as 'Owner'  
		FROM Supplier sup
		LEFT JOIN Person pers ON pers.Id = sup.Id);
GO

SELECT * FROM GetSupplierTable();
GO

