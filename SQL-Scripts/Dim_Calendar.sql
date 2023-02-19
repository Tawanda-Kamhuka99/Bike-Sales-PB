/*
Cleaning DimDate Table:

- Selected only relevant fields.
- Created aliases for selected fields.
- Filtered CalanderYear >= 2021

*/

SELECT * 
FROM AdventureWorksDW2019.dbo.DimDate

SELECT
	DateKey,
	FullDateAlternateKey AS Date,
	EnglishDayNameOfWeek AS Day,
	--WeekNumberOfYear AS WeekNo,
	EnglishMonthName AS Month,
	LEFT(EnglishMonthName,3) AS MonthShort, -- Useful for front-end navigation and graphs
	MonthNumberOfYear AS MonthNo,
	CalendarQuarter AS Quarter,
	CalendarYear AS Year
FROM 
	AdventureWorksDW2019.dbo.DimDate
WHERE 
	CalendarYear >= 2020
