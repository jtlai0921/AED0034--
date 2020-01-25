/*7-2-3	交易金額級距分析*/
--exercise1
--1.VIP會員交易金額級距分析
SELECT	[YEAR],[TTL_MoneyLevel],
		COUNT(MemberID) [Trans_people], --交易人數
		SUM([Trans_CNT]) [Trans_CNT] --交易筆數
FROM ( SELECT [MemberID], [YEAR], [Trans_CNT], [TTL_Money], 
			  CASE WHEN [TTL_Money]<500 THEN '01_交易金額不到$500' 
				   WHEN [TTL_Money]>=500 AND [TTL_Money]<1000 THEN '02_交易金額介於$500至$1000(不含)'
				   WHEN [TTL_Money]>=1000 AND [TTL_Money]<2000 THEN '03_交易金額介於$1000至$2000(不含)'
				   WHEN [TTL_Money]>=2000 AND [TTL_Money]<3000 THEN '04_交易金額介於$2000至$3000(不含)'
				   WHEN [TTL_Money]>=3000 AND [TTL_Money]<4000 THEN '05_交易金額介於$3000至$4000(不含)'
				   WHEN [TTL_Money]>=4000 AND [TTL_Money]<5000 THEN '06_交易金額介於$4000至$5000(不含)'
				   WHEN [TTL_Money]>=5000 AND [TTL_Money]<10000 THEN '07_交易金額介於$5000至$10000(不含)'
				   WHEN [TTL_Money]>=10000 THEN '08_交易金額至少$10000'
			  ELSE '其他' END [TTL_MoneyLevel]
	   FROM (SELECT	[MemberID],
					RTRIM(LTRIM(CAST(DATEPART(YEAR,[Trans_Createdate]) AS CHAR)))+'年' [YEAR], --年度
					COUNT(DISTINCT [TransactionID]) [Trans_CNT],--交易總筆數
					SUM([Money])[TTL_Money] --交易總金額
			 FROM [邦邦量販店].[dbo].[VIP_TransDetail]
			 GROUP BY [MemberID],RTRIM(LTRIM(CAST(DATEPART(YEAR,[Trans_Createdate]) AS CHAR)))+'年')AA)BB
GROUP BY [YEAR],[TTL_MoneyLevel]
ORDER BY 1,2
GO

