CREATE PROC dbo.DynamicTopN(@TopN INT, @AggFunc VARCHAR(50))

AS

BEGIN
	DECLARE @DynamicSQL VARCHAR(MAX)

	SET @DynamicSQL = 
	'	SELECT
			*
		FROM (
			SELECT 
				ProductName = B.[Name],
				LineTotalSum = ' 

	SET @DynamicSQL = @DynamicSQL + @AggFunc

	SET @DynamicSQL = @DynamicSQL +
	'(A.LineTotal),
				LineTotalSumRank = DENSE_RANK() OVER(ORDER BY '

	SET @DynamicSQL = @DynamicSQL + @AggFunc

	SET @DynamicSQL = @DynamicSQL +
	'(A.LineTotal) DESC)

			FROM AdventureWorks2019.Sales.SalesOrderDetail A
				JOIN AdventureWorks2019.Production.Product B
					ON A.ProductID = B.ProductID

			GROUP BY
				B.[Name]
			) X

		WHERE LineTotalSumRank <= '

	SET @DynamicSQL = @DynamicSQL + CAST(@TopN AS VARCHAR)

	EXEC(@DynamicSQL)

END

