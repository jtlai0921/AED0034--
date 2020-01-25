/*7-1-4	會員基本變項分析－會籍時間長度*/
--exercise1
--1.計算GMC會員的會籍天數
WITH TEST1 AS 
( SELECT *,DATEDIFF(DAY,[Start_date],[End_date]) AS 會籍天數
  FROM [邦邦量販店].[dbo].[GMC_Profile_new])

SELECT [會籍天數],COUNT(*) [人數]
FROM TEST1
GROUP BY [會籍天數]
ORDER BY 2 DESC
GO

--2.編制「會籍天數」成「會籍年數」
IF OBJECT_ID (N'[邦邦量販店].[dbo].[GMC_Profile_new1]') IS NOT NULL
DROP TABLE [邦邦量販店].[dbo].[GMC_Profile_new1];

SELECT	[MemberID], [Sex], [Birthday],
		[Marriage_Status],--婚姻狀態
		[Occupation],
		[COUNTY],--縣市別
		[Channel], [Start_date], [End_date],
		CASE WHEN DATEDIFF(DAY,[Start_date],[End_date]) 
			 BETWEEN 0 AND 365 THEN '一年期'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 366 AND 730 THEN '二年期'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 731 AND 1095 THEN '三年期'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 1096 AND 1460 THEN '四年期'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 1461 AND 1825 THEN '五年期'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 1826 AND 2190 THEN '六年期'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 2191 AND 2555 THEN '七年期'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 2556 AND 2920 THEN '八年期'
		ELSE '其他' END AS [Member_Years] --會籍年數
INTO [邦邦量販店].[dbo].[GMC_Profile_new1]
FROM [邦邦量販店].[dbo].[GMC_Profile_new]
GO


--exercise2
--1.計算VIP會員的會籍天數
WITH TEST2 AS 
( SELECT *,DATEDIFF(DAY,[Start_date],[End_date]) AS 會籍天數
  FROM [邦邦量販店].[dbo].[VIP_Profile_new])

SELECT [會籍天數],COUNT(*) [人數]
FROM TEST2
GROUP BY [會籍天數]
ORDER BY 2 DESC
GO

--2.編制「會籍天數」成「會籍年數」
IF OBJECT_ID (N'[邦邦量販店].[dbo].[VIP_Profile_new1]') IS NOT NULL
DROP TABLE [邦邦量販店].[dbo].[VIP_Profile_new1];

SELECT	[MemberID], [Sex], [Birthday],
		[Marriage_Status],--婚姻狀態
		[Occupation],
		[COUNTY],--縣市別
		[Channel], [Create_date], [Start_date], [End_date],
		CASE WHEN DATEDIFF(DAY,[Start_date],[End_date]) 
			 BETWEEN 0 AND 365 THEN '一年期'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 366 AND 730 THEN '二年期'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 731 AND 1095 THEN '三年期'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 1096 AND 1460 THEN '四年期'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 1461 AND 1825 THEN '五年期'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 1826 AND 2190 THEN '六年期'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 2191 AND 2555 THEN '七年期'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 2556 AND 2920 THEN '八年期'
		ELSE '其他' END AS [Member_Years] --會籍年數
INTO [邦邦量販店].[dbo].[VIP_Profile_new1]
FROM [邦邦量販店].[dbo].[VIP_Profile_new]
GO

--exercise3
--1.計算GMC與VIP會員的會籍年數分佈
SELECT Member_Years,COUNT(*) [GMC人數]
FROM [邦邦量販店].[dbo].[GMC_Profile_new1]
GROUP BY Member_Years
ORDER BY 1

SELECT Member_Years,COUNT(*) [VIP人數]
FROM [邦邦量販店].[dbo].[VIP_Profile_new1]
GROUP BY Member_Years
ORDER BY 1
