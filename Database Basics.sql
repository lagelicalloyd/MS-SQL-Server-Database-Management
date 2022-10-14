-- First I downloaded a backup file for the AdventureWorks2019 database. I added the backup to my SQL program files.
--Then, I restored it to SQL Server using the SSMS Object Explore GUI. Now I am using USE to connect to that db.
USE AdventureWorks2019


--I would like to review the ContactType table, so I'll query it below using a select stament.
-- I used TOP to limit the results to 5 rows.
-- I'll also use the Object Explore's design option to view or edit the table's schema, data types, column names, etc..
SELECT TOP 5 * FROM person.ContactType
-- The column names and data types are: ContactTupeID(INT), Name(nvarchar(50), and ModifiedDate (date/time).
-- Below is the results table:
/*
ContactTypeID	Name	ModifiedDate
1	Accounting Manager	2008-04-30 00:00:00.000
2	Assistant Sales Agent	2008-04-30 00:00:00.000
3	Assistant Sales Representative	2008-04-30 00:00:00.000
4	Coordinator Foreign Markets	2008-04-30 00:00:00.000
5	Export Administrator	2008-04-30 00:00:00.000
*/

-- Creating a new db
CREATE DATABASE LagelicaL


-- I can delete that database using the DROP db statement
DROP DATABASE Lagelical

-- Creating a new db named SQLServerDB1
CREATE DATABASE SQLServerDB1;

USE SQLServerDB1;

--Creating a Jobs table in SQLServerDB1. I added 3 columns, but I could also add them in the Design GUI.
CREATE TABLE Jobs(JobID int primary key, Location nvarchar(25), JobTitle nvarchar(25), CompanyName nvarchar(25));

--If I wanted to delete the table, here is the script:

DROP TABLE dbo.Jobs


/* Manage security permissions. I created two logins. One below and the other with the Object Explorer.
 I also changed the Security properties of the server to allow Windows Authentication and SQL Server Logins.
 The password and user permissions can also be edited via the Object Explorer or with the statement below.
 The login can be deleted using the OE or the statement below.
 */

CREATE LOGIN User1 WITH PASSWORD = 'abc123'

ALTER LOGIN User1 WITH PASSWORD = 'BlahBlah123'

DROP LOGIN user1

--Executing two queries simultaneously using the transaction statement. 

BEGIN TRAN;
ALTER TABLE Jobs
ADD HourlyWage INT;
WAITFOR DELAY '00:00:20'
COMMIT TRAN;

--When executing another query SELECT * FROM Jobs, this query would not execute until the 20 secs passed.
JobID	Location	JobTitle	CompanyName	HourlyWage

-- I could have created a full back up of the db by using the BACKUP db statement like below:

BACKUP DATABASE SQLServerDB1
TO DISK = 'C:\backups\SQLServerDB1.bak';

DROP DATABASE SQLServerDB1

-- I sucessfully restored the backup using the restore tool in the Object Explorer.
-- I dropped the practice Jobs table from the db.
DROP TABLE Jobs;