--Create the procedure:

CREATE PROCEDURE dbo.OrdersAboveThreshold(@Threshold MONEY, @StartYear INT, @EndYear INT)

AS

BEGIN
	SELECT 
		A.SalesOrderID,
		A.OrderDate,
		A.TotalDue

	FROM  AdventureWorks2019.Sales.SalesOrderHeader A
		JOIN AdventureWorks2019.dbo.Calendar B
			ON A.OrderDate = B.DateValue

	WHERE A.TotalDue >= @Threshold
		AND B.YearNumber BETWEEN @StartYear AND @EndYear
END


--Execute the procedure:

EXEC dbo.OrdersAboveThreshold 10000, 2011, 2013



