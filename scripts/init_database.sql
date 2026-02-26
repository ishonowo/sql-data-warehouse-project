/*
This is the initial scripts for creating the database called DataWarehouse and its schemas.
*/
--Create Database 
CREATE DATABASE DataWarehouse;
USE DataWarehouse;
GO;

--Create schemas
CREATE SCHEMA bronze;
GO;
CREATE SCHEMA silver;
GO;
CREATE SCHEMA gold;
GO;
