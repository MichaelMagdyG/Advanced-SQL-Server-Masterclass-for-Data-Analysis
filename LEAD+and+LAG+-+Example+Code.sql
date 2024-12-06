--Basic LEAD/LAG example

SELECT
       SalesOrderID
      ,OrderDate
      ,CustomerID
      ,TotalDue
	  ,NextTotalDue = LEAD(TotalDue, 3) OVER(ORDER BY SalesOrderID)
	  ,PrevTotalDue = LAG(TotalDue, 3) OVER(ORDER BY SalesOrderID)

FROM AdventureWorks2019.Sales.SalesOrderHeader

ORDER BY SalesOrderID




--Looking forward (or backward) more than one record

SELECT
       SalesOrderID
      ,OrderDate
      ,CustomerID
      ,TotalDue
	  ,NextTotalDue = LEAD(TotalDue, 3) OVER(ORDER BY SalesOrderID)
	  ,PrevTotalDue = LAG(TotalDue, 3) OVER(ORDER BY SalesOrderID)

FROM AdventureWorks2019.Sales.SalesOrderHeader

ORDER BY SalesOrderID





--Using PARTITION with LEAD and LAG

SELECT
       SalesOrderID
      ,OrderDate
      ,CustomerID
      ,TotalDue
	  ,NextTotalDue = LEAD(TotalDue, 1) OVER(PARTITION BY CustomerID ORDER BY SalesOrderID)
	  ,PrevTotalDue = LAG(TotalDue, 1) OVER(PARTITION BY CustomerID ORDER BY SalesOrderID)

FROM AdventureWorks2019.Sales.SalesOrderHeader

ORDER BY CustomerID, SalesOrderID