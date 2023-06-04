CREATE FUNCTION fn_GetMedicationUsage (@MedicationId INT)
	RETURNS INT AS
BEGIN
	RETURN (SELECT COUNT(*) FROM DiseaseHistory 
	where Fk_Medicine = @MedicationId)
END

go;

CREATE PROCEDURE sp_NewDiseaseHistory
	@HospitalId INT,
	@PersonId INT,
	@EmployeeId INT,
	@MedicineId INT
AS BEGIN
	IF 
	EXISTS (SELECT * FROM Hostpital WHERE Hostpital.Id = @HospitalId) OR 
	EXISTS (SELECT * FROM Person WHERE Person.Id = @PersonId) OR 
	EXISTS (SELECT * FROM Employee WHERE Employee.Id = @EmployeeId) OR
	EXISTS (SELECT * FROM Medicine WHERE Medicine.Id = @MedicineId)
	BEGIN
		INSERT INTO DiseaseHistory (Fk_Hostpital, Fk_Person, Fk_Employee, Fk_Medicine, EntryDate, isHealed)
		VALUES (@HospitalId, @PersonId, @EmployeeId, @MedicineId, GETDATE(), 0);
	END
END