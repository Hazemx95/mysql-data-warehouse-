-- check for replica and redandancy --
-- FOR CUSTOMER INFORAMTION--
-- bronz_crm_cust_info ---
-- EXPECTATION MUST BE NO RESULT ---
SELECT crm_cust.cst_id , COUNT(*)  FROM bronz_crm_cust_info as crm_cust  group by 1 HAVING COUNT(*) >1 ;
-- check about white spaces --
SELECT crm.cst_firstname FROM bronz_crm_cust_info as crm WHERE crm.cst_firstname != TRIM(crm.cst_key) ;
SELECT crm.cst_lastname FROM bronz_crm_cust_info as crm WHERE crm.cst_lastname!= TRIM(crm.cst_lastname) ;

-- DATA CONSISTENCY AND NORMLIZATION OR STANDRALIZATION --
SELECT DISTINCT crm.cst_marital_status  FROM bronz_crm_cust_info as crm ;
SELECT DISTINCT crm.cst_gndr  FROM bronz_crm_cust_info as crm ;

SELECT * FROM bronz_crm_cust_info;
SELECT * FROM bronz_prd_info;
SELECT * FROM bronz_crm_sales_details;

SELECT crmdate.cst_id FROM bronz_crm_cust_info as crmdate 
WHERE  crmdate.cst_id  IN (SELECT sls.sls_cust_id  FROM bronz_crm_sales_details as sls);


-- bronz_product_information ---

SELECT * FROM bronz_crm_prd_info;
-- check for replica and redandancy --
SELECT prd.prd_id , COUNT(*) FROM bronz_crm_prd_info as prd GROUP BY 1 HAVING COUNT(*) >1 ;

SELECT  SUBSTRING(prd.prd_key,7,LENGTH(prd.prd_key)) FROM bronz_crm_prd_info as prd  WHERE SUBSTRING(prd.prd_key,7,LENGTH(prd.prd_key)) NOT IN (SELECT sls.sls_prd_key FROM bronz_crm_sales_details sls ) ;
SELECT  SUBSTRING(prd.prd_key,7,LENGTH(prd.prd_key)) FROM bronz_crm_prd_info as prd  WHERE SUBSTRING(prd.prd_key,7,LENGTH(prd.prd_key)) IN (SELECT sls.sls_prd_key FROM bronz_crm_sales_details sls ) ;

SELECT sls.sls_prd_key FROM bronz_crm_sales_details sls ;

