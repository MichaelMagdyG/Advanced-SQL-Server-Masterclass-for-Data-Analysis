--Exercise 1 Solution

SELECT
       A.PurchaseOrderID
      ,A.OrderDate
      ,A.SubTotal
	  ,A.TaxAmt

FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader A

WHERE EXISTS (
	SELECT
	1
	FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail B
	WHERE A.PurchaseOrderID = B.PurchaseOrderID
		AND B.OrderQty > 500
)

ORDER BY 1




--Exercise 2 Solution

SELECT
       A.*

FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader A

WHERE EXISTS (
	SELECT
	1
	FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail B
	WHERE A.PurchaseOrderID = B.PurchaseOrderID
		AND B.OrderQty > 500
		AND B.UnitPrice > 50
)

ORDER BY 1





--Exercise 3 Solution:

SELECT
       A.*

FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader A

WHERE NOT EXISTS (
	SELECT
	1
	FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail B
	WHERE A.PurchaseOrderID = B.PurchaseOrderID
		AND B.RejectedQty > 0
)

ORDER BY 1