/*Rolling 3 day total*/

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

ORDER BY
    OrderDate



/*Rolling 3 day total, not inclusive of "current" row*/


SELECT
    OrderDate,
    TotalDue,
	SalesLast3Days = SUM(TotalDue) OVER(ORDER BY OrderDate ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING)
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

ORDER BY
    OrderDate


/*Rolling 3 day total, spanning previous and following row*/


SELECT
    OrderDate,
    TotalDue,
	SalesLast3Days = SUM(TotalDue) OVER(ORDER BY OrderDate ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
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

ORDER BY
    OrderDate



/*Rolling 3 day average - aka, a "moving" average*/


SELECT
    OrderDate,
    TotalDue,
	SalesLast3Days = AVG(TotalDue) OVER(ORDER BY OrderDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
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

ORDER BY
    OrderDate

















/*Rolling 3 day total, spanning previous and following row*/



SELECT
    OrderDate,
    TotalDue,
	SalesLast3Days = SUM(TotalDue) OVER(ORDER BY OrderDate ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
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

ORDER BY
    OrderDate
















/*Rolling 3 day average - aka, a "moving" average*/


SELECT
    OrderDate,
    TotalDue,
	SalesLast3Days = AVG(TotalDue) OVER(ORDER BY OrderDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
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

ORDER BY
    OrderDate