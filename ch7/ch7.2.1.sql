/*7-2-1	會員基本變項分析－會籍時間長度*/
--exercise1
--1.交易週期變化
--一般會員交易明細
USE [邦邦量販店]
GO

SELECT	RTRIM(LTRIM(CAST(DATEPART(YEAR,[Trans_Createdate]) AS CHAR)))+'年' [交易年],
		DATEPART(MONTH,[Trans_Createdate]) [交易月],
		COUNT(DISTINCT [TransactionID]) [GMC交易筆數]
FROM [dbo].[GMC_TransDetail]
GROUP BY RTRIM(LTRIM(CAST(DATEPART(YEAR,[Trans_Createdate]) AS CHAR)))+'年', DATEPART(MONTH,[Trans_Createdate])
ORDER BY 1,2
GO

--VIP會員交易明細
USE [邦邦量販店]
GO

SELECT	RTRIM(LTRIM(CAST(DATEPART(YEAR,[Trans_Createdate]) AS CHAR)))+'年' [交易年],
		DATEPART(MONTH,[Trans_Createdate]) [交易月],
		COUNT(DISTINCT [TransactionID]) [GMC交易筆數]
FROM [dbo].[VIP_TransDetail]
GROUP BY RTRIM(LTRIM(CAST(DATEPART(YEAR,[Trans_Createdate]) AS CHAR)))+'年', DATEPART(MONTH,[Trans_Createdate])
ORDER BY 1,2
GO 
