-- Active: 1739774225116@@mysql-db@3306@datawarehouse
-- Active: 1739774225116@@mysql-db@3306@information_schema
-- check for replica and redandancy --
-- FOR CUSTOMER INFORAMTION--
-- bronz_crm_cust_info ---
-- EXPECTATION MUST BE NO RESULT ---
use datawarehouse;
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
SELECT  SUBSTRING(prd.prd_key,7,LENGTH(prd.prd_key)) FROM bronz_crm_prd_info as prd  
WHERE SUBSTRING(prd.prd_key,7,LENGTH(prd.prd_key)) IN (SELECT sls.sls_prd_key FROM bronz_crm_sales_details sls ) ;

SELECT sls.sls_prd_key FROM bronz_crm_sales_details sls ;


-- check for white spaces and null values --

SELECT prd.prd_nm FROM bronz_crm_prd_info as prd WHERE  prd.prd_nm!=TRIM( prd.prd_nm) OR  prd.prd_nm IS NULL;

SELECT prd.prd_cost  FROM bronz_crm_prd_info as prd WHERE prd.prd_cost < 0 OR  prd.prd_cost IS NULL ;

-- check for standralization and consistency and normalization--
SELECT DISTINCT prd.prd_line FROM bronz_crm_prd_info as prd ;

SELECT * FROM bronz_crm_prd_info as prd ;

-- check for startdate less than end date or have overlape between dates 
SELECT prd.prd_key,CAST(prd.prd_start_dt AS DATE) ,CAST(DATE_SUB(LEAD(prd.prd_start_dt) OVER (PARTITION BY prd.prd_key ORDER BY prd.prd_start_dt), INTERVAL 1 DAY ) AS DATE) as prd_end_dt_test FROM bronz_crm_prd_info as prd ;


-- bronz_sales_information ---
SELECT * FROM bronz_crm_sales_details;
SELECT * FROM bronz_crm_sales_details as sls WHERE sls.sls_prd_key  IN (SELECT prd.prd_key_new FROM sliver_crm_prd_info as prd);

SELECT sls.sls_cust_id FROM bronz_crm_sales_details as sls WHERE sls.sls_cust_id  IN (SELECT crm.cst_id FROM sliver_crm_cust_info as crm);
-- check for white spaces 
SELECT sls.sls_ord_num FROM bronz_crm_sales_details as sls WHERE sls.sls_ord_num!=TRIM(sls.sls_ord_num);
SELECT sls.sls_ord_num FROM bronz_crm_sales_details as sls WHERE sls.sls_ord_num NOT LIKE 'SO%' AND sls.sls_ord_num != UPPER(sls.sls_ord_num);

SELECT TO_DAYS(sls.sls_ship_dt) FROM bronz_crm_sales_details as sls WHERE TO_DAYS(sls.sls_ship_dt) = ' ' OR TO_DAYS(sls.sls_ship_dt) IS NULL OR TO_DAYS(sls.sls_ship_dt) =0  OR STR_TO_DATE(sls.sls_ship_dt, '%Y-%m-%d') IS NULL ;

