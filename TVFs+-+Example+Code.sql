--Creating the TVF:

CREATE FUNCTION Production.ufn_ProductsByColor(@Color NVARCHAR(15))

RETURNS TABLE

AS

RETURN
(
	SELECT
		 Name
		,ProductNumber
		,Color
	FROM Production.Product

	WHERE LOWER(Color) = LOWER(@Color)
)


--Calling the TVF:

SELECT
*
FROM Production.ufn_ProductsByColor('RED')