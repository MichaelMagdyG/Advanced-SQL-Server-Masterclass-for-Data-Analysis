--Highest and lowest line totals per customer

SELECT
	SalesOrderID,
	SalesOrderDetailID,
	LineTotal,
	Ranking = ROW_NUMBER() OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC),
	HighestTotal = FIRST_VALUE(LineTotal) OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC),
	LowestTotal = FIRST_VALUE(LineTotal) OVER(PARTITION BY SalesOrderID ORDER BY LineTotal)

FROM AdventureWorks2019.Sales.SalesOrderDetail

ORDER BY
	SalesOrderID, LineTotal DESC




--First/oldest order per customer

SELECT 
	CustomerID,
	OrderDate,
	TotalDue,
	FirstOrderAmt = FIRST_VALUE(TotalDue) OVER(PARTITION BY CustomerID ORDER BY OrderDate)
 
FROM AdventureWorks2019.Sales.SalesOrderHeader

ORDER BY CustomerID, OrderDate


