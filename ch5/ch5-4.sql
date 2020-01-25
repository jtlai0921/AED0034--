/*CH5 T-SQL*/
/*以下為5-4節*/
--ch5-4.2-01/*01代表書中內容範例的順序,02,03...以此類推*/
--步驟1.空白產生資料表
IF OBJECT_ID (N'[邦邦量販店].[dbo].[Customers_MaskingTEST]') IS NOT NULL
DROP TABLE [邦邦量販店].[dbo].[Customers_MaskingTEST];

CREATE TABLE [邦邦量販店].[dbo].[Customers_MaskingTEST](
	[Name] [nvarchar](5) NOT NULL,                  --姓名
	[NameID] [varchar](10) NOT NULL,                --身分證
	[Email] [varchar](50) NOT NULL,                 --EMAIL
	[MOBILE] [varchar](20) NOT NULL,				--手機
	[Address] [nvarchar](50) NOT NULL,				--地址
	[Salary] [money] NOT NULL,                      --薪水收入
	[CreditCard] [varchar](19) NOT NULL)			--信用卡號
GO

--步驟2.匯入空白資料表
INSERT INTO [邦邦量販店].[dbo].[Customers_MaskingTEST]
([Name],[NameID],[Email],[MOBILE],[Address],[Salary],[CreditCard])
VALUES (N'王杰名','A123456789','A01@hotmail.com','0910123456',N'台北市大安區和平東路11號',1000000,'5520-0001-1234-1234'),
       (N'陳京華','B123456001','B01@hotmail.com','0912123123',N'桃園市中山路200號',1500000,'4726-3495-1234-5678'),
       (N'林至為','C223456789','C01@hotmail.com','0915456789',N'台中市中正路168號3樓',2000000,'4726-3498-1111-2121')
GO

--步驟3.查詢資料表
SELECT * FROM [邦邦量販店].[dbo].[Customers_MaskingTEST]
GO

--ch5-4.2-02
--案例一語法
--01.動態資料遮罩功能設定
USE [邦邦量販店]
GO

ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [Name] 
ADD MASKED WITH (FUNCTION='PARTIAL(1,"X",1)')
GO

--02.查詢已設定的遮罩資料行
SELECT	C.name,
		D.name as table_name,
		C.is_masked,
		C.masking_function
FROM sys.masked_columns AS C
JOIN 
	 sys.tables AS D
ON C.[object_id] = D.[object_id]
WHERE is_masked = 1

--03.建立新的使用者，並授予資料表的SELECT權限。以便檢視遮罩資料並執行查詢
DROP USER EdisonSung
CREATE USER EdisonSung WITHOUT LOGIN;
GRANT SELECT ON [dbo].[Customers_MaskingTEST]  TO EdisonSung;

EXECUTE AS USER = 'EdisonSung';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT;

--案例二語法
--01.動態資料遮罩功能設定
USE [邦邦量販店]
GO

ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [NameID] 
ADD MASKED WITH (FUNCTION='PARTIAL(2,"OOOOOO",2)')
GO

--02.查詢已設定的遮罩資料行
SELECT	C.name,
		D.name as table_name,
		C.is_masked,
		C.masking_function
FROM sys.masked_columns AS C
JOIN 
	 sys.tables AS D
ON C.[object_id] = D.[object_id]
WHERE is_masked = 1

--03.建立新的使用者，並授予資料表的SELECT權限。以便檢視遮罩資料並執行查詢
DROP USER EdisonSung
CREATE USER EdisonSung WITHOUT LOGIN;
GRANT SELECT ON [dbo].[Customers_MaskingTEST]  TO EdisonSung;

EXECUTE AS USER = 'EdisonSung';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT;

--案例三語法
--01.動態資料遮罩功能設定
USE [邦邦量販店]
GO

ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [Email] 
ADD MASKED WITH (FUNCTION='email()')
GO

--02.查詢已設定的遮罩資料行
SELECT	C.name,
		D.name as table_name,
		C.is_masked,
		C.masking_function
FROM sys.masked_columns AS C
JOIN 
	 sys.tables AS D
ON C.[object_id] = D.[object_id]
WHERE is_masked = 1

--03.建立新的使用者，並授予資料表的SELECT權限。以便檢視遮罩資料並執行查詢
DROP USER EdisonSung
CREATE USER EdisonSung WITHOUT LOGIN;
GRANT SELECT ON [dbo].[Customers_MaskingTEST]  TO EdisonSung;

