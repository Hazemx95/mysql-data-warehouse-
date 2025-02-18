-- CODING(DATA INGEST) --

/*  EXTRACT THE DATA FROM CSVS INTO MY DWH (EXTRACTION METHOD (Pull extract))
    EXTRACT TYPE (FULL LOADED) --> TRUNCATE & INSERT
    EXTRACT TECHNOLOGIES (FILE PARSING) 
*/
SET SESSION sql_mode = ''; -- for disable STRIC check and Disable STRICT Mode (Temporary Fix)
USE datawarehouse;
SET GLOBAL local_infile = 1;

-- Load customer data
LOAD DATA INFILE '/var/lib/mysql-files/datasets/source_crm/cust_info.csv'
INTO TABLE bronz_crm_cust_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load product data
LOAD DATA INFILE '/var/lib/mysql-files/datasets/source_crm/prd_info.csv'
INTO TABLE bronz_prd_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load sales details data
LOAD DATA INFILE '/var/lib/mysql-files/datasets/source_crm/sales_details.csv'
INTO TABLE bronz_crm_sales_details
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DELIMITER $$
CREATE PROCEDURE LoadBronzeTables()
BEGIN
    DECLARE starttime DATE;
    DECLARE endtime DATE;
    DECLARE batch_start_time DATE;
    DECLARE batch_end_time DATE;

    -- Set start time for batch processing
    SET batch_start_time = CURRENT_DATE();
    
    -- Message showing what the procedure is doing
    SELECT 'This data pipeline moves data from source to destination (ETL Process)' , batch_start_time ;

    -- Step 1: Truncate tables before processing new data
    SET starttime = CURRENT_DATE();
    TRUNCATE TABLE bronz_crm_cust_info;
    TRUNCATE TABLE bronz_prd_info;
    TRUNCATE TABLE bronz_crm_sales_details;

    -- You can add any additional logic here for data processing or transformation
    -- For example, data cleansing, aggregation, etc.

    -- Step 3: End time for batch processing
    SET batch_end_time = CURRENT_DATE();
    
    -- Display end message with batch processing time
    SELECT 'Batch Process Completed' , batch_end_time ;
END $$

DELIMITER ;
CALL LoadBronzeTables();
DROP PROCEDURE LoadBronzeTables;


