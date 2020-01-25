/*6-3-6	資料的新增、刪除與異動*/
-- 一、「資料新增」
--1.SELECT …INTO…
--(1)新增實體資料表
USE [邦邦量販店]
GO

SELECT	TOP 100 *,--原有的List欄位名稱
				DATEPART(YEAR,[Start_date]) [NEW_STATS_DATE] --新的欄位名稱
INTO [dbo].[GMC_Profile_TOP100]--使用INTO同時新增建立資料表動作
FROM [dbo].[GMC_Profile]
GO

--(2)新增暫存資料表
USE [邦邦量販店]
GO

SELECT	TOP 1000 *,--原有的List欄位名稱
				DATEPART(YEAR,[Start_date]) [NEW_STATS_DATE] --新的欄位名稱
INTO #GMC_Profile_TOP1000--使用INTO搭配#符號,同時新增建立暫存資料表動作
FROM [dbo].[GMC_Profile]
GO

--(3)產生空白資料殼
USE [邦邦量販店]
GO

SELECT	*--原有的List欄位名稱
INTO [dbo].[GMC_Profile_ETL]--使用INTO同時新增建立資料表動作
FROM [dbo].[GMC_Profile]
WHERE 1=2--產生List欄位名稱,不新增資料
GO

--2.CREATE TABLE 搭配 INSERT INTO
--(1)使用INSERT INTO指定完整資料行
/*建立會員基本資料表結構，命名為「[dbo].[GMC_Profile_Same]」*/

USE [邦邦量販店]
GO

CREATE TABLE [dbo].[GMC_Profile_Same]
(
	MemberID NVARCHAR (255) NULL,
	Sex NVARCHAR (255) NULL,
	Birthday DATETIME NULL,
	Marriage NVARCHAR (255) NULL,
	Occupation NVARCHAR (255) NULL,
	Location NVARCHAR (255) NULL,
	Channel NVARCHAR (255) NULL,
	Start_date DATETIME NULL,
	End_date DATETIME NULL
)
GO

/*INSERT INTO 5筆會員基本資料*/
INSERT INTO [dbo].[GMC_Profile_Same] 
(	MemberID, Sex , Birthday, Marriage, Occupation, Location, Channel, Start_date, End_date)

VALUES ('DM000001', 'F', '1984-10-21', '2', '服務工作人員', '彰化縣彰化市', 'Advertising', '2006-11-23', '2007-11-23'),
			  ('DM000002', 'F', '1962-10-17', '1', '服務工作人員', '台南市安南區', 'Voluntary',	 '2006-11-23', '2007-11-23'),
			  ('DM000003', 'F', '1981-06-10', '2', '行政及主管人員', '高雄縣湖內鄉', 'Voluntary', '2006-11-23', '2007-11-23'),
			  ('DM000004', 'F', '1981-09-17', '2', '技術性人員', '高雄縣大社鄉', 'DM', '2006-11-23', '2007-11-23'),
			  ('DM000005', 'M', '1951-09-25', '1', '行政及主管人員', '台中縣梧棲鎮', 'DM',	'2006-11-23', '2007-11-23')
GO


/*查詢 5筆會員基本資料*/
SELECT * FROM  [dbo].[GMC_Profile_Same] GO

--(2)使用INSERT INTO指定部分資料行

/*INSERT INTO 5筆會員基本資料*/
INSERT INTO [dbo].[GMC_Profile_Same] 
(	MemberID, Sex , Birthday, Marriage, Occupation, Location, Channel, Start_date, End_date)

VALUES ('DM000006', 'F', '1984-10-21', '2', NULL, NULL, 'Advertising', '2006-11-23', '2007-11-23'),
			  ('DM000007', NULL, '1962-10-17', '1', '服務工作人員', '台南市安南區', 'Voluntary',	 '2006-11-23', '2007-11-23'),
			  ('DM000008', 'F', NULL, '2', '行政及主管人員', '高雄縣湖內鄉', 'Voluntary', '2006-11-23', '2007-11-23'),
			  ('DM000009', 'F', '1981-09-17', '2', NULL, '高雄縣大社鄉', 'DM', '2006-11-23', '2007-11-23'),
			  ('DM000010', 'M', '1951-09-25', '1', '行政及主管人員', '台中縣梧棲鎮', 'DM',	'2006-11-23', NULL)
GO

