--Starter query:

	SELECT
		*
	FROM (
		SELECT 
			ProductName = B.[Name],
			LineTotalSum = SUM(A.LineTotal),
			LineTotalSumRank = DENSE_RANK() OVER(ORDER BY SUM(A.LineTotal) DESC)

		FROM AdventureWorks2019.Sales.SalesOrderDetail A
			JOIN AdventureWorks2019.Production.Product B
				ON A.ProductID = B.ProductID

		GROUP BY
			B.[Name]
		) X

	WHERE LineTotalSumRank <= 10



--Basic (non-dynamic) stored procedure

CREATE PROCEDURE dbo.OrdersReport

AS

BEGIN
	SELECT
		*
	FROM (
		SELECT 
			ProductName = B.[Name],
			LineTotalSum = SUM(A.LineTotal),
			LineTotalSumRank = DENSE_RANK() OVER(ORDER BY SUM(A.LineTotal) DESC)

		FROM AdventureWorks2019.Sales.SalesOrderDetail A
			JOIN AdventureWorks2019.Production.Product B
				ON A.ProductID = B.ProductID

		GROUP BY
			B.[Name]
		) X

	WHERE LineTotalSumRank <= 10
END



--Execute stored procedure

EXEC dbo.OrdersReport





--Modify stored procedure to accept parameter

ALTER PROCEDURE dbo.OrdersReport(@TopN INT)

AS

BEGIN
	SELECT
		*
	FROM (
		SELECT 
			ProductName = B.[Name],
			LineTotalSum = SUM(A.LineTotal),
			LineTotalSumRank = DENSE_RANK() OVER(ORDER BY SUM(A.LineTotal) DESC)

		FROM AdventureWorks2019.Sales.SalesOrderDetail A
			JOIN AdventureWorks2019.Production.Product B
				ON A.ProductID = B.ProductID

		GROUP BY
			B.[Name]
		) X

	WHERE LineTotalSumRank <= @TopN
END



--Execute stored procedure

EXEC dbo.OrdersReport 20




--