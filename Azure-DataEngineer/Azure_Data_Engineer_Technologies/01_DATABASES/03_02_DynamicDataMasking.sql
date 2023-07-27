-- Azure Example
--DROP TABLE TestDDM 
Create table TestDDM 
              (ID Int, 
              PersonName varchar (100), 
              EmailAddress varchar(120), 
              CreditCardNumber varchar(19), 
              SocialSecurityNumber varchar(11)
)

INSERT INTO TestDDM  Values (1, 'Anoop Kumar','abcdefgh@hotmail.com','1234-5678-4321-8765','123-45-6789')
INSERT INTO TestDDM  Values (1, 'Rahul Gupta','amitguptaabcdefg@hotmail.com','8765-1234-5678-4321','231-45-6787')
INSERT INTO TestDDM  Values (1, 'Amit Goel','amitgoelabcdefgh@hotmail.com','4321-1234-5678-4321','321-45-6700')
	
SELECT * FROM TestDDM



--DROP LOGIN learnCloud
CREATE LOGIN learnCloud
WITH PASSWORD = 'LCStudent@123';


--DROP USER LearnCloud
CREATE USER LearnCloud
FROM LOGIN learnCloud
WITH DEFAULT_SCHEMA=dbo;

EXEC sp_addrolemember N'db_datareader', N'LearnCloud'



-- SQL Server Example
--DROP Table Membership  
CREATE TABLE Membership  
  (MemberID int IDENTITY PRIMARY KEY,  
   FirstName varchar(100) MASKED WITH (FUNCTION = 'partial(1,"XXXXXXX",0)') NULL,  
   LastName varchar(100) NOT NULL,  
   Phone varchar(12) MASKED WITH (FUNCTION = 'default()') NULL,  
   Email varchar(100) MASKED WITH (FUNCTION = 'email()') NULL);  
  
INSERT Membership (FirstName, LastName, Phone, Email) VALUES   
('Roberto', 'Tamburello', '555.123.4567', 'RTamburello@contoso.com'),  
('Janice', 'Galvin', '555.123.4568', 'JGalvin@contoso.com.co'),  
('Zheng', 'Mu', '555.123.4569', 'ZMu@contoso.net');  

SELECT * FROM Membership;  



SELECT a.name, b.name as table_name, a.is_masked, a.masking_function  
FROM sys.masked_columns AS a  
JOIN sys.tables AS b   
    ON a.[object_id] = b.[object_id];  


