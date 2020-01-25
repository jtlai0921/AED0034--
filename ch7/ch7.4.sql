/*7-4 會員流失率*/
--exercise1
--1.建立彙總資料表，以VIP會員為例
IF OBJECT_ID (N'[邦邦量販店].[dbo].[VIP會員流失率]') IS NOT NULL
DROP TABLE [邦邦量販店].[dbo].[VIP會員流失率];

SELECT	DISTINCT A.[MemberID], A.[Create_date], A.[End_date], 
		CASE WHEN [Create_date]>='2004-01-01' AND [Create_date]<'2005-01-01' THEN '2004'
			 WHEN [Create_date]>='2005-01-01' AND [Create_date]<'2006-01-01' THEN '2005'
			 WHEN [Create_date]>='2006-01-01' AND [Create_date]<'2007-01-01' THEN '2006'
			 WHEN [Create_date]>='2007-01-01' AND [Create_date]<'2008-01-01' THEN '2007'
		ELSE NULL END AS [加入年度],
		CASE WHEN DATEDIFF(DAY,[Create_date],[End_date])<=365 THEN '第1年流失'
			 WHEN DATEDIFF(DAY,[Create_date],[End_date])>365 AND DATEDIFF(DAY,[Create_date],[End_date])<=730 THEN '第2年流失'
			 WHEN DATEDIFF(DAY,[Create_date],[End_date])>730 AND DATEDIFF(DAY,[Create_date],[End_date])<=1095 THEN '第3年流失' 
			 WHEN DATEDIFF(DAY,[Create_date],[End_date])>1095 AND DATEDIFF(DAY,[Create_date],[End_date])<=1460 THEN '第4年流失'
			 WHEN DATEDIFF(DAY,[Create_date],[End_date])>1460 AND DATEDIFF(DAY,[Create_date],[End_date])<=1825 THEN '第5年流失'
			 WHEN DATEDIFF(DAY,[Create_date],[End_date])>1825 AND DATEDIFF(DAY,[Create_date],[End_date])<=2190 THEN '第6年流失'
			 WHEN DATEDIFF(DAY,[Create_date],[End_date])>2190 AND DATEDIFF(DAY,[Create_date],[End_date])<=2555 THEN '第7年流失'
		ELSE '其他' END AS [流失年度]
INTO [邦邦量販店].[dbo].[VIP會員流失率]
FROM [邦邦量販店].[dbo].[VIP_Profile_new1]	A
LEFT JOIN
	 [邦邦量販店].[dbo].[VIP_TransDetail]   B
ON	A.[MemberID]=B.[MemberID]
WHERE B.MemberID IS NOT NULL --排除沒有交易的會員

--2.查詢各年度加入VIP會員人數
SELECT	[加入年度], 
		COUNT([MemberID]) [VIP人數]
FROM (	SELECT	[MemberID],
				CASE WHEN [Create_date]>='2004-01-01' AND [Create_date]<'2005-01-01' THEN '2004' 
					 WHEN [Create_date]>='2005-01-01' AND [Create_date]<'2006-01-01' THEN '2005'
					 WHEN [Create_date]>='2006-01-01' AND [Create_date]<'2007-01-01' THEN '2006' 
					 WHEN [Create_date]>='2007-01-01' AND [Create_date]<'2008-01-01' THEN '2007'
				ELSE NULL END AS [加入年度]
		FROM [邦邦量販店].[dbo].[VIP_Profile_new1] )AA
GROUP BY [加入年度]
ORDER BY 1
GO 

--3.查詢各年度加入VIP會員的流失情形
SELECT	[加入年度],
		COUNT(CASE WHEN [流失年度]='第1年流失' THEN 1 ELSE NULL END) AS '第1年流失',
		COUNT(CASE WHEN [流失年度]='第2年流失' THEN 1 ELSE NULL END) AS '第2年流失',
		COUNT(CASE WHEN [流失年度]='第3年流失' THEN 1 ELSE NULL END) AS '第3年流失',
		COUNT(CASE WHEN [流失年度]='第4年流失' THEN 1 ELSE NULL END) AS '第4年流失',
		COUNT(CASE WHEN [流失年度]='第5年流失' THEN 1 ELSE NULL END) AS '第5年流失',
		COUNT(CASE WHEN [流失年度]='第6年流失' THEN 1 ELSE NULL END) AS '第6年流失',
		COUNT(CASE WHEN [流失年度]='第7年流失' THEN 1 ELSE NULL END) AS '第7年流失'
FROM [邦邦量販店].[dbo].[VIP會員流失率]
GROUP BY [加入年度]
ORDER BY 1
GO
