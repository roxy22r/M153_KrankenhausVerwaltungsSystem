USE  HospitalManagementSystem;

--   o Todo  Check if every table has 20 data records
--	 o ToDo getTotalEmployeesAndPatientsInHospital mind 3 Test +/-
--	 o TdeletePatient oDo mind 3 Test +/-
--DROP FUNCTION IF EXISTS getTotalEmployeesAndPatientsInHospital;

GO

CREATE FUNCTION  getTotalEmployeesAndPatientsInHospital(@hospitalId INT)
	RETURNS TABLE 
		AS 
		RETURN
			(
				SELECT h.Id,h.NameOfHostpital,COUNT(pat.Id) as 'Patient',COUNT(pers.Id) as 'Person' 
					FROM Hostpital h
					LEFT JOIN Patient pat ON pat.Fk_Stationed = h.Id
					LEFT JOIN Disease d ON d.Id = h.Id
					LEFT JOIN Person pers ON pat.Fk_Person = pers.Id
					WHERE h.Id= @hospitalId 
					GROUP BY h.NameOfHostpital, h.Id
			);
		
GO 

SELECT * FROM getTotalEmployeesAndPatientsInHospital(1);

GO

CREATE PROCEDURE deletePatient( @patientId INT)
AS BEGIN 
	IF( EXISTS (SELECT COUNT(*) FROM Patient WHERE Id=@patientId))
		BEGIN
			DELETE FROM Patient WHERE Id=@patientId;
				RETURN 1;
		END
	ELSE
			RETURN 0;
	END

GO

DECLARE @TEST BIT;
EXEC @TEST= deletePatient 7;
print @TEST;

DELETE FROM Patient WHERE Id=5;