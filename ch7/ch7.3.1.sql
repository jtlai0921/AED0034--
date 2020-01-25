/*7-3-1	產品組合*/
--exercise1
--1.根據交易訂單編號找出前10名的產品
--GMC會員
SELECT	[ProductID],[Productname],
		COUNT(DISTINCT [TransactionID]) [不同訂單出現次數]
FROM [邦邦量販店].[dbo].[GMC_TransDetail]
GROUP BY [ProductID], [Productname]
ORDER BY 3 DESC
GO

--VIP會員
SELECT	[ProductID],[Productname],
		COUNT(DISTINCT [TransactionID]) [不同訂單出現次數]
FROM [邦邦量販店].[dbo].[VIP_TransDetail]
GROUP BY [ProductID], [Productname]
ORDER BY 3 DESC
GO

--2.根據交易訂單編號找出前10名最受會員喜好的產品
--GMC會員
SELECT	[ProductID], [Productname],
		COUNT(DISTINCT [MemberID]) [產品喜好人數]
FROM [邦邦量販店].[dbo].[GMC_TransDetail]
GROUP BY [ProductID], [Productname]
ORDER BY 3 DESC
GO

--VIP會員
SELECT	[ProductID], [Productname],
		COUNT(DISTINCT [MemberID]) [產品喜好人數]
FROM [邦邦量販店].[dbo].[VIP_TransDetail]
GROUP BY [ProductID], [Productname]
ORDER BY 3 DESC
GO

--3.根據交易訂單編號找出前10名銷售數量最好的產品
--GMC會員
SELECT	[ProductID], [Productname],
		SUM([Quantity]) [產品數量]
FROM [邦邦量販店].[dbo].[GMC_TransDetail]
GROUP BY [ProductID], [Productname]
ORDER BY 3 DESC
GO

--VIP會員
SELECT	[ProductID], [Productname],
		SUM([Quantity]) [產品數量]
FROM [邦邦量販店].[dbo].[VIP_TransDetail]
GROUP BY [ProductID], [Productname]
ORDER BY 3 DESC
GO

--4.根據交易訂單編號找出前10名銷售金額最好的產品
--GMC會員
SELECT	[ProductID], [Productname],
		SUM([Quantity]) [產品數量]
FROM [邦邦量販店].[dbo].[GMC_TransDetail]
GROUP BY [ProductID], [Productname]
ORDER BY 3 DESC
GO

--VIP會員
SELECT	[ProductID], [Productname],
		SUM([Quantity]) [產品數量]
FROM [邦邦量販店].[dbo].[VIP_TransDetail]
GROUP BY [ProductID], [Productname]
ORDER BY 3 DESC
GO
