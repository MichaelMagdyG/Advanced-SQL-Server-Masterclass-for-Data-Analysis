--Exercise 1:

CREATE VIEW Sales.vw_Top10MonthOverMonth AS

WITH Sales AS
(
SELECT 
       OrderDate
	  ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
      ,TotalDue
	  ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)
FROM AdventureWorks2019.Sales.SalesOrderHeader
)

,Top10Sales AS
(
SELECT
OrderMonth,
Top10Total = SUM(TotalDue)
FROM Sales
WHERE OrderRank <= 10
GROUP BY OrderMonth
)


SELECT
A.OrderMonth,
A.Top10Total,
PrevTop10Total = B.Top10Total

FROM Top10Sales A
	LEFT JOIN Top10Sales B
		ON A.OrderMonth = DATEADD(MONTH,1,B.OrderMonth)

--ORDER BY 1



--Exercise 2:

/*

As you probably found out, If you try to use a temporary table in a view definition, you'll
receive an error.

In SQL Server, you cannot include temporary tables (either local or global) as part of a
view definition. Temporary tables have a limited scope and lifespan; they exist only for the
duration of a user session or the scope of the routine they were created in. Because of this
transient nature, they cannot be used as part of a view, which should have a more permanent
and consistent structure.

*/