--Exercise 1:

SELECT 
 B.FirstName,
 B.LastName,
 C.JobTitle,
 A.Rate,
 AverageRate = AVG(A.Rate) OVER()

FROM AdventureWorks2019.HumanResources.EmployeePayHistory A
	JOIN AdventureWorks2019.Person.Person B
		ON A.BusinessEntityID = B.BusinessEntityID
	JOIN AdventureWorks2019.HumanResources.Employee C
		ON A.BusinessEntityID = C.BusinessEntityID



--Exercise 2:

SELECT 
 B.FirstName,
 B.LastName,
 C.JobTitle,
 A.Rate,
 AverageRate = AVG(A.Rate) OVER(),
 MaximumRate = MAX(A.Rate) OVER()

FROM AdventureWorks2019.HumanResources.EmployeePayHistory A
	JOIN AdventureWorks2019.Person.Person B
		ON A.BusinessEntityID = B.BusinessEntityID
	JOIN AdventureWorks2019.HumanResources.Employee C
		ON A.BusinessEntityID = C.BusinessEntityID




--Exercise 3:

SELECT 
 B.FirstName,
 B.LastName,
 C.JobTitle,
 A.Rate,
 AverageRate = AVG(A.Rate) OVER(),
 MaximumRate = MAX(A.Rate) OVER(),
 DiffFromAvgRate = A.Rate - AVG(A.Rate) OVER()

FROM AdventureWorks2019.HumanResources.EmployeePayHistory A
	JOIN AdventureWorks2019.Person.Person B
		ON A.BusinessEntityID = B.BusinessEntityID
	JOIN AdventureWorks2019.HumanResources.Employee C
		ON A.BusinessEntityID = C.BusinessEntityID



--Exercise 4:

SELECT 
 B.FirstName,
 B.LastName,
 C.JobTitle,
 A.Rate,
 AverageRate = AVG(A.Rate) OVER(),
 MaximumRate = MAX(A.Rate) OVER(),
 DiffFromAvgRate = A.Rate - AVG(A.Rate) OVER(),
 PercentofMaxRate = (A.Rate / MAX(A.Rate) OVER()) * 100

FROM AdventureWorks2019.HumanResources.EmployeePayHistory A
	JOIN AdventureWorks2019.Person.Person B
		ON A.BusinessEntityID = B.BusinessEntityID
	JOIN AdventureWorks2019.HumanResources.Employee C
		ON A.BusinessEntityID = C.BusinessEntityID
