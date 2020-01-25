/*6-3-1	基本功夫－查詢資料*/
--1.「SELECT的格式（1）－選擇（或篩選）」
USE [邦邦量販店]
GO

SELECT [MemberID] FROM [dbo].[GMC_Profile]
GO

--2.「SELECT的格式（2）－別名」
USE 邦邦量販店
GO

SELECT	[MemberID] AS 會員編號, --使用AS
		[MemberID] [會員編號], --使用中括號
		[MemberID] 會員編號 --無使用中括號
FROM [dbo].[GMC_Profile]
GO

--3.「條件式篩選（WHERE）加比較運算子（小於、大於、等於…）」
SELECT [MemberID],[Sex],[Occupation]
FROM [邦邦量販店].[dbo].[GMC_Profile]
WHERE [SEX]='F'
AND [Occupation]='服務工作人員' 
AND [Start_date]>='2007-01-01'
GO

--4.「條件式篩選（WHERE）加邏輯運算子（AND、OR、NOT…）」
--AND
SELECT [MemberID],[Sex],[Occupation]
FROM [邦邦量販店].[dbo].[GMC_Profile]
WHERE [SEX]='F'
AND [Occupation]='服務工作人員' AND [Start_date]>='2007-01-01'
GO

--OR
SELECT [MemberID],[Sex],[Occupation]
FROM [邦邦量販店].[dbo].[GMC_Profile]
WHERE SEX='F'
AND ( [Occupation]='服務工作人員' OR [Occupation]='行政及主管人員' )
AND [Start_date]>='2007-01-01'
GO

--NOT
SELECT [MemberID],[Sex],[Occupation]
FROM [邦邦量販店].[dbo].[GMC_Profile]
WHERE NOT ( [Occupation]='服務工作人員' OR [Occupation]='行政及主管人員' )
AND [Sex]='F'

--5.「條件式篩選（WHERE）加區間運算子（BETWEEN…AND…）」
SELECT *
FROM [邦邦量販店].[dbo].[VIP_TransDetail]
WHERE [Trans_Createdate] BETWEEN '2006-01-01' AND '2006-06-30'
AND [Productname]='肉類製品(包)'
GO

--6.「條件式篩選（WHERE）加類區間運算子（IN）」
SELECT	*
FROM [邦邦量販店].[dbo].[GMC_Profile]
WHERE [Occupation] IN('行政及主管人員','運輸設備操作工','監督及佐理人員','技術性人員')
AND [Channel] IN ('Voluntary','Advertising')
GO

--7.「使用LIKE選取」
--使用'%d%'
SELECT [MemberID],[Sex],[Birthday],[Occupation],[Channel]
FROM [邦邦量販店].[dbo].[GMC_Profile]
WHERE [Channel] LIKE'%d%'
GO

--使用'%d'
SELECT [MemberID],[Sex],[Birthday],[Occupation],[Channel]
FROM [邦邦量販店].[dbo].[GMC_Profile]
WHERE [Channel] LIKE'%d'
GO

--使用'%d'
SELECT [MemberID],[Sex],[Birthday],[Occupation],[Channel]
FROM [邦邦量販店].[dbo].[GMC_Profile]
WHERE [Channel] LIKE'd%'
GO

--8.「NULL的使用」
--（WHERE 加 NULL)
SELECT	*
FROM [邦邦量販店].[dbo].[GMC_Profile]
WHERE Occupation IS NULL
GO

--（SELECT 加 NULL)
SELECT [MemberID], [Occupation], [Location], NULL [未定數]
FROM [邦邦量販店].[dbo].[GMC_Profile]
GO

--9.「TOP的使用」
SELECT	TOP 100 [MemberID],[Occupation],[Location],[Start_date]
FROM [邦邦量販店].[dbo].[GMC_Profile]
ORDER BY [Start_date]
GO

--10.「TABLESAMPLE的使用」
--使用數字
SELECT	*
FROM [邦邦量販店].[dbo].[GMC_Profile]
TABLESAMPLE(1000 ROWS)
ORDER BY [Start_date]
GO

--使用數字並搭配TOP
SELECT	TOP 1000 *
FROM [邦邦量販店].[dbo].[GMC_Profile]
TABLESAMPLE(2000 ROWS)
ORDER BY [Start_date]
GO

--使用百分比
SELECT	*
FROM [邦邦量販店].[dbo].[GMC_Profile]
TABLESAMPLE(10 PERCENT)
ORDER BY [Start_date]
GO


--11.「指定顯示排序（ORDER BY）」
SELECT	[MemberID],
		[Sex],
		[Birthday] [生日],
		[Marriage],
		[Occupation],
		[Location],
		[Channel], 
		[Start_date],
		[End_date]
FROM [邦邦量販店].[dbo].[GMC_Profile]
ORDER BY [生日] ASC, --使用別名
		 [Start_date] DESC, --使用資料行
		 4 --使用數字
GO

--12.「字串組合」
--字串使用方式（1）
SELECT	'員工基本資歷' [說明],
		[MemberID] [員工編號],
		[Occupation] [從事職業類型],
		[Start_date] [到職日],
		[End_date] [離職日]
FROM [邦邦量販店].[dbo].[GMC_Profile]
GO

--字串使用方式（2）
SELECT '員工編號： '+ [MemberID]+', 生日： '+ RTRIM(LTRIM(CAST(CAST([Birthday] AS DATE) AS CHAR)))+' ,職業：'+[Occupation]
FROM [邦邦量販店].[dbo].[GMC_Profile]
GO

--13.「去除重複（DISTINCT）」
SELECT DISTINCT [Channel]
FROM [邦邦量販店].[dbo].[GMC_Profile]
GO

--14.「去除重複（DISTINCT）」
USE [邦邦量販店]
GO

SELECT	[MemberID],
		[Sex],
		CASE WHEN [Sex]='M' THEN '男性'
			 WHEN [Sex]='F' THEN '女性'
		ELSE NULL END AS [性別]
FROM [dbo].[GMC_Profile]
GO

