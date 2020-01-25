/*7-2-5	平均交易時間間隔*/
--exercise1
--GMC會員
--1.取得會員的總交易次數
IF OBJECT_ID (N'[邦邦量販店].[dbo].[GMC會員順序]') IS NOT NULL
DROP TABLE [邦邦量販店].[dbo].[GMC會員順序];

SELECT	DISTINCT [MemberID],[Trans_Createdate],[TransactionID],
		DENSE_RANK() OVER ( PARTITION BY [MemberID],[Trans_Createdate] ORDER BY [TransactionID]) [取得同一天交易編號順序],
		DENSE_RANK() OVER ( PARTITION BY [MemberID] ORDER BY [TransactionID]) [取得交易編號順序],
		DENSE_RANK() OVER ( PARTITION BY [MemberID] ORDER BY [Trans_Createdate]) [取得交易日期順序]
INTO [邦邦量販店].[dbo].[GMC會員順序]
FROM [邦邦量販店].[dbo].[GMC_TransDetail]
ORDER BY 1,2
GO

--2.以會員編號=’DM033194為例
--排序同一天交易編號
SELECT	* FROM [邦邦量販店].[dbo].[GMC會員順序]
WHERE MemberID='DM033194'
ORDER BY 2,4
GO

--排序交易編號
SELECT	* FROM [邦邦量販店].[dbo].[GMC會員順序]
WHERE MemberID='DM033194'
ORDER BY 5
GO

--排序交易日期
SELECT	* FROM [邦邦量販店].[dbo].[GMC會員順序]
WHERE MemberID='DM033194'
ORDER BY 6
GO

--3.計算每位會員的平均交易間隔時間
IF OBJECT_ID (N'[邦邦量販店].[dbo].[GMC會員平均交易間隔時間]') IS NOT NULL
DROP TABLE [邦邦量販店].[dbo].[GMC會員平均交易間隔時間];

SELECT	[MemberID],
		MAX([Trans_Createdate]) [最近一筆交易日],
		MIN([Trans_Createdate]) [最初一筆交易日],
		DATEDIFF(DAY, MIN([Trans_Createdate]),MAX([Trans_Createdate])) [總間隔天數], --取得總間隔天數
		MAX([取得交易編號順序]) [總交易筆數], --取得總交易次(天)數
		MAX([取得交易日期順序])-1 [總交易間隔天數], --取得總間隔天數
		(DATEDIFF(DAY,MIN([Trans_Createdate]),MAX([Trans_Createdate]))*1.0)/((MAX([取得交易日期順序])-1)*1.0) [平均每次交易間隔時間]
INTO [邦邦量販店].[dbo].[GMC會員平均交易間隔時間]
FROM [邦邦量販店].[dbo].[GMC會員順序]
GROUP BY [MemberID]
HAVING MAX([取得交易日期順序])-1>0 --納入交易次數超過1次的會員，排除除以零錯誤
GO

--4.不同交易次數之下的每位會員的平均交易間隔時間
SELECT	[總交易次數],
		COUNT([MemberID]) [總會員人數],
		SUM([總間隔天數]) [總間隔天數],
		(SUM([總間隔天數])*1.0)/(COUNT([MemberID])*1.0) [每人平均交易間隔時間]
FROM [邦邦量販店].[dbo].[GMC會員平均交易間隔時間]
GROUP BY [總交易次數]
ORDER BY 1
GO
