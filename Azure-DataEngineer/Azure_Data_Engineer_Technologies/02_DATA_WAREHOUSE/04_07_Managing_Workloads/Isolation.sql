-- Isolation

IF NOT EXISTS (SELECT * FROM sys.sql_logins WHERE name = 'IsoUser')
BEGIN
CREATE LOGIN [IsoUser] WITH PASSWORD='This!s@StrongPW'
END
;

  

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'IsoUser')
BEGIN
CREATE USER [IsoUser] FOR LOGIN [IsoUser]
END
;

 
CREATE WORKLOAD GROUP DataLoads
WITH ( MIN_PERCENTAGE_RESOURCE = 30  
      ,CAP_PERCENTAGE_RESOURCE = 80
      ,REQUEST_MIN_RESOURCE_GRANT_PERCENT = 5)
;

DROP WORKLOAD CLASSIFIER [wgcIsoUser];
CREATE WORKLOAD CLASSIFIER [wgcIsoUser]
WITH (WORKLOAD_GROUP = 'DataLoads'
      ,MEMBERNAME = 'IsoUser')
;



SELECT * FROM sys.workload_management_workload_classifiers
