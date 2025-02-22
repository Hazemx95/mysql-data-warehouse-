DROP TABLE IF EXISTS sliver_crm_cust_info; 
CREATE TABLE IF NOT EXISTS sliver_crm_cust_info(
    cst_id VARCHAR(30),
    cst_key VARCHAR(30),
    cst_firstname VARCHAR(30),
    cst_lastname VARCHAR(30),
    cst_marital_status VARCHAR(20),
    cst_gndr VARCHAR(20),
    cst_create_date VARCHAR(40) DEFAULT NULL,
    dwh_creationdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DESC sliver_crm_cust_info;
DROP TABLE IF EXISTS sliver_crm_prd_info;
CREATE TABLE IF NOT EXISTS sliver_crm_prd_info
(
    prd_id          INT,
    prd_key         NVARCHAR(50),
    prd_key_new     NVARCHAR(50),
    prd_nm          NVARCHAR(50),
    prd_cost        INT,
    prd_line        NVARCHAR(50),
    prd_start_dt    DATE,
    prd_end_dt      DATE,
    dwh_creationdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DESC sliver_prd_info;
DROP TABLE IF EXISTS sliver_crm_sales_details;
CREATE TABLE IF NOT EXISTS sliver_crm_sales_details
(
    sls_ord_num     VARCHAR(50),
    sls_prd_key     VARCHAR(50),
    sls_cust_id     INT,
    sls_order_dt    VARCHAR(20),
    sls_ship_dt     VARCHAR(20),
    sls_due_dt      VARCHAR(20),
    sls_sales       INT,
    sls_quantity    INT,
    sls_price       INT,
    dwh_creationdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DESC sliver_crm_sales_details;

DROP TABLE IF EXISTS sliver_erp_cust_date;
CREATE TABLE IF NOT EXISTS sliver_erp_cust_date
(
   CID VARCHAR(30),
   BDATE DATE ,
   GENDER VARCHAR(10),
    dwh_creationdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DESC sliver_erp_cust_date

DROP TABLE IF EXISTS sliver_erp_cust_country;
CREATE TABLE IF NOT EXISTS sliver_erp_cust_country
(
   CID VARCHAR(40),
   CNTRY VARCHAR(40),
   dwh_creationdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);
DESC sliver_erp_cust_country

DROP TABLE IF EXISTS sliver_erp_prd_maintenace;
CREATE TABLE IF NOT EXISTS sliver_erp_prd_maintenace
(
   ID VARCHAR(30),
   CAT VARCHAR(30),
   SUBCAT VARCHAR(30),
   MAINTENANCE VARCHAR(30),
    dwh_creationdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP


);
DESC sliver_erp_prd_maintenace;
