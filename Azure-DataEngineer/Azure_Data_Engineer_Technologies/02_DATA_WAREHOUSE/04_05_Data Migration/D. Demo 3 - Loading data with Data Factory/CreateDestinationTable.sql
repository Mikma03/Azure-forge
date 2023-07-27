
-- Create destination table in Azure Data warehouse
--DROP TABLE [prod].FactTransactionHistorySSIS
CREATE TABLE [prod].FactTransactionHistorySSIS
(
    [TransactionID] [int] NOT NULL,
	[ProductKey] [int] NOT NULL,
	[OrderDate] [datetime] NULL,
	[Quantity] [int] NULL,
	[ActualCost] [money] NULL
)


-- Verify number of rows
SELECT count(1) FROM [prod].[FactTransactionHistorySSIS]



-- verify the data was loaded into the 60 distributions
-- Find data skew for a distributed table
DBCC PDW_SHOWSPACEUSED('prod.FactTransactionHistorySSIS'); 
