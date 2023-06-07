USE  HospitalManagementSystem;

GO
-- NEW FUNCTION getTotalEmployeesAndPatientsInHospital
-- This function counts the total amount of Employees and Patients of a Hospital via Hospital Id

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

--	TESTS  getTotalEmployeesAndPatientsInHospital
--	TEST CASE 1
--	Input Number with high Comma
--	Expected RETURN UniversiteatsSpialt Hospital with 3 Patient and 3 Person 

SELECT * FROM getTotalEmployeesAndPatientsInHospital(1);

--	TEST CASE 2
--	Input Number with high Comma
--	Expected return Asana Spital Menziken Hospital with 0 Patient and 0 Person 

SELECT * FROM getTotalEmployeesAndPatientsInHospital('15');

--	TEST CASE 3
--	Expected	return empty table

SELECT * FROM getTotalEmployeesAndPatientsInHospital(1000);

--	TEST CASE 4
--	Expected	return empty table

SELECT * FROM getTotalEmployeesAndPatientsInHospital(NULL);

GO

--END OF TEST getTotalEmployeesAndPatientsInHospital

DROP FUNCTION IF EXISTS isPersonEmployee
GO

-- NEW FUNCTION isPersonEmployee
-- This function validates if given Person by id is Employee

CREATE FUNCTION isPersonEmployee(@Fk_Person INT ,@Fk_Employee INT)
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
		END 	
	RETURN @result 		
END 		
GO

--	TESTS isPersonEmployee
--	TEST CASE 1 
--	Employee is the same Person with the Person id
--	Expected return -> 1

DECLARE @test_Person int
DECLARE @test_Employee int
DECLARE @test_Result bit
SET @test_Person = 4;
SELECT @test_Employee = e.Id FROM Employee e WHERE e.Fk_Person=@test_Person; 
print @test_Employee 
EXEC @test_Result = isPersonEmployee @test_Person, @test_Employee;
print @test_Result ;
GO

--	TEST CASE 2 
--	Person is NOT the same Employee but the Person is an Employee
--	Expected return -> 0

DECLARE @test_Person int
DECLARE @test_Employee int
DECLARE @test_Result bit
EXEC @test_Result =isPersonEmployee @test_Person, 100000;
print @test_Result 
GO

--	TEST CASE 3
--	Person is not the same Employee
--	Expected and Person is NOT an Employee return -> 0

DECLARE @test_Person int
DECLARE @test_Employee int
DECLARE @test_Result bit

SET @test_Person = 1;

SELECT TOP 1 @test_Employee = e.Id FROM Employee e WHERE e.Fk_Person!= @test_Person; 
EXEC @test_Result =isPersonEmployee @test_Person, @test_Employee;
print @test_Result 



DROP PROCEDURE IF EXISTS createPatient;
GO
-- NEW  PROCEDURE createPatient
-- This procedure creates a new Patient and validates if the new Patient is not the Responsive Employee
-- if its it will return a Error Message

CREATE PROCEDURE createPatient(@Fk_Disease INT,@Fk_Person INT,@Fk_Stationed INT,@Fk_Employee INT)
AS BEGIN 
	DECLARE @isSamePatientAlsoResponsiveEmployee BIT
	DECLARE @simpleErrorMSG VARCHAR(100)
	SET @simpleErrorMSG = 'ERROR: The data was formatted incorretly'
		IF EXISTS (SELECT * FROM Patient p WHERE p.Fk_Person=@Fk_Person)
		BEGIN 
			IF (dbo.isPersonEmployee(@Fk_Person,@Fk_Employee)=0)
			BEGIN 
				INSERT INTO Patient (Fk_Person,Fk_ResponsibleEmployee,Fk_Disease,Fk_Stationed)
				VALUES
				(@Fk_Person,@Fk_Employee,@Fk_Disease,@Fk_Stationed);
			END 
			ELSE BEGIN 
				RAISERROR(@simpleErrorMSG,16,1)
				ROLLBACK TRANSACTION
			END 
		END
		ELSE
		BEGIN
				RAISERROR('ERROR:The Responsive Employee can not be the Patient ',16,1)	
		END 
	END
	
GO

-- TESTS createPatient
-- TEST CASE 1 
-- Employee is the same Person with the Person id 
-- Expected return -> 1

DECLARE @test_Person int
DECLARE @test_Employee int
DECLARE @test_Result bit
SET @test_Person = 4;
SELECT @test_Employee = e.Id FROM Employee e WHERE e.Fk_Person=@test_Person; 
EXEC createPatient @test_Person,1,1, @test_Employee;

GO

-- TEST CASE 2
-- Person is not the same Employee but is the Person is an Employee
-- Expected return -> 0

DECLARE @test_Person int
DECLARE @test_Employee int
DECLARE @test_Result bit
SET @test_Person = 4;
SELECT TOP 1 @test_Employee = e.Id FROM Employee e WHERE e.Fk_Person!= @test_Person; 
EXEC @test_Result=createPatient @test_Person,1,1, @test_Employee;
PRINT @test_Result
GO

-- TEST CASE 3
-- All attributes are null
-- Expected error message

EXEC @test_Result=createPatient null,null,null,null;
PRINT @test_Result
GO


