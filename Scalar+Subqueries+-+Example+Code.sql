--Example 1: Scalar values

SELECT
	MAX(ListPrice)
FROM AdventureWorks2019.Production.Product

SELECT
	AVG(ListPrice)
FROM AdventureWorks2019.Production.Product




--Example 2: Scalar subqueries in the SELECT and WHERE clauses

SELECT 
	   ProductID
      ,[Name]
      ,StandardCost
      ,ListPrice
	  ,AvgListPrice = (SELECT AVG(ListPrice) FROM AdventureWorks2019.Production.Product)
	  ,AvgListPriceDiff = ListPrice - (SELECT AVG(ListPrice) FROM AdventureWorks2019.Production.Product)

FROM AdventureWorks2019.Production.Product

WHERE ListPrice > (SELECT AVG(ListPrice) FROM AdventureWorks2019.Production.Product)

ORDER BY ListPrice ASC