/*
Cleansed DimProduct Table:
- Selected only relevant fields.
- Created aliases for selected fields.
- Set all NULL values from ProductStatus column to be 'Outdated'.
- Used LEFT JOIN on DimProductCategory and DimProductSubcategory.
*/

SELECT * 
FROM AdventureWorksDW2019.dbo.DimProduct

SELECT DISTINCT(Status)
FROM DimProduct

SELECT 
	prod.ProductKey,
	prod.ProductAlternateKey AS ProductItemCode,
	prod.EnglishProductName AS ProductName,
	pc.EnglishProductCategoryName AS ProductCategory,
	ps.EnglishProductSubcategoryName AS ProductSubCategory,
	prod.Color AS ProductColor,
	prod.Size AS ProductSize,
	prod.ProductLine AS ProductLine,
	prod.ModelName AS ProductModel,
	prod.EnglishDescription AS ProductDescription,
	ISNULL(prod.Status, 'Outdated') AS ProductStatus
FROM
	dbo.DimProduct AS prod
	LEFT JOIN dbo.DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = prod.ProductSubcategoryKey
	LEFT JOIN dbo.DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey
ORDER BY
	prod.ProductKey

