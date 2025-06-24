
 /*
===============================
Script: Create silver layer
===============================
questo script crea le tabelle sullo schema silver ed elimina le tabelle esistenti (se esistono già)
*/

 if OBJECT_ID('silver.crm_cust_info','U') is not null
	drop table silver.crm_cust_info;
 Create Table silver.crm_cust_info (
	 cst_id INT,
	 cst_key nvarchar(50),
	 cst_firstname nvarchar(50),
	 cst_lastname nvarchar(50),
	 cst_material_status nvarchar(50),
	 cst_gndr nvarchar(50),
	 cst_create_date date,
	 dwh_createdate datetime2 default getdate()
 );

if OBJECT_ID('silver.crm_prd_info','U') is not null
	drop table silver.crm_prd_info;
Create Table silver.crm_prd_info (
	 prd_id INT,
	 cat_id nvarchar(50),
	 prd_key nvarchar(50),
	 prd_nm nvarchar(50),
	 prd_cost INT,
	 prd_line nvarchar(50),
	 prd_start_dt date,
	 prd_end_dt date,
	 dwh_createdate datetime2 default getdate()
 );

if OBJECT_ID('silver.crm_sales_details','U') is not null
	drop table silver.crm_sales_details;
Create Table silver.crm_sales_details(
	 sls_ord_num nvarchar(50),
	 sls_prd_key nvarchar(50),
	 sls_cust_id INT,
	 sls_order_dt date,
	 sls_ship_dt date,
	 sls_due_dt date,
	 sls_sales INT,
	 sls_quantity INT,
	 sls_price INT,
	 dwh_createdate datetime2 default getdate()
 );


if OBJECT_ID('silver.erp_loc_a101','U') is not null
	drop table silver.erp_loc_a101;
create table silver.erp_loc_a101 (
	 cid nvarchar(50),
	 cntry nvarchar(50),
	 dwh_createdate datetime2 default getdate()
);
if OBJECT_ID('silver.erp_cust_az12','U') is not null
	drop table silver.erp_cust_az12;
create table silver.erp_cust_az12 (
	 cid nvarchar(50),
	 bdate date,
	 gen nvarchar(50),
	 dwh_createdate datetime2 default getdate()
);

if OBJECT_ID('silver.erp_px_cat_g1v2','U') is not null
	drop table silver.erp_px_cat_g1v2;
create table silver.erp_px_cat_g1v2 (
	 id nvarchar(50),
	 cat nvarchar(50),
	 subcat nvarchar(50),
	 maintenance nvarchar(50),
	 dwh_createdate datetime2 default getdate()
);
