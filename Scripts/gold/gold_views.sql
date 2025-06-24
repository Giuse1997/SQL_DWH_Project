




create view gold.dim_customers as
SELECT distinct
	 row_number() over(order by a.cst_id) as customer_key
	,a.cst_id as customer_id
	,a.cst_key as customer_number
	,a.cst_firstname as first_name
	,a.cst_lastname as last_name
	,c.cntry as country
	,a.cst_material_status as material_status
	,case when a.cst_gndr !='n/a' then a.cst_gndr -- crm è il master
		  ELSE coalesce(b.gen,'n/a')
	 end as gender
	,b.bdate as birthdate
	,a.cst_create_date as create_date
FROM DataWarehouse.silver.crm_cust_info a
left join silver.erp_cust_az12 b on a.cst_key = b.cid
left join silver.erp_loc_a101 c on a.cst_key=c.cid



/*
create view gold.dim_products as 
SELECT 
       row_number() over(order by a.prd_start_dt, a.prd_key) as product_key
	  ,a.prd_id as product_id
	  ,a.prd_key as product_number
      ,a.prd_nm as product_name
      ,a.cat_id as category_id
	  ,b.cat as category
	  ,b.subcat as subcategory
	  ,b.maintenance
      ,a.prd_cost as cost
      ,a.prd_line as product_line
      ,a.prd_start_dt  as start_date
  FROM DataWarehouse.silver.crm_prd_info a
  left join silver.erp_px_cat_g1v2 b on a.cat_id=b.id
  where prd_end_dt is null -- i dati storici non sono necessari
  */
create view gold.fact_sales as 
SELECT 
	   a.sls_ord_num as order_number
	  ,b.product_key 
      ,c.customer_key
      ,a.sls_order_dt as order_date
      ,a.sls_ship_dt as shipping_date
      ,a.sls_due_dt as due_date
      ,a.sls_sales as sales_amount
      ,a.sls_quantity as quantity
      ,a.sls_price as price
  FROM DataWarehouse.silver.crm_sales_details a 
  left join gold.dim_products b on a.sls_prd_key=b.product_number
  left join gold.dim_customers c on a.sls_cust_id=c.customer_id
