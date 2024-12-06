--Embedded scalar subquery example

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



--Rewritten with variables:

DECLARE @AvgPrice MONEY = (SELECT AVG(ListPrice) FROM AdventureWorks2019.Production.Product)

SELECT 
	   ProductID
      ,[Name]
      ,StandardCost
      ,ListPrice
	  ,AvgListPrice = @AvgPrice
	  ,AvgListPriceDiff = ListPrice - @AvgPrice

FROM AdventureWorks2019.Production.Product

WHERE ListPrice > @AvgPrice

ORDER BY ListPrice ASC