EXECUTE AS USER = 'EdisonSung';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT;

--案例四語法
--01.動態資料遮罩功能設定
USE [邦邦量販店]
GO

ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [MOBILE] 
ADD MASKED WITH (FUNCTION='default()')
GO

--02.查詢已設定的遮罩資料行
SELECT	C.name,
		D.name as table_name,
		C.is_masked,
		C.masking_function
FROM sys.masked_columns AS C
JOIN 
	 sys.tables AS D
ON C.[object_id] = D.[object_id]
WHERE is_masked = 1

--03.建立新的使用者，並授予資料表的SELECT權限。以便檢視遮罩資料並執行查詢
DROP USER EdisonSung
CREATE USER EdisonSung WITHOUT LOGIN;
GRANT SELECT ON [dbo].[Customers_MaskingTEST]  TO EdisonSung;

EXECUTE AS USER = 'EdisonSung';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT;

--案例五語法
--01.動態資料遮罩功能設定
USE [邦邦量販店]
GO

ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [Address] 
ADD MASKED WITH (FUNCTION='partial(6,"OOOOO",0)')
GO

--02.查詢已設定的遮罩資料行
SELECT	C.name,
		D.name as table_name,
		C.is_masked,
		C.masking_function
FROM sys.masked_columns AS C
JOIN 
	 sys.tables AS D
ON C.[object_id] = D.[object_id]
WHERE is_masked = 1

--03.建立新的使用者，並授予資料表的SELECT權限。以便檢視遮罩資料並執行查詢
DROP USER EdisonSung
CREATE USER EdisonSung WITHOUT LOGIN;
GRANT SELECT ON [dbo].[Customers_MaskingTEST]  TO EdisonSung;

EXECUTE AS USER = 'EdisonSung';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT;

--案例六語法
--01.動態資料遮罩功能設定
USE [邦邦量販店]
GO

ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [Salary] 
ADD MASKED WITH (FUNCTION='default()')
GO

--02.查詢已設定的遮罩資料行
SELECT	C.name,
		D.name as table_name,
		C.is_masked,
		C.masking_function
FROM sys.masked_columns AS C
JOIN 
	 sys.tables AS D
ON C.[object_id] = D.[object_id]
WHERE is_masked = 1

--03.建立新的使用者，並授予資料表的SELECT權限。以便檢視遮罩資料並執行查詢
DROP USER EdisonSung
CREATE USER EdisonSung WITHOUT LOGIN;
GRANT SELECT ON [dbo].[Customers_MaskingTEST]  TO EdisonSung;

EXECUTE AS USER = 'EdisonSung';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT;

--案例七語法
--01.動態資料遮罩功能設定
USE [邦邦量販店]
GO

ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [CreditCard] 
ADD MASKED WITH (FUNCTION= 'PARTIAL(0,"xxxx-xxxx-xxxx-",4)')
GO

--02.查詢已設定的遮罩資料行
SELECT	C.name,
		D.name as table_name,
		C.is_masked,
		C.masking_function
FROM sys.masked_columns AS C
JOIN 
	 sys.tables AS D
ON C.[object_id] = D.[object_id]
WHERE is_masked = 1

--03.建立新的使用者，並授予資料表的SELECT權限。以便檢視遮罩資料並執行查詢
DROP USER EdisonSung
CREATE USER EdisonSung WITHOUT LOGIN;
GRANT SELECT ON [dbo].[Customers_MaskingTEST]  TO EdisonSung;

EXECUTE AS USER = 'EdisonSung';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT;

--案例七語法
--01.動態資料遮罩功能設定
USE [邦邦量販店]
GO

ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [CreditCard] 
ADD MASKED WITH (FUNCTION= 'PARTIAL(0,"xxxx-xxxx-xxxx-",4)')
GO

--02.查詢已設定的遮罩資料行
SELECT	C.name,
		D.name as table_name,
		C.is_masked,
		C.masking_function
FROM sys.masked_columns AS C
JOIN 
	 sys.tables AS D
ON C.[object_id] = D.[object_id]
WHERE is_masked = 1

--03.建立新的使用者，並授予資料表的SELECT權限。以便檢視遮罩資料並執行查詢
DROP USER EdisonSung
CREATE USER EdisonSung WITHOUT LOGIN;
GRANT SELECT ON [dbo].[Customers_MaskingTEST]  TO EdisonSung;

