--Multiple IF statement example

ALTER PROCEDURE dbo.OrdersReport(@TopN INT, @OrderType INT)

AS

BEGIN

	IF @OrderType = 1
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
	IF @OrderType = 2
		BEGIN
				SELECT
					*
				FROM(
					SELECT 
						ProductName = B.[Name],
						LineTotalSum = SUM(A.LineTotal),
						LineTotalSumRank = DENSE_RANK() OVER(ORDER BY SUM(A.LineTotal) DESC)

					FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail A
						JOIN AdventureWorks2019.Production.Product B
							ON A.ProductID = B.ProductID

					GROUP BY
						B.[Name]
					) X

				WHERE LineTotalSumRank <= @TopN
			END

	IF @OrderType = 3
		BEGIN				
			SELECT
				ProductID,
				LineTotal

			INTO #AllOrders

			FROM AdventureWorks2019.Sales.SalesOrderDetail

			INSERT INTO #AllOrders

			SELECT
				ProductID,
				LineTotal

			FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail
					

			SELECT
				*
			FROM (
				SELECT 
					ProductName = B.[Name],
					LineTotalSum = SUM(A.LineTotal),
					LineTotalSumRank = DENSE_RANK() OVER(ORDER BY SUM(A.LineTotal) DESC)

				FROM #AllOrders A
					JOIN AdventureWorks2019.Production.Product B
						ON A.ProductID = B.ProductID

				GROUP BY
					B.[Name]
				) X

			WHERE LineTotalSumRank <= @TopN

			DROP TABLE #AllOrders
		END
END



--Call modified stored procedure


EXEC dbo.OrdersReport 20,1

EXEC dbo.OrdersReport 15,2

EXEC dbo.OrdersReport 25,3