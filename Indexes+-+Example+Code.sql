CREATE TABLE #Sales2012 
(
SalesOrderID INT,
OrderDate DATE
)

INSERT INTO #Sales2012
(
SalesOrderID,
OrderDate
)

SELECT
SalesOrderID,
OrderDate

FROM AdventureWorks2019.Sales.SalesOrderHeader

WHERE YEAR(OrderDate) = 2012


--1.) Add clustered index to #Sales2012


CREATE CLUSTERED INDEX Sales2012_idx ON #Sales2012(SalesOrderID)


--2.) Add sales order detail ID

CREATE TABLE #ProductsSold2012
(
SalesOrderID INT,
SalesOrderDetailID INT, --Add for clustered index
OrderDate DATE,
LineTotal MONEY,
ProductID INT,
ProductName VARCHAR(64),
ProductSubcategoryID INT,
ProductSubcategory VARCHAR(64),
ProductCategoryID INT,
ProductCategory VARCHAR(64)
)

INSERT INTO #ProductsSold2012
(
SalesOrderID,
SalesOrderDetailID,
OrderDate,
LineTotal,
ProductID
)

SELECT 
	   A.SalesOrderID
	  ,B.SalesOrderDetailID
	  ,A.OrderDate
      ,B.LineTotal
      ,B.ProductID

FROM #Sales2012 A
	JOIN AdventureWorks2019.Sales.SalesOrderDetail B
		ON A.SalesOrderID = B.SalesOrderID


--3.) Add clustered index on SalesOrderDetailID

CREATE CLUSTERED INDEX ProductsSold2012_idx ON #ProductsSold2012(SalesOrderDetailID)


--4.) Add nonclustered index on product Id

CREATE NONCLUSTERED INDEX ProductsSold2012_idx2 ON #ProductsSold2012(ProductID)



--3.) Add product data with UPDATE


UPDATE A
SET
ProductName = B.[Name],
ProductSubcategoryID = B.ProductSubcategoryID

FROM #ProductsSold2012 A
	JOIN AdventureWorks2019.Production.Product B
		ON A.ProductID = B.ProductID


--4.) Add nonclustered index on product subcategory ID

CREATE NONCLUSTERED INDEX ProductsSold2012_idx3 ON #ProductsSold2012(ProductSubcategoryID)






UPDATE A
SET
ProductSubcategory= B.[Name],
ProductCategoryID = B.ProductCategoryID

FROM #ProductsSold2012 A
	JOIN AdventureWorks2019.Production.ProductSubcategory B
		ON A.ProductSubcategoryID = B.ProductSubcategoryID


--5) Add nonclustered index on category Id

CREATE NONCLUSTERED INDEX ProductsSold2012_idx4 ON #ProductsSold2012(ProductCategoryID)



UPDATE A
SET
ProductCategory= B.[Name]

FROM #ProductsSold2012 A
	JOIN AdventureWorks2019.Production.ProductCategory B
		ON A.ProductCategoryID = B.ProductCategoryID


SELECT * FROM #ProductsSold2012
