USE  HospitalManagementSystem;

--	 o createPatient oDo mind 3 Test +/-
--   o DIAGRAMME
--	 o  Project README 
--   DROP FUNCTION IF EXISTS getTotalEmployeesAndPatientsInHospital;

GO
-- NEW FUNCTION getTotalEmployeesAndPatientsInHospital

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
					HAVING COUNT(*)>0
			);
		
GO 
--TESTS  getTotalEmployeesAndPatientsInHospital

--RETURN UniversiteatsSpialt Hospital with 3 Patient and 3 Person 
SELECT * FROM getTotalEmployeesAndPatientsInHospital(1);
--RETURN Asana Spital Menziken Hospital with 0 Patient and 0 Person 
SELECT * FROM getTotalEmployeesAndPatientsInHospital('15');
--RETURN EMPTY TABLE
SELECT * FROM getTotalEmployeesAndPatientsInHospital(1000);
--RETURN EMPTY TABLE
SELECT * FROM getTotalEmployeesAndPatientsInHospital(NULL);

GO
--END OF TEST getTotalEmployeesAndPatientsInHospital
DROP PROCEDURE IF EXISTS createPatient;
GO
CREATE PROCEDURE createPatient(@Fk_Disease INT,@Fk_Person INT,@Fk_Stationed INT,@Fk_Employee INT)
AS BEGIN TRY
	IF( EXISTS (SELECT * FROM Patient p WHERE p.Fk_Person=@Fk_Person))
		BEGIN
		DECLARE @isSamePatientAlsoResponsiveEmployee BIT
		SET @isSamePatientAlsoResponsiveEmployee = dbo.isSamePerson(@Fk_Person,@Fk_Employee);
			print @isSamePatientAlsoResponsiveEmployee; 
			IF (@isSamePatientAlsoResponsiveEmployee=0)
				BEGIN
					INSERT INTO Patient (Fk_Person,Fk_ResponsibleEmployee,Fk_Disease,Fk_Stationed)
					VALUES
					(@Fk_Person,@Fk_Employee,@Fk_Disease,@Fk_Stationed);
				END
			ELSE
				BEGIN
					RAISERROR('SOMTHING',16,1);
				END
		END
	
	END TRY
	BEGIN CATCH
	END CATCH
GO
-- Employee is the same Person with the Person id Expected RETURN -> 1

DECLARE @test_Person int
DECLARE @test_Employee int
DECLARE @test_Result bit
SET @test_Person = 4;
SELECT @test_Employee = e.Id FROM Employee e WHERE e.Fk_Person=@test_Person; 
 exec createPatient @test_Person,1,1, @test_Employee;

GO
-- Person is not the same Employee but is the Person is an Employee Expected RETURN -> 0

DECLARE @test_Person int
DECLARE @test_Employee int
DECLARE @test_Result bit
SET @test_Person = 4;
SELECT TOP 1 @test_Employee = e.Id FROM Employee e WHERE e.Fk_Person!= @test_Person; 
 exec createPatient @test_Person,1,1, @test_Employee;
GO

-- NEW FUNCTION isSamePerson
CREATE FUNCTION isSamePerson(@Fk_Person INT ,@Fk_Employee INT)
		RETURNS BIT
	AS BEGIN 
 DECLARE @ErrorMSGEmploeeIsPatient NVARCHAR(1000);
		DECLARE @employeePersonId INT
		DECLARE @result BIT

		SET @result = 0;
		IF EXISTS(SELECT * FROM Employee e WHERE e.Id = @Fk_Employee) AND
		   EXISTS (SELECT * FROM Person p WHERE p.Id=@Fk_Person) 
			BEGIN
				SELECT @employeePersonId = e.Fk_Person FROM Employee e WHERE e.Id = @Fk_Employee
				IF  @employeePersonId = @Fk_Person
					BEGIN
						SET @result = 1
					END
			
			END
		RETURN @result
		END
		GO
-- TESTS isSamePerson

-- Employee is the same Person with the Person id Expected RETURN -> 1
DECLARE @test_Person int
DECLARE @test_Employee int
DECLARE @test_Result bit
SET @test_Person = 4;
SELECT @test_Employee = e.Id FROM Employee e WHERE e.Fk_Person=@test_Person; 
print @test_Employee 
 exec @test_Result = isSamePerson @test_Person, @test_Employee;
print @test_Result ;
GO

-- Person is not the same Employee but is the Person is an Employee Expected RETURN -> 0

DECLARE @test_Person int
DECLARE @test_Employee int
DECLARE @test_Result bit
SET @test_Person = 4;
SELECT TOP 1 @test_Employee = e.Id FROM Employee e WHERE e.Fk_Person!= @test_Person; 
 exec @test_Result =isSamePerson @test_Person, @test_Employee;
print @test_Result 
-- Person is not the same Employee Expected and Person is NOT an Employee RETURN -> 0
GO

DECLARE @test_Person int
DECLARE @test_Employee int
DECLARE @test_Result bit

SET @test_Person = 1;

SELECT TOP 1 @test_Employee = e.Id FROM Employee e WHERE e.Fk_Person!= @test_Person; 
 exec @test_Result =isSamePerson @test_Person, @test_Employee;
print @test_Result 