EXECUTE AS USER = 'EdisonSung';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT;

--ch5-4.2-03
--調整資料遮罩設定
--01.動態資料遮罩功能調整設定
USE [邦邦量販店]
GO
--A.調整前
ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [CreditCard] 
ADD MASKED WITH (FUNCTION= 'PARTIAL(0,"xxxx-xxxx-xxxx-",4)')
GO

--B.調整後
ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [CreditCard] 
ADD MASKED WITH (FUNCTION= 'PARTIAL(0,"xxxx-xxxx",4)')
GO

--02.查詢已設定的遮罩資料行
SELECT	C.name,
		D.name as table_name,
		C.is_masked,
		C.masking_function
FROM sys.masked_columns AS C
JOIN 
	 sys.tables AS D
ON C.[object_id] = D.[object_id]
WHERE is_masked = 1

--03.建立新的使用者，並授予資料表的SELECT權限。以便檢視遮罩資料並執行查詢
DROP USER EdisonSung
CREATE USER EdisonSung WITHOUT LOGIN;
GRANT SELECT ON [dbo].[Customers_MaskingTEST]  TO EdisonSung;

EXECUTE AS USER = 'EdisonSung';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT;

--ch5-4.2-04
--賦予使用者UNMASK權限
USE [邦邦量販店]
GO
--01.新增EdisonChen登錄
CREATE USER EdisonChen WITHOUT LOGIN
GO
--02.賦予查詢[dbo].[Customers_MaskingTEST]權限
GRANT SELECT ON [dbo].[Customers_MaskingTEST] TO EdisonChen
GO
--03.賦予UNMASK權限,不受遮罩影響
GRANT UNMASK TO EdisonSung1
GO
--04.執行驗證
EXECUTE AS USER ='EdisonChen';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT
GO

--ch5-4.2-05
--動態資料遮罩的限制
EXECUTE AS USER='Edisonsung'
SELECT * FROM [dbo].[Customers_MaskingTEST];
/*資料類型轉換*/
SELECT	CAST(NAME AS NCHAR(10)),
		CAST(Salary AS VARCHAR(MAX)) FROM [dbo].[Customers_MaskingTEST]
REVERT
GO

--ch5-4.3-01
/*支援 JSON 的格式*/
--加上FOR JSON AUTO，支援JSON輸出
SELECT * FROM [邦邦量販店].[dbo].[一般會員基本資料] FOR JSON AUTO

--ch5-4.3-02
/*支援 JSON 的格式*/
--為FOR JSON AUTO加上Root Key，使用ROOT選項自訂Root Key名稱
SELECT * 
FROM [邦邦量販店].[dbo].[一般會員基本資料] 
FOR JSON AUTO,ROOT('Retaildata')

--ch5-4.3-03
/*支援 JSON 的格式*/
--使用JSON PATH輸出JSON格式
--原始查詢,存在NULL
SELECT	[ProductID],
		[Productname],
		[Product_Combine1],
		[ProdQuantity_Combine1],
		[Product_Combine2],
		[ProdQuantity_Combine2],
		[Product_Combine3],
		[ProdQuantity_Combine3],
		[Product_Combine4],
		[ProdQuantity_Combine4],
		[Price]
FROM [邦邦量販店].[dbo].[產品組成貨號]
GO
--使用JSON AUTO輸出JSON格式，NULL會被忽略
SELECT	[ProductID],
		[Productname],
		[Product_Combine1],
		[ProdQuantity_Combine1],
		[Product_Combine2],
		[ProdQuantity_Combine2],
		[Product_Combine3],
		[ProdQuantity_Combine3],
		[Product_Combine4],
		[ProdQuantity_Combine4],
		[Price]
FROM [邦邦量販店].[dbo].[產品組成貨號]
FOR JSON AUTO

--使用JSON PATH輸出NULL資料行
SELECT	[ProductID],
		[Productname],
		[Product_Combine1],
		[ProdQuantity_Combine1],
		[Product_Combine2],
		[ProdQuantity_Combine2],
		[Product_Combine3],
		[ProdQuantity_Combine3],
		[Product_Combine4],
		[ProdQuantity_Combine4],
		[Price]
FROM [邦邦量販店].[dbo].[產品組成貨號]
FOR JSON PATH,INCLUDE_NULL_VALUES
GO