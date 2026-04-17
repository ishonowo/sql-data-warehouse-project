USE [DataWarehouse]
GO

/****** Object:  Table [bronze].[crm_cust_info]    Script Date: 17/04/2026 15:44:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [bronze].[crm_cust_info];

CREATE TABLE [bronze].[crm_cust_info](
	[cst_id] [int] NULL,
	[cst_key] [nvarchar](50) NULL,
	[cst_firstname] [nvarchar](50) NULL,
	[cst_lastname] [nvarchar](50) NULL,
	[cst_marital_status] [nvarchar](50) NULL,
	[cst_gndr] [nvarchar](50) NULL,
	[cst_create_date] [date] NULL
) ON [PRIMARY]
GO


USE [DataWarehouse]
GO

/****** Object:  Table [bronze].[crm_prd_info]    Script Date: 17/04/2026 15:45:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [bronze].[crm_prd_info];

CREATE TABLE [bronze].[crm_prd_info](
	[prd_id] [int] NULL,
	[prd_key] [nvarchar](50) NULL,
	[prd_nm] [nvarchar](50) NULL,
	[prd_cost] [int] NULL,
	[prd_line] [nvarchar](50) NULL,
	[prd_start_dt] [datetime] NULL,
	[prd_end_dt] [datetime] NULL
) ON [PRIMARY]
GO

USE [DataWarehouse]
GO

/****** Object:  Table [bronze].[crm_sales_details]    Script Date: 17/04/2026 15:45:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [bronze].[crm_sales_details];

CREATE TABLE [bronze].[crm_sales_details](
	[sls_ord_num] [nvarchar](50) NULL,
	[sls_prd_key] [nvarchar](50) NULL,
	[sls_cust_id] [int] NULL,
	[sls_order_dt] [int] NULL,
	[sls_ship_dt] [int] NULL,
	[sls_due_dt] [int] NULL,
	[sls_sales] [int] NULL,
	[sls_quantity] [int] NULL,
	[sls_price] [int] NULL
) ON [PRIMARY]
GO

USE [DataWarehouse]
GO

/****** Object:  Table [bronze].[erp_cust_az12]    Script Date: 17/04/2026 15:45:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [bronze].[erp_cust_az12];

CREATE TABLE [bronze].[erp_cust_az12](
	[cid] [nvarchar](50) NULL,
	[bdate] [date] NULL,
	[gen] [nvarchar](50) NULL
) ON [PRIMARY]
GO


USE [DataWarehouse]
GO

/****** Object:  Table [bronze].[erp_loc_a101]    Script Date: 17/04/2026 15:46:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [bronze].[erp_loc_a101];

CREATE TABLE [bronze].[erp_loc_a101](
	[cid] [nvarchar](50) NULL,
	[cntry] [nvarchar](50) NULL
) ON [PRIMARY]
GO

USE [DataWarehouse]
GO

/****** Object:  Table [bronze].[erp_px_cat_g1v2]    Script Date: 17/04/2026 15:46:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [bronze].[erp_px_cat_g1v2];

CREATE TABLE [bronze].[erp_px_cat_g1v2](
	[id] [nvarchar](50) NULL,
	[cat] [nvarchar](50) NULL,
	[subcat] [nvarchar](50) NULL,
	[maintenance] [nvarchar](50) NULL
) ON [PRIMARY]
GO


