--Starter Query:


SELECT
       A.PurchaseOrderID,
	   A.OrderDate,
	   A.TotalDue

FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader A

WHERE EXISTS (
	SELECT
	1
	FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail B
	WHERE A.PurchaseOrderID = B.PurchaseOrderID
		AND B.RejectedQty > 5
)

ORDER BY 1



--Re-write:

CREATE TABLE #Purchases
(
PurchaseOrderID INT,
OrderDate DATE,
TotalDue MONEY,
RejectedQty INT
)



INSERT INTO #Purchases
(
PurchaseOrderID,
OrderDate,
TotalDue
)

SELECT
PurchaseOrderID,
OrderDate,
TotalDue

FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader


UPDATE A
	SET RejectedQty = B.RejectedQty

FROM #Purchases A
	JOIN AdventureWorks2019.Purchasing.PurchaseOrderDetail B
		ON A.PurchaseOrderID = B.PurchaseOrderID
WHERE B.RejectedQty > 5



SELECT * FROM #Purchases WHERE RejectedQty IS NOT NULL


DROP TABLE #Purchases



