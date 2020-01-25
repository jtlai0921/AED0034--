/*7-5 會員貢獻度*/
--exercise1
--1.計算會員年度消費金額，彙整交易明細資料表
IF OBJECT_ID (N'[邦邦量販店].[dbo].[VIP會員貢獻度]') IS NOT NULL
DROP TABLE [邦邦量販店].[dbo].[VIP會員貢獻度];

SELECT	A.[MemberID],
		B.[TransactionID], 
		A.[Create_date],
		A.[End_date],
		B.[Money],
		B.[Trans_Createdate], 
		CASE WHEN A.[Create_date]>='2004-01-01' AND A.[Create_date]<'2005-01-01' THEN '2004'
			 WHEN A.[Create_date]>='2005-01-01' AND A.[Create_date]<'2006-01-01' THEN '2005'
			 WHEN A.[Create_date]>='2006-01-01' AND A.[Create_date]<'2007-01-01' THEN '2006'
			 WHEN A.[Create_date]>='2007-01-01' AND A.[Create_date]<'2008-01-01' THEN '2007'
		ELSE NULL END AS [加入年度],
		CASE WHEN DATEDIFF(DAY,A.[Create_date],B.[Trans_Createdate])<=365 THEN '第1年消費' 
			 WHEN DATEDIFF(DAY,A.[Create_date],B.[Trans_Createdate])>365 AND DATEDIFF(DAY,A.[Create_date],B.[Trans_Createdate])<=730  THEN '第2年消費'
			 WHEN DATEDIFF(DAY,A.[Create_date],B.[Trans_Createdate])>730 AND DATEDIFF(DAY,A.[Create_date],B.[Trans_Createdate])<=1095 THEN '第3年消費'
			 WHEN DATEDIFF(DAY,A.[Create_date],B.[Trans_Createdate])>1095 THEN '第4年消費'
		ELSE NULL END AS [購買年度]
INTO [邦邦量販店].[dbo].[VIP會員貢獻度]
FROM [邦邦量販店].[dbo].[VIP_Profile_new1]	A
LEFT JOIN
	 [邦邦量販店].[dbo].[VIP_TransDetail]	B
ON A.MemberID=B.MemberID
WHERE B.MemberID IS NOT NULL --排除沒有交易的會員
AND DATEDIFF(DAY,A.[Create_date],B.[Trans_Createdate])>0 --辨識成為VIP後且有交易行為
GO

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

--3.查詢各年度加入VIP會員與消費年度分佈情形
SELECT	[加入年度],
		SUM(CASE WHEN [購買年度]='第1年消費' THEN [Money] ELSE 0 END) AS '第1年消費',
		SUM(CASE WHEN [購買年度]='第2年消費' THEN [Money] ELSE 0 END) AS '第2年消費',
		SUM(CASE WHEN [購買年度]='第3年消費' THEN [Money] ELSE 0 END) AS '第3年消費',
		SUM(CASE WHEN [購買年度]='第4年消費' THEN [Money] ELSE 0 END) AS '第4年消費'
FROM [邦邦量販店].[dbo].[VIP會員貢獻度]
GROUP BY [加入年度]
ORDER BY 1
GO

