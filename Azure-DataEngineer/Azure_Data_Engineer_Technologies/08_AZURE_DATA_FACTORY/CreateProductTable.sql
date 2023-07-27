CREATE TABLE [dbo].[Product](
	[ProductID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[ProductNumber] [nvarchar](25) NOT NULL,
	[Color] [nvarchar](15) NULL,
	[StandardCost] [varchar](100) NOT NULL,
	[ListPrice] [varchar](100) NOT NULL,
	[Size] [nvarchar](5) NULL,
	[Weight] [varchar](100) NULL,
	[ProductCategoryID] [varchar](100) NULL,
	[ProductModelID] [varchar](100) NULL,
	[SellStartDate] [varchar](100) NOT NULL,
	[SellEndDate] [varchar](100) NULL,
	[ModifiedDate] [varchar](100) NOT NULL,
)
GO
