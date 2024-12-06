--Creating the view:

CREATE VIEW Sales.vw_SalesRolling3Days AS

SELECT
    OrderDate,
    TotalDue,
	SalesLast3Days = SUM(TotalDue) OVER(ORDER BY OrderDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
FROM (
	SELECT
		OrderDate,
		TotalDue = SUM(TotalDue)
	FROM
		Sales.SalesOrderHeader

	WHERE YEAR(OrderDate) = 2014

	GROUP BY
		OrderDate
) X


--Querying against the view:

SELECT
	OrderDate
   ,TotalDue
   ,SalesLast3Days
   ,[% Rolling 3 Days Sales] = FORMAT(TotalDue / SalesLast3Days, 'p')

FROM AdventureWorks2019.Sales.vw_SalesRolling3Days