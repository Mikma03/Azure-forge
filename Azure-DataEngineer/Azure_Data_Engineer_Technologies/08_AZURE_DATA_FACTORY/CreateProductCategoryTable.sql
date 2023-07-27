
CREATE TABLE dbo.[ProductCategory](
	[ProductCategoryID] INT NOT NULL,
	[ParentProductCategoryID] [int] NULL,
	[Name] [VARCHAR](100) NOT NULL,
)