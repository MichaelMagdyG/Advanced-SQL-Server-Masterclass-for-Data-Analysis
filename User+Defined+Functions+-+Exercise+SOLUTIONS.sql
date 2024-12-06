--Exercise 1

CREATE FUNCTION dbo.ufnIntegerPercent(@Numerator INT, @Denominator INT)
RETURNS VARCHAR(8)
AS   
BEGIN

	DECLARE @Decimal FLOAT  = (@Numerator * 1.0) / @Denominator

	RETURN FORMAT(@Decimal, 'P')

END




--Exercise 2

DECLARE @MaxVacationHours INT = (SELECT MAX(VacationHours) FROM AdventureWorks2019.HumanResources.Employee)

SELECT
	BusinessEntityID,
	JobTitle,
	VacationHours,
	PercentOfMaxVacation = dbo.ufnIntegerPercent(VacationHours, @MaxVacationHours)

FROM AdventureWorks2019.HumanResources.Employee



