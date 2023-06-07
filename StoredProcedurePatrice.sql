DROP FUNCTION IF EXISTS fn_GetMedicationUsage
go

CREATE FUNCTION fn_GetMedicationUsage (@MedicationId INT)
	RETURNS INT AS
BEGIN
	RETURN (SELECT COUNT(*) FROM DiseaseHistory 
	where Fk_Medicine = @MedicationId)
END
go

--tests:

	--GetMedicationUsage with valid, available id:
		--Should return the amount of medication which are used
			select anzahl = dbo.fn_GetMedicationUsage(1)
			go

	--GetMedicationUsage with valid unavailable id:
		--Should return 0
			select anzahl = dbo.fn_GetMedicationUsage(10000)
			go

	--GetMedicationUsage with wrong id
		--Should return 0
			select anzahl = dbo.fn_GetMedicationUsage(null);
			go

	
DROP PROCEDURE IF EXISTS sp_NewDiseaseHistory
go

CREATE PROCEDURE sp_NewDiseaseHistory
	@HospitalId INT,
	@PatientId INT,
	@EmployeeId INT,
	@MedicineId INT
AS BEGIN
	IF 
	EXISTS (SELECT * FROM Hostpital WHERE Hostpital.Id = @HospitalId) AND 
	EXISTS (SELECT * FROM Person WHERE Person.Id = @PatientId) AND 
	EXISTS (SELECT * FROM Employee WHERE Employee.Id = @EmployeeId) AND
	EXISTS (SELECT * FROM Medicine WHERE Medicine.Id = @MedicineId)
	BEGIN
		INSERT INTO DiseaseHistory (Fk_Hostpital, Fk_Patient, Fk_Employee, Fk_Medicine, EntryDate, isHealed)
		VALUES (@HospitalId, @PatientId, @EmployeeId, @MedicineId, GETDATE(), 0);
	END
	ELSE BEGIN
		RAISERROR('Invalid Id', 16, 1)
	END
END
go

--tests:

	-- Create new disease with valid Id:
		--Should return no error and succeed
			EXEC sp_NewDiseaseHistory 1, 1, 1, 1
			go

	--Create new Disease with Wrong Id:
		--Wrong HospitalId, should return Error: Invalid ID
			EXEC sp_NewDiseaseHistory 10000, 1, 1, 1
			go

		--Wrong PersonId, should return Error: Invalid ID
			EXEC sp_NewDiseaseHistory 1, 10000, 1, 1
			go

		--Wrong EmployeeId, should return Error: Invalid ID
			EXEC sp_NewDiseaseHistory 1, 1, 10000, 1
			go 

		--Wrong MedicineId, should return Error: Invalid ID
			EXEC sp_NewDiseaseHistory 1, 1, 1, 10000
			go