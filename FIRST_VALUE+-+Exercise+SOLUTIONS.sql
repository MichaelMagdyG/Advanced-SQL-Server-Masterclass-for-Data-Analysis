--Exercise 1 solution:

SELECT
	  EmployeeID = BusinessEntityID,
      JobTitle,
      HireDate,
      VacationHours,
	  FirstHireVacationHours = FIRST_VALUE(VacationHours) OVER(PARTITION BY JobTitle ORDER BY HireDate)
	  
FROM AdventureWorks2019.HumanResources.Employee

ORDER BY JobTitle, HireDate




--Exercise 2 solution:

SELECT
	A.ProductID,
	ProductName = A.[Name],
	B.ListPrice,
    B.ModifiedDate,
	HighestPrice = FIRST_VALUE(B.ListPrice) OVER(PARTITION BY B.ProductID ORDER BY B.ListPrice DESC),
	LowestPrice = FIRST_VALUE(B.ListPrice) OVER(PARTITION BY B.ProductID ORDER BY B.ListPrice),
	PriceRange = FIRST_VALUE(B.ListPrice) OVER(PARTITION BY B.ProductID ORDER BY B.ListPrice DESC)-
		FIRST_VALUE(B.ListPrice) OVER(PARTITION BY B.ProductID ORDER BY B.ListPrice)

FROM AdventureWorks2019.Production.Product A
	JOIN AdventureWorks2019.Production.ProductListPriceHistory B
  ON A.ProductID = B.ProductID

ORDER BY A.ProductID, B.ModifiedDate