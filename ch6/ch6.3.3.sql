/*6-3-3	進階功夫－分析資料*/
--1.「GROUP BY－群組化敘述」」
USE [邦邦量販店]
GO

SELECT	[Productname],
		COUNT([TransactionID]) [訂單數量],
		SUM([Money]) [訂單總額],
		AVG([Money]) [平均單筆訂單金額],
		MAX([Money]) [最大單筆訂單金額],
		MIN([Money]) [最小單筆訂單金額]
FROM [dbo].[GMC_TransDetail]
GROUP BY [Productname]
GO

--2.「彙總過濾篩選（HAVING）」」
USE 邦邦量販店
GO

SELECT	[Productname],
		COUNT([TransactionID]) [訂單數量],
		SUM([Money]) [訂單總額],
		AVG([Money]) [平均單筆訂單金額],
		MAX([Money]) [最大單筆訂單金額],
		MIN([Money]) [最小單筆訂單金額]
FROM [dbo].[GMC_TransDetail]
GROUP BY [Productname]
HAVING COUNT([TransactionID]) >=10000 --訂單數量至少1萬筆
GO

--3.「資料合併（UNION和UNION ALL）」
USE [邦邦量販店]
GO

SELECT	[MemberID],
		'VIP會員' [GROUP_NAME],
		[Birthday],
		[Occupation],
		[Channel]
FROM [dbo].[VIP_Profile]
 UNION ALL
SELECT	[MemberID],
		'一般會員' [GROUP_NAME],
		[Birthday],
		[Occupation],
		[Channel]
FROM [dbo].[GMC_Profile]
GO

--4.「資料轉向（PIVOT和UNPIVOT）」
--PVIOT指令
SELECT	TT.Channel [會員來源管道人數],
		[2000],
		[2001],
		[2002],
		[2003]
		[2004],
		[2005],
		[2006],
		[2007]
FROM (	SELECT	Channel,
				[MemberID],
				DATEPART(YEAR,[Start_date]) [YEAR]
		FROM [邦邦量販店].[dbo].[GMC_Profile]	) TT
PIVOT ( COUNT([MemberID])
		FOR [YEAR] IN([2000],[2001],[2002],[2003],[2004],[2005],[2006],[2007])) TT
ORDER BY 1
GO

--使用CASE達到PIVOT效果
SELECT	Channel [會員來源管道人數],
		COUNT( CASE  WHEN DATEPART(YEAR,[Start_date])=2000 THEN [MemberID] ELSE NULL END) [2004],
		COUNT( CASE  WHEN DATEPART(YEAR,[Start_date])=2001 THEN [MemberID] ELSE NULL END) [2005],
		COUNT( CASE  WHEN DATEPART(YEAR,[Start_date])=2002 THEN [MemberID] ELSE NULL END) [2006],
		COUNT( CASE  WHEN DATEPART(YEAR,[Start_date])=2003 THEN [MemberID] ELSE NULL END) [2007],
		COUNT( CASE  WHEN DATEPART(YEAR,[Start_date])=2004 THEN [MemberID] ELSE NULL END) [2004],
		COUNT( CASE  WHEN DATEPART(YEAR,[Start_date])=2005 THEN [MemberID] ELSE NULL END) [2005],
		COUNT( CASE  WHEN DATEPART(YEAR,[Start_date])=2006 THEN [MemberID] ELSE NULL END) [2006],
		COUNT( CASE  WHEN DATEPART(YEAR,[Start_date])=2007 THEN [MemberID] ELSE NULL END) [2007]
FROM [邦邦量販店].[dbo].[GMC_Profile]
GROUP BY Channel
ORDER BY 1
GO

--UNPVIOT指令
--1.建立使用資料表
USE [邦邦量販店]
GO

CREATE TABLE [dbo].[UNPVIOT_SQL]
(	ID INT,--編號
	ITEM_NAME NVARCHAR(20),--名稱
	DATE_NAME CHAR(8),--保存期限
	PRICE MONEY	)--價格
GO

--2.匯入測試資料
INSERT INTO [邦邦量販店].[dbo].[UNPVIOT_SQL] VALUES(1,'舒跑','20140506',20)
INSERT INTO [邦邦量販店].[dbo].[UNPVIOT_SQL] VALUES(2,'舒跑','20150506',20)
INSERT INTO [邦邦量販店].[dbo].[UNPVIOT_SQL] VALUES(3,'養樂多','20160101',10)
INSERT INTO [邦邦量販店].[dbo].[UNPVIOT_SQL] VALUES(4,'養樂多','20160501',10)
INSERT INTO [邦邦量販店].[dbo].[UNPVIOT_SQL] VALUES(5,'養樂多','20160901',10)
INSERT INTO [邦邦量販店].[dbo].[UNPVIOT_SQL] VALUES(6,'黑松沙士','20170120',30)
INSERT INTO [邦邦量販店].[dbo].[UNPVIOT_SQL] VALUES(7,'維大力','20161115',35)
INSERT INTO [邦邦量販店].[dbo].[UNPVIOT_SQL] VALUES(8,'維大力','20161001',35)
INSERT INTO [邦邦量販店].[dbo].[UNPVIOT_SQL] VALUES(9,'寶健','20151210',25)
INSERT INTO [邦邦量販店].[dbo].[UNPVIOT_SQL] VALUES(10,'芬達','20160505',28)

--3.查詢結果
SELECT * FROM [邦邦量販店].[dbo].[UNPVIOT_SQL] GO


--4.使用UNPIVOT指令
SELECT [ID],ATTRIBUTE [COLUMN_NAME],VALUE [VALUES]
FROM (
SELECT	[ID],
		CAST(ITEM_NAME AS SQL_VARIANT) [飲料名稱],
		CAST(DATE_NAME AS SQL_VARIANT) [保存期限],
		CAST(PRICE AS SQL_VARIANT) [價錢]
FROM [邦邦量販店].[dbo].[UNPVIOT_SQL]) AA
	UNPIVOT
(
 VALUE FOR ATTRIBUTE IN([飲料名稱],[保存期限],[價錢])
) BB
ORDER BY [ID]
GO
