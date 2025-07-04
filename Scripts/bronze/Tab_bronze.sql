
 /*
===============================
Script: Create bronze layer
===============================
questo script crea le tabelle sullo schema bronze ed elimina le tabelle esistenti (se esistono già)
*/
-- Import CRM Tables

 if OBJECT_ID('bronze.crm_cust_info','U') is not null
	drop table bronze.crm_cust_info;
 Create Table bronze.crm_cust_info (
	 cst_id INT,
	 cst_key nvarchar(50),
	 cst_firstname nvarchar(50),
	 cst_lastname nvarchar(50),
	 cst_material_status nvarchar(50),
	 cst_gndr nvarchar(50),
	 cst_create_date date
 );

if OBJECT_ID('bronze.crm_prd_info','U') is not null
	drop table bronze.crm_prd_info;
Create Table bronze.crm_prd_info (
	 prd_id INT,
	 prd_key nvarchar(50),
	 prd_nm nvarchar(50),
	 prd_cost INT,
	 prd_line nvarchar(50),
	 prd_start_dt datetime,
	 prd_end_dt datetime
 );

if OBJECT_ID('bronze.crm_sales_details','U') is not null
	drop table bronze.crm_sales_details;
Create Table bronze.crm_sales_details(
	 sls_ord_num nvarchar(50),
	 sls_prd_key nvarchar(50),
	 sls_cust_id INT,
	 sls_order_dt INT,
	 sls_ship_dt INT,
	 sls_due_dt INT,
	 sls_sales INT,
	 sls_quantity INT,
	 sls_price INT
 );

 --Import ERP Tables

if OBJECT_ID('bronze.erp_loc_a101','U') is not null
	drop table bronze.erp_loc_a101;
create table bronze.erp_loc_a101 (
	 cid nvarchar(50),
	 cntry nvarchar(50)
);
if OBJECT_ID('bronze.erp_cust_az12','U') is not null
	drop table bronze.erp_cust_az12;
create table bronze.erp_cust_az12 (
	 cid nvarchar(50),
	 bdate date,
	 gen nvarchar(50)
);

if OBJECT_ID('bronze.erp_px_cat_g1v2','U') is not null
	drop table bronze.erp_px_cat_g1v2;
create table bronze.erp_px_cat_g1v2 (
	 id nvarchar(50),
	 cat nvarchar(50),
	 subcat nvarchar(50),
	 maintenance nvarchar(50)
);
