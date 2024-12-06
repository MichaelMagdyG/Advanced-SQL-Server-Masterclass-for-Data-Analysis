--Selecting the most expensive item per order in a single query

SELECT
*
FROM
(
SELECT
SalesOrderID,
SalesOrderDetailID,
LineTotal,
LineTotalRanking = ROW_NUMBER() OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC)

FROM AdventureWorks2019.Sales.SalesOrderDetail

) A

WHERE LineTotalRanking = 1
