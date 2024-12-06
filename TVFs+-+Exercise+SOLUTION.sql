CREATE FUNCTION Production.ufn_ProductsByPriceRange(@MinPrice MONEY, @MaxPrice MONEY)

RETURNS TABLE

AS

RETURN
(
	SELECT
		ProductID,
		Name,
		ListPrice

	FROM Production.Product

	WHERE ListPrice BETWEEN @MinPrice AND @MaxPrice
)
