--Exercise 1

UPDATE AdventureWorks2019.dbo.Calendar
SET
HolidayFlag =
	CASE
		WHEN DayOfMonthNumber = 1 AND MonthNumber = 1 THEN 1
		WHEN DayOfMonthNumber = 4 AND MonthNumber = 7 THEN 1
		WHEN DayOfMonthNumber = 11 AND MonthNumber = 11 THEN 1
		WHEN DayOfMonthNumber = 25 AND MonthNumber = 12 THEN 1
		ELSE 0
	END



--Exercise 2


SELECT
A.*

FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader A
	JOIN AdventureWorks2019.dbo.Calendar B
		ON A.OrderDate = B.DateValue

WHERE B.HolidayFlag = 1



--Exercise 3


SELECT
A.*

FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader A
	JOIN AdventureWorks2019.dbo.Calendar B
		ON A.OrderDate = B.DateValue

WHERE B.HolidayFlag = 1
	AND B.WeekendFlag = 1





