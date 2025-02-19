-- quality check for sliver layer in customer information -- 

--EXPECTATION NO RESULTS--
SELECT * FROM sliver_crm_cust_info;
-- FOR REPLICA AND REDANDANCY --
SELECT cust.cst_id , COUNT(*)  FROM sliver_crm_cust_info as cust GROUP BY 1 HAVING COUNT(*) >1 ;

-- check about white spaces --
SELECT cust.cst_firstname FROM sliver_crm_cust_info as cust WHERE cust.cst_firstname != TRIM(cust.cst_firstname) ;


-- DATA CONSISTENCY AND NORMLIZATION OR STANDRALIZATION --

SELECT DISTINCT cust.cst_marital_status  FROM sliver_crm_cust_info as cust ;

