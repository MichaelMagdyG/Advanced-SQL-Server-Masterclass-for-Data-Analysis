--Select all orders with at least one item over 10K, using EXISTS

SELECT
       A.SalesOrderID
      ,A.OrderDate
      ,A.TotalDue

FROM AdventureWorks2019.Sales.SalesOrderHeader A

WHERE EXISTS (
	SELECT
	1
	FROM AdventureWorks2019.Sales.SalesOrderDetail B
	WHERE A.SalesOrderID = B.SalesOrderID
		AND B.LineTotal > 10000
)

ORDER BY 1



--5.) Select all orders with at least one item over 10K, including a line item value, using UPDATE

--Create a table with Sales data, including a field for line total:
CREATE TABLE #Sales
(
SalesOrderID INT,
OrderDate DATE,
TotalDue MONEY,
LineTotal MONEY
)


--Insert sales data to temp table
INSERT INTO #Sales
(
SalesOrderID,
OrderDate,
TotalDue
)

SELECT
SalesOrderID,
OrderDate,
TotalDue

FROM AdventureWorks2019.Sales.SalesOrderHeader


--Update temp table with > 10K line totals

UPDATE A
SET LineTotal = B.LineTotal

FROM #Sales A
	JOIN AdventureWorks2019.Sales.SalesOrderDetail B
		ON A.SalesOrderID = B.SalesOrderID
WHERE B.LineTotal > 10000


--Recreate EXISTS:

SELECT * FROM #Sales WHERE LineTotal IS NOT NULL


--Recreate NOT EXISTS:

SELECT * FROM #Sales WHERE LineTotal IS NULL



