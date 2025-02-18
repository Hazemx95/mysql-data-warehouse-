-- Active: 1739774225116@@mysql-db@3306@datawarehouse
-- MUST BE USE THE NAMING CONVENTION --
USE datawarehouse;
DROP TABLE IF EXISTS bronz_crm_cust_info; 
CREATE TABLE IF NOT EXISTS bronz_crm_cust_info(
    cst_id VARCHAR(30),
    cst_key VARCHAR(30),
    cst_firstname VARCHAR(30),
    cst_lastname VARCHAR(30),
    cst_marital_status VARCHAR(20),
    cst_gndr VARCHAR(20),
    cst_create_date VARCHAR(40) DEFAULT NULL
);
DESC bronz_crm_cust_info;
DROP TABLE IF EXISTS bronz_prd_info;
CREATE TABLE IF NOT EXISTS bronz_prd_info
(
    prd_id          INT,
    cat_id          NVARCHAR(50),
    prd_key         NVARCHAR(50),
    prd_nm          NVARCHAR(50),
    prd_cost        INT,
    prd_line        NVARCHAR(50),
    prd_start_dt    VARCHAR(30),
    prd_end_dt      VARCHAR(30)
);
DESC bronz_prd_info;
DROP TABLE IF EXISTS bronz_crm_sales_details;
CREATE TABLE IF NOT EXISTS bronz_crm_sales_details
(
    sls_ord_num     VARCHAR(50),
    sls_prd_key     VARCHAR(50),
    sls_cust_id     INT,
    sls_order_dt    DATE,
    sls_ship_dt     DATE,
    sls_due_dt      DATE,
    sls_sales       INT,
    sls_quantity    INT,
    sls_price       INT
);
DESC bronz_crm_sales_details;
