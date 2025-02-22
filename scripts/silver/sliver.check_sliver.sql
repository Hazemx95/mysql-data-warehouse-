-- quality check for sliver layer in customer information -- 

--EXPECTATION NO RESULTS--
SELECT * FROM sliver_crm_cust_info;
-- FOR REPLICA AND REDANDANCY --
SELECT cust.cst_id , COUNT(*)  FROM sliver_crm_cust_info as cust GROUP BY 1 HAVING COUNT(*) >1 ;

-- check about white spaces --
SELECT cust.cst_firstname FROM sliver_crm_cust_info as cust WHERE cust.cst_firstname != TRIM(cust.cst_firstname) ;


-- DATA CONSISTENCY AND NORMLIZATION OR STANDRALIZATION --

SELECT DISTINCT cust.cst_marital_status  FROM sliver_crm_cust_info as cust ;

-- quality check for sliver layer in product information --
SELECT * FROM sliver_crm_prd_info; 
-- FOR REPLICA AND REDANDANCY --
SELECT cust.prd_id , COUNT(*)  FROM sliver_crm_prd_info as cust GROUP BY 1 HAVING COUNT(*) >1 ;
-- DATA CONSISTENCY --
-- EXPECTATION NO RESULT--
SELECT  prd.prd_line FROM sliver_crm_prd_info as prd ;

SELECT prd.prd_start_dt,prd.prd_end_dt FROM sliver_crm_prd_info as prd WHERE prd.prd_start_dt < prd.prd_end_dt;
