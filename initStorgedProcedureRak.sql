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

AS BEGIN 
DECLARE @simpleErrorMSG VARCHAR(100)
SET @simpleErrorMSG = 'ERROR: The data was formatted incorretly'

	IF (SELECT COUNT (*) FROM Patient p WHERE p.Fk_Person=@Fk_Person)=1
		DECLARE @isSamePatientAlsoResponsiveEmployee BIT

		BEGIN TRY
			SET @isSamePatientAlsoResponsiveEmployee = dbo.isSamePerson(@Fk_Person,@Fk_Employee);
			print @isSamePatientAlsoResponsiveEmployee; 
				IF (@isSamePatientAlsoResponsiveEmployee=0)
					BEGIN TRY
						INSERT INTO Patient (Fk_Person,Fk_ResponsibleEmployee,Fk_Disease,Fk_Stationed)
						VALUES
						(@Fk_Person,@Fk_Employee,@Fk_Disease,@Fk_Stationed);
					END TRY
					BEGIN CATCH
								RAISERROR(@simpleErrorMSG,16,1)
					            ROLLBACK TRANSACTION

					END CATCH

		END TRY
		BEGIN CATCH
			IF @isSamePatientAlsoResponsiveEmployee = 1
				RAISERROR('ERROR:The Responsive Employee can not be the Patient ',16,1)
			ELSE
			BEGIN 
				RAISERROR('SECOND',16,1)

			END 
		END CATCH
	END
GO
-- Employee is the same Person with the Person id expected return -> 1
DECLARE @test_Person int
DECLARE @test_Employee int
DECLARE @test_Result bit
SET @test_Person = 4;
SELECT @test_Employee = e.Id FROM Employee e WHERE e.Fk_Person=@test_Person; 
EXEC createPatient @test_Person,1,1, @test_Employee;

GO
-- Person is not the same Employee but is the Person is an Employee expected return -> 0

DECLARE @test_Person int
DECLARE @test_Employee int
DECLARE @test_Result bit
SET @test_Person = 4;
SELECT TOP 1 @test_Employee = e.Id FROM Employee e WHERE e.Fk_Person!= @test_Person; 
EXEC @test_Result=createPatient @test_Person,1,1, @test_Employee;
PRINT @test_Result
GO

-- All attributes are null expected error message

EXEC @test_Result=createPatient null,null,null,null;
PRINT @test_Result
GO

-- NEW FUNCTION isSamePerson
DROP FUNCTION IF EXISTS isSamePerson
GO
CREATE FUNCTION isSamePerson(@Fk_Person INT ,@Fk_Employee INT)
		RETURNS BIT
	AS BEGIN 
		DECLARE @employeePersonId INT;
		DECLARE @result BIT;
		SET @result = 0;
		IF EXISTS(SELECT * FROM Employee e WHERE e.Id = @Fk_Employee) AND
		   EXISTS (SELECT * FROM Person p WHERE p.Id=@Fk_Person) 
			BEGIN
				SELECT @employeePersonId = e.Fk_Person FROM Employee e WHERE e.Id = @Fk_Employee
				IF  @employeePersonId = @Fk_Person
					BEGIN

						SET @result = 1
					END
					ELSE
						BEGIN
						RETURN cast('ERROR MSG Responsive Employee can not be the Patient' as int);
					END
	END 	
	RETURN @result 		
END 		
GO

-- TESTS isSamePerson
-- Employee is the same Person with the Person id expected return -> 1
DECLARE @test_Person int
DECLARE @test_Employee int
DECLARE @test_Result bit
SET @test_Person = 4;
SELECT @test_Employee = e.Id FROM Employee e WHERE e.Fk_Person=@test_Person; 
print @test_Employee 
 exec @test_Result = isSamePerson @test_Person, @test_Employee;
print @test_Result ;
GO

-- Person is not the same Employee but is the Person is an Employee expected return -> 0

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



