CREATE TABLE #Orders
(
       OrderDate DATE
	  ,OrderMonth DATE
      ,TotalDue MONEY
	  ,OrderRank INT
)


--Insert sales data:

INSERT INTO #Orders
(
       OrderDate
	  ,OrderMonth
      ,TotalDue
	  ,OrderRank
)
SELECT 
       OrderDate
	  ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
      ,TotalDue
	  ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)

FROM AdventureWorks2019.Sales.SalesOrderHeader --sales data



CREATE TABLE #OrdersMinusTop10
(
OrderMonth DATE,
OrderType VARCHAR(32),
TotalDue MONEY
)

--Insert sales data:
INSERT INTO #OrdersMinusTop10
(
OrderMonth,
OrderType,
TotalDue
)
SELECT
OrderMonth,
OrderType = 'Sales',
TotalDue = SUM(TotalDue)
FROM #Orders
WHERE OrderRank > 10
GROUP BY OrderMonth


--Empty out #Orders table

TRUNCATE TABLE #Orders


--Insert purchase data:

INSERT INTO #Orders
(
       OrderDate
	  ,OrderMonth
      ,TotalDue
	  ,OrderRank
)
SELECT 
       OrderDate
	  ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
      ,TotalDue
	  ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)

FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader --purchase data


--Insert purchase data:

INSERT INTO #OrdersMinusTop10
(
OrderMonth,
OrderType,
TotalDue
)
SELECT
OrderMonth,
OrderType = 'Purchase',
TotalDue = SUM(TotalDue)
FROM #Orders
WHERE OrderRank > 10
GROUP BY OrderMonth




SELECT
A.OrderMonth,
TotalSales = A.TotalDue,
TotalPurchases = B.TotalDue

FROM #OrdersMinusTop10 A
	JOIN #OrdersMinusTop10 B
		ON A.OrderMonth = B.OrderMonth
			AND B.OrderType = 'Purchase'

WHERE A.OrderType = 'Sales'

ORDER BY 1

DROP TABLE #Orders
DROP TABLE #OrdersMinusTop10