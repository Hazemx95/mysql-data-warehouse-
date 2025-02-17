-- Active: 1739774225116@@mysql-db@3306@datawarehouse
-- Active: 1739774225116@@mysql-db@3306@information_schema
-- Rembmber naming convention --
/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/
CREATE DATABASE IF NOT EXISTS datawarehouse ; 

DROP DATABASE IF EXISTS datawarehouse;

USE datawarehouse;



