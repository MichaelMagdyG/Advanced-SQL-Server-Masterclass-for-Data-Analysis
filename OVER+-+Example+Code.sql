--YTD Sales Via Aggregate Query:

SELECT

      [Total YTD Sales] = SUM(SalesYTD)
      ,[Max YTD Sales] = MAX(SalesYTD)

FROM AdventureWorks2019.Sales.SalesPerson



--YTD Sales With OVER:

SELECT BusinessEntityID
      ,TerritoryID
      ,SalesQuota
      ,Bonus
      ,CommissionPct
      ,SalesYTD
	  ,SalesLastYear
      ,[Total YTD Sales] = SUM(SalesYTD) OVER()
      ,[Max YTD Sales] = MAX(SalesYTD) OVER()
      ,[% of Best Performer] = SalesYTD/MAX(SalesYTD) OVER()

FROM AdventureWorks2019.Sales.SalesPerson






