--CUSTOMERS

CREATE VIEW gold.dim_customers AS
SELECT
	   ROW_NUMBER() OVER (ORDER BY [cst_id]) AS customer_key
	  ,ci.[cst_id] AS customer_id
      ,ci.[cst_key] AS customer_number
      ,ci.[cst_firstname] AS first_name
      ,ci.[cst_lastname] AS last_name
	  ,la.CNTRY AS country
      ,ci.[cst_marital_status] AS marital_status
      ,CASE WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr
			ELSE COALESCE(ca.GEN,'n/a') 
	   END AS gender
      ,ca.BDATE AS birth_date
	  ,ci.[cst_create_date] AS create_date
FROM silver.crm_cust_info AS ci
LEFT JOIN silver.erp_cust_az12 AS ca
ON ci.cst_key=ca.CID
LEFT JOIN silver.erp_loc_a101 AS la
ON ci.cst_key=la.CID

--PRODUCTS

CREATE VIEW gold.dim_products AS
SELECT ROW_NUMBER() OVER (ORDER BY pn.[prd_start_dt],pn.[prd_key]) AS product_key
	  ,pn.[prd_id] AS product_id
	  ,pn.[prd_key] AS product_number
	  ,pn.[prd_nm] AS product_name
	  ,pn.[cat_id] AS category_id
	  ,pc.[CAT] AS category
	  ,pc.[SUBCAT] AS subcategory
	  ,pc.[MAINTENANCE] AS maintenance
	  ,pn.[prd_cost] AS product_cost
	  ,pn.[prd_line] AS product_line
	  ,pn.[prd_start_dt] AS 'start_date'
  FROM [DataWarehouse].[silver].[crm_prd_info] AS pn
  LEFT JOIN [DataWarehouse].[silver].[erp_px_cat_g1v2] AS pc
  ON pn.cat_id=pc.ID
  WHERE [prd_end_dt] IS NULL

--SALES

CREATE VIEW gold.fact_sales AS
SELECT sd.[sls_ord_num] AS order_number
	  ,pr.product_key AS product_key
      ,cu.customer_key AS customer_key
      ,sd.[sls_order_dt] AS order_date
      ,sd.[sls_ship_dt] AS shipping_date
      ,sd.[sls_due_dt] AS due_date
      ,sd.[sls_sales] AS sales_amount
      ,sd.[sls_quantity] AS quantity
      ,sd.[sls_price] AS price
  FROM [DataWarehouse].[silver].[crm_sales_details] AS sd
  LEFT JOIN gold.dim_products AS pr
  ON sd.sls_prd_key=pr.product_number
  LEFT JOIN gold.dim_customers AS cu
  ON sd.sls_cust_id= cu.customer_id
