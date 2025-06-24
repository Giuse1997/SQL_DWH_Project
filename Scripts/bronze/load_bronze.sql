/*
===============================
Stored Procedure: load bronze layer (source --> bronze)
===============================
la stored procedure carica i dati nelle tabelle presenti nel db, precisamente nello schema bronze. 

*/



create or alter procedure bronze.load_bronze as 
	begin
	print '================================================'
	print'Loading Bronze Layer'
	print '================================================'

	Print '------------------------------------------------'
	Print 'loading CRM Tables'
	Print '------------------------------------------------'

	truncate table bronze.crm_cust_info;

	bulk insert bronze.crm_cust_info
	from 'C:\Users\39348\Desktop\Business Intelligence\source_crm\cust_info.csv'
	with (
		firstrow=2,
		fieldterminator=',',
		tablock
	);

	truncate table bronze.crm_prd_info;

	bulk insert bronze.crm_prd_info
	from 'C:\Users\39348\Desktop\Business Intelligence\source_crm\prd_info.csv'
	with (
		firstrow=2,
		fieldterminator=',',
		tablock
	);

	truncate table bronze.crm_sales_details;

	bulk insert bronze.crm_sales_details
	from 'C:\Users\39348\Desktop\Business Intelligence\source_crm\sales_details.csv'
	with (
		firstrow=2,
		fieldterminator=',',
		tablock
	);

	Print '------------------------------------------------'
	Print 'loading ERP Tables'
	Print '------------------------------------------------'

	truncate table bronze.erp_loc_a101;

	bulk insert bronze.erp_loc_a101
	from 'C:\Users\39348\Desktop\Business Intelligence\source_erp\LOC_A101.csv'
	with (
		firstrow=2,
		fieldterminator=',',
		tablock
	);

	truncate table bronze.erp_cust_az12;

	bulk insert bronze.erp_cust_az12
	from 'C:\Users\39348\Desktop\Business Intelligence\source_erp\CUST_AZ12.csv'
	with (
		firstrow=2,
		fieldterminator=',',
		tablock
	);

	truncate table bronze.erp_px_cat_g1v2;

	bulk insert bronze.erp_px_cat_g1v2
	from 'C:\Users\39348\Desktop\Business Intelligence\source_erp\PX_CAT_G1V2.csv'
	with (
		firstrow=2,
		fieldterminator=',',
		tablock
	);

end;
