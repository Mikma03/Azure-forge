-- Importance

IF NOT EXISTS (SELECT * FROM sys.sql_logins WHERE name = 'ImportantUser')
BEGIN
CREATE LOGIN [ImportantUser] WITH PASSWORD='<This!s@StrongPW>'
END
;

 
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'ImportantUser')
BEGIN
CREATE USER [ImportantUser] FOR LOGIN [ImportantUser]
END
;

--DROP WORKLOAD CLASSIFIER wgcHighRole;
CREATE WORKLOAD CLASSIFIER wgcHighRoler
  WITH (WORKLOAD_GROUP = 'staticrc20'
       ,MEMBERNAME = 'ImportantUser'
      ,IMPORTANCE = HIGH);

 

SELECT * FROM sys.workload_management_workload_classifiers