/*查詢 10筆會員基本資料(NULL)*/
SELECT * FROM  [dbo].[GMC_Profile_Same] GO


--二、「資料刪除」
--(1) 使用SQL Server Management Studio介面刪除資料表的資料

--隨機建立一張1000筆資料的資料表
USE [邦邦量販店]
GO

SELECT	TOP 1000 * --原有的List欄位名稱加上隨機挑選1000筆資料
INTO [dbo].[GMC_Profile_Top1000] --使用INTO同時新增建立資料表動作
FROM [dbo].[GMC_Profile]
GO


--(2)使用SQL Server Management Studio介面刪除資料表

--(3)DELETE指令
--1.建立[dbo].[GMC_Profile_COPY]資料表
USE [邦邦量販店]
GO

SELECT	* --原有的List欄位名稱
INTO [dbo].[GMC_Profile_COPY] --使用INTO同時新增建立資料表動作
FROM [dbo].[GMC_Profile]
GO

--2.刪除入會日期在2007年的會員
USE [邦邦量販店]
GO

DELETE FROM [dbo].[GMC_Profile_COPY]
WHERE DATEPART(YEAR,Start_date)='2007'
GO

--3.利用COUNT()查詢剩餘資料筆數
USE [邦邦量販店]
GO

SELECT COUNT(*) FROM [dbo].[GMC_Profile_COPY] GO

--(4)TRUNCATE指令
--1.使用TRUNCATE指令刪除[dbo].[GMC_Profile_COPY]資料表的資料
USE [邦邦量販店]
GO

TRUNCATE TABLE [dbo].[GMC_Profile_COPY]

--2.查詢剩餘資料
USE [邦邦量販店]
GO

SELECT * FROM [dbo].[GMC_Profile_COPY] GO

--(5)DROP指令
--1.使用DROP指令刪除[dbo].[GMC_Profile_COPY]資料表
USE [邦邦量販店]
GO

DROP TABLE [dbo].[GMC_Profile_COPY]

--2.查詢[dbo].[GMC_Profile_COPY]資料表剩餘資料
USE [邦邦量販店]
GO

/*三 資料更新*/
--(1) UPDATE的基本使用
--1.建立[dbo].[[dbo].[Product_Detail_COPY]資料表
USE [邦邦量販店]
GO

SELECT	* --原有的List欄位名稱
INTO [dbo].[Product_Detail_COPY] --使用INTO同時新增建立資料表動作
FROM [dbo].[Product_Detail]
GO

--2.使用UPDATE指令，調漲[dbo].[Product_Detail_COPY] 的Price(單價)為1.2倍
USE [邦邦量販店]
GO

UPDATE [dbo].[Product_Detail_COPY]
SET Price=Price*1.2
GO

--3.查詢[dbo].[Product_Detail_COPY] 的Price(單價)結果
USE [邦邦量販店]
GO

SELECT	ProductID,
				Productname,
				Price 
FROM [dbo].[Product_Detail_COPY] GO

--(2)UPDATE搭配CASE使用

/*1.不同的「Price」區間，調漲不同百分比
條件為「Price」在1000以下調漲為1.2倍
；「Price」介於1001~2000調漲為1.5倍；
「Price」超過2000調漲為1.8倍*/
USE [邦邦量販店]
GO

UPDATE [dbo].[Product_Detail_COPY] 
SET Price =
CASE 
	 WHEN Price <=1000 THEN  Price*1.2
	 WHEN Price BETWEEN 1001 AND 2000 THEN  Price*1.5
	 WHEN Price >2000 THEN  Price*1.8
END
GO


--2.查詢[dbo].[Product_Detail_COPY] 的Price(單價)結果
USE [邦邦量販店]
GO

SELECT	ProductID,
				Productname,
				Price 
FROM [dbo].[Product_Detail_COPY] GO

/*四 綜合比較*/

/* 五 判斷資料表是否存在*/

--(1) 使用IF EXISTS … DROP TABLE…
USE [邦邦量販店]
GO

SELECT	TOP 100 *,--原有的List欄位名稱
				DATEPART(YEAR,[Start_date]) [NEW_STATS_DATE] --新的欄位名稱
INTO [dbo].[GMC_Profile_TOP100]--使用INTO同時新增建立資料表動作
FROM [dbo].[GMC_Profile]
GO

--(2) 使用IF OBJECT_ID … IS NOT NULL DROP TABLE…