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
