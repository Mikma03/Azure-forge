-- create the log in for prime user

-- Use Master
IF NOT EXISTS (SELECT * FROM sys.sql_logins WHERE name = 'PrimeUSer')
BEGIN
CREATE LOGIN [PrimeUSer] WITH PASSWORD='<This!s@StrongPW>'
END

-- Use Datawarehouse
-- create this user for the log in prime user.
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'PrimeUSer')
BEGIN
CREATE USER [PrimeUSer] FOR LOGIN [PrimeUSer]
END
;

-- create workload classifier for prime User
--DROP WORKLOAD CLASSIFIER [wgcPrimeUSer];
CREATE WORKLOAD CLASSIFIER [wgcPrimeUSer]
WITH (WORKLOAD_GROUP = 'xlargerc'
      ,MEMBERNAME = 'PrimeUSer'
      ,IMPORTANCE = HIGH);

 
 -- take a look at workload importance.
SELECT * FROM sys.workload_management_workload_classifiers
