DECLARE @DynamicSQL VARCHAR(MAX)

SET @DynamicSQL = 'SELECT TOP 100 * FROM AdventureWorks2019.Production.Product'

SELECT @DynamicSQL

EXEC(@DynamicSQL)

