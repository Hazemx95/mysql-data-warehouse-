--######################################################################--
-- sliver_cust_info---
--######################################################################--
INSERT INTO sliver_crm_cust_info(
    cst_id,
    cst_key,
    cst_firstname,
    cst_lastname,
    cst_marital_status,
    cst_gndr,
    cst_create_date
)
SELECT 
t.cst_id,
t.cst_key,
TRIM(BOTH ' ' FROM t.cst_firstname),
TRIM(BOTH ' ' FROM t.cst_lastname),
CASE 
    WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Maried'
    WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
    ELSE 'n/a'
END AS cst_marital_status, 
CASE
    WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'MALE'
    WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'FEMALE' 
    ELSE 'n/a'
END AS cst_gndr,

DATE_FORMAT(CAST(t.cst_create_date AS DATE), '%d-%m-%Y') AS cst_create_datea
FROM(
SELECT *,CASE
    WHEN crm_cust.cst_id = '' THEN NULL
    ELSE crm_cust.cst_id END AS check_null
    ,ROW_NUMBER()over(PARTITION BY crm_cust.cst_id ORDER BY crm_cust.cst_id) as rn  FROM bronz_crm_cust_info as crm_cust where crm_cust.cst_id IS NOT NULL
)t
WHERE rn =1  AND t.check_null IS NOT NULL;

--######################################################################--
--sliver_prd_info--
--######################################################################--

INSERT INTO sliver_crm_prd_info (
   prd_id,
   prd_key,
   prd_key_new,
   prd_nm,
   prd_cost,
   prd_line,
   prd_start_dt,
   prd_end_dt
)
SELECT 
prd.prd_id,
prd_key,
TRIM(SUBSTRING(prd.prd_key,7,LENGTH(prd.prd_key))) as prd_key_new,
prd.prd_nm,
prd.prd_cost,
CASE TRIM(UPPER(prd.prd_line))
    WHEN 'R' THEN 'ROLL'
    WHEN 'S' THEN 'SINGLE'
    WHEN 'M' THEN 'MARRAED'
    WHEN 'T' THEN 'TOWER'
    ELSE 'n/a'
END AS prd_line,
CAST(prd.prd_start_dt AS DATE) as prd_start_dt,
CAST(DATE_SUB(LEAD(prd.prd_start_dt) OVER (PARTITION BY prd.prd_key ORDER BY prd.prd_start_dt), INTERVAL 1 DAY ) AS DATE) as prd_end_dt
FROM bronz_crm_prd_info as prd ;

--######################################################################--
--sliver_sales details--
--######################################################################--

SELECT 
TRIM(BOTH ' ' FROM sls_ord_num),
sls_prd_key,
sls_cust_id,
CASE 
    WHEN TO_DAYS(sls.sls_order_dt) = ' ' OR TO_DAYS(sls.sls_order_dt) IS NULL OR TO_DAYS(sls.sls_order_dt) =0  OR STR_TO_DATE(sls.sls_order_dt, '%Y-%m-%d') IS NULL THEN NULL
    ELSE DATE_FORMAT(sls.sls_order_dt,'%d-%m-%Y') 
END AS sls_order_dt,
CASE 
    WHEN TO_DAYS(sls.sls_ship_dt) = ' ' OR TO_DAYS(sls.sls_ship_dt) IS NULL OR TO_DAYS(sls.sls_ship_dt) =0  OR STR_TO_DATE(sls.sls_ship_dt, '%Y-%m-%d') IS NULL THEN NULL
    ELSE DATE_FORMAT(sls.sls_ship_dt,'%d-%m-%Y') 
END AS sls_ship_dt,
CASE 
    WHEN TO_DAYS(sls.sls_due_dt) = ' ' OR TO_DAYS(sls.sls_due_dt) IS NULL OR TO_DAYS(sls.sls_due_dt) =0  OR STR_TO_DATE(sls.sls_due_dt, '%Y-%m-%d') IS NULL THEN NULL
    ELSE DATE_FORMAT(sls.sls_due_dt,'%d-%m-%Y') 
END AS sls_due_dt,
sls_sales,
sls_quantity,
sls_price
FROM bronz_crm_sales_details as sls;
