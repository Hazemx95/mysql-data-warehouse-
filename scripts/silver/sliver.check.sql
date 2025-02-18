-- check for replica and redandancy --
-- EXPECTATION MUST BE NO RESULT ---
SELECT crm_cust.cst_id , COUNT(*)  FROM bronz_crm_cust_info as crm_cust  group by 1 HAVING COUNT(*) >1 ;
-- check about white spaces 
SELECT crm.cst_firstname FROM bronz_crm_cust_info as crm WHERE crm.cst_firstname != TRIM(crm.cst_key) ;
SELECT crm.cst_lastname FROM bronz_crm_cust_info as crm WHERE crm.cst_lastname!= TRIM(crm.cst_lastname) ;

-- DATA CONSISTENCY AND NORMLIZATION OR STANDRALIZATION --
SELECT DISTINCT crm.cst_marital_status  FROM bronz_crm_cust_info as crm ;
SELECT DISTINCT crm.cst_gndr  FROM bronz_crm_cust_info as crm ;


SELECT * FROM bronz_prd_info;
SELECT * FROM bronz_crm_sales_details;

SELECT * FROM bronz_erp_cust_date;
SELECT * FROM bronz_crm_cust_info;