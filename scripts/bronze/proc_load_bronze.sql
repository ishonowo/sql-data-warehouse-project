CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
  DECLARE @start_time DATETIME, @end_time DATETIME;
  DECLARE @global_start_time DATETIME, @global_end_time DATETIME;
  BEGIN TRY
	SET @global_start_time=GETDATE();
	PRINT '=============================================================';
	PRINT 'Loading Bronze Layer';
	PRINT '=============================================================';
	
	PRINT '-------------------------------------------------------------';
	PRINT 'Loading CRM Tables';
	PRINT '-------------------------------------------------------------';

	SET @start_time=GETDATE();
	PRINT '>>Truncating Table: bronze.crm_cust_info';
	
	TRUNCATE TABLE bronze.crm_cust_info;
	
	PRINT '>>Inserting Data Into : bronze.crm_cust_info';
	BULK INSERT bronze.crm_cust_info
	FROM 'C:\SQL\cust_info.csv'
	WITH (
		FIRSTROW=2, 
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time=GETDATE();
	PRINT '>> ---------------';
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(millisecond,@start_time,@end_time) AS NVARCHAR)+ ' milliseconds';
	PRINT '>> ---------------';

	SET @start_time=GETDATE();
	PRINT '>>Truncating Table: bronze.[crm_prd_info]';
	TRUNCATE TABLE [bronze].[crm_prd_info];

	PRINT '>>Inserting Data Into : bronze.[crm_prd_info]';
	BULK INSERT [bronze].[crm_prd_info]
	FROM 'C:\SQL\prd_info.csv'
	WITH (
		FIRSTROW=2, 
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time=GETDATE();
	PRINT '>> ---------------';
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(millisecond,@start_time,@end_time) AS NVARCHAR)+ ' milliseconds';
	PRINT '>> ---------------';

	SET @start_time=GETDATE();
	PRINT '>>Truncating Table: bronze.[crm_sales_details]';
	TRUNCATE TABLE [bronze].[crm_sales_details];

	PRINT '>>Inserting Data Into : bronze.[crm_sales_details]';
	BULK INSERT [bronze].[crm_sales_details]
	FROM 'C:\SQL\sales_details.csv'
	WITH (
		FIRSTROW=2, 
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time=GETDATE();
	PRINT '>> ---------------';
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(millisecond,@start_time,@end_time) AS NVARCHAR)+ ' milliseconds';
	PRINT '>> ---------------';

	PRINT '-------------------------------------------------------------';
	PRINT 'Loading ERP Tables';
	PRINT '-------------------------------------------------------------';

	SET @start_time=GETDATE();
	PRINT '>>Truncating Table: bronze.[erp_cust_az12]';
	TRUNCATE TABLE [bronze].[erp_cust_az12];

	PRINT '>>Inserting Data Into : bronze.[erp_cust_az12]';
	BULK INSERT [bronze].[erp_cust_az12]
	FROM 'C:\SQL\CUST_AZ12.csv'
	WITH (
		FIRSTROW=2, 
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time=GETDATE();
	PRINT '>> ---------------';
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(millisecond,@start_time,@end_time) AS NVARCHAR)+ ' milliseconds';
	PRINT '>> ---------------';

	SET @start_time=GETDATE();
	PRINT '>>Truncating Table: bronze.[erp_loc_a101]';
	TRUNCATE TABLE [bronze].[erp_loc_a101];

	PRINT '>>Inserting Data Into : bronze.[erp_loc_a101]';
	BULK INSERT [bronze].[erp_loc_a101]
	FROM 'C:\SQL\LOC_A101.csv'
	WITH (
		FIRSTROW=2, 
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time=GETDATE();
	PRINT '>> ---------------';
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(millisecond,@start_time,@end_time) AS NVARCHAR)+ ' milliseconds';
	PRINT '>> ---------------';

	SET @start_time=GETDATE();
	PRINT '>>Truncating Table: bronze.[erp_px_cat_g1v2]';
	TRUNCATE TABLE [bronze].[erp_px_cat_g1v2];

	PRINT '>>Inserting Data Into : bronze.[erp_px_cat_g1v2]';
	BULK INSERT [bronze].[erp_px_cat_g1v2]
	FROM 'C:\SQL\PX_CAT_G1V2.csv'
	WITH (
		FIRSTROW=2, 
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time=GETDATE();
	PRINT '>> ---------------';
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(millisecond,@start_time,@end_time) AS NVARCHAR)+ ' milliseconds';
	PRINT '>> ---------------';
	SET @global_end_time=GETDATE();

	PRINT '*************************'
	PRINT '** The Total Load Duration for all table loads is '+ CAST(DATEDIFF(millisecond,@global_start_time,@global_end_time) AS NVARCHAR) + ' in milliseconds';
	PRINT '*************************'
  END TRY
  BEGIN CATCH
	PRINT '=============================================================';
	PRINT 'AN ERROR HAS OCCURED LOADING THE BRONZE LAYER';
	PRINT 'The error message is '+ ERROR_MESSAGE();
	PRINT 'The error number is '+ CAST(ERROR_NUMBER() AS NVARCHAR);
	PRINT 'The error message is '+ CAST(ERROR_STATE() AS NVARCHAR);
	PRINT '=============================================================';
  END CATCH;
END;
