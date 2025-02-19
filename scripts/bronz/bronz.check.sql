-- Active: 1739774225116@@mysql-db@3306@datawarehouse
-- Active: 1739774225116@@mysql-db@3306@information_schema

--- CHECK GFOR DATA COMPLETENESS IN BRONZ LAYER ---
USE datawarehouse ;
SELECT COUNT(*) FROM bronz_crm_cust_info;
SELECT COUNT(*) FROM bronz_crm_prd_info;
SELECT COUNT(*) FROM bronz_crm_sales_details;
SELECT COUNT(*) FROM bronz_erp_cust_date;
SELECT COUNT(*) FROM bronz_erp_cust_country;
SELECT COUNT(*) FROM bronz_erp_prd_maintenace;


SELECT * FROM bronz_crm_cust_info;
SELECT * FROM bronz_crm_prd_info;
SELECT * FROM bronz_crm_sales_details;
SELECT * FROM bronz_erp_cust_date;
SELECT * FROM bronz_erp_cust_country;
SELECT * FROM bronz_erp_prd_maintenace;

