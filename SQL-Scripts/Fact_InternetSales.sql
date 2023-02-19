/*
Cleansed FactInternetSales:
- Selected relevant fields.
- Used WHERE clause to get two years worth of data only which also auto-updates once script is run. 
*/

SELECT *
FROM dbo.FactInternetSales

SELECT 
	ProductKey,
	OrderDateKey,
	DueDateKey,
	ShipDateKey,
	CustomerKey,
	SalesOrderNumber,
	SalesAmount
FROM 
	dbo.FactInternetSales
WHERE
	LEFT(OrderDateKey,4) BETWEEN 2020 AND 2022 -- Ensures only two years of data is extracted
ORDER BY 
	OrderDateKey 