--Ranking all records within each group of sales order IDs

SELECT
	SalesOrderID,
	SalesOrderDetailID,
	LineTotal,
	ProductIDLineTotal = SUM(LineTotal) OVER(PARTITION BY SalesOrderID),
	Ranking = ROW_NUMBER() OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC)

FROM AdventureWorks2019.Sales.SalesOrderDetail

ORDER BY
SalesOrderID




--Ranking ALL records by line total - no groups!

SELECT
	SalesOrderID,
	SalesOrderDetailID,
	LineTotal,
	ProductIDLineTotal = SUM(LineTotal) OVER(PARTITION BY SalesOrderID),
	Ranking = ROW_NUMBER() OVER(ORDER BY LineTotal DESC)

FROM AdventureWorks2019.Sales.SalesOrderDetail

ORDER BY 5