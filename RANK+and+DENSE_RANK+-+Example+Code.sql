--ROW_NUMBER, RANK, AND DENSE_RANK, compared

SELECT
	SalesOrderID,
	SalesOrderDetailID,
	LineTotal,
	Ranking = ROW_NUMBER() OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC),
	RankingWithRank = RANK() OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC),
	RankingWithDenseRank = DENSE_RANK() OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC)

FROM AdventureWorks2019.Sales.SalesOrderDetail

ORDER BY SalesOrderID, LineTotal DESC