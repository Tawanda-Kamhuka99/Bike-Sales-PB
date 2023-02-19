/* 
Cleansed DimCustomer Table:
- Selected only relevant fields.
- Used aliasing for table names for easy reference and access.
- Used LEFT JOIN on DimGeography to include Customer City and Country
*/

SELECT *
FROM AdventureWorksDW2019.dbo.DimCustomer

SELECT *
FROM AdventureWorksDW2019.dbo.DimGeography

SELECT 
	cust.CustomerKey AS CustomerKey,
	cust.FirstName AS FirstName,
	cust.LastName AS LastName,
	cust.FirstName + ' ' + cust.LastName AS FullName,
	cust.datefirstpurchase AS FirstPurchaseDate,
CASE cust.gender 
	WHEN 'M' THEN 'Male'
	WHEN 'F' THEN 'Female'
END AS Gender,
	geo.city AS CustomerCity,
	geo.EnglishCountryRegionName AS Country
FROM
	AdventureWorksDW2019.dbo.DimCustomer AS cust
	LEFT JOIN AdventureWorksDW2019.dbo.DimGeography AS geo
	ON geo.GeographyKey = cust.GeographyKey
ORDER BY 
	CustomerKey  
	
