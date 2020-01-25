/*7-3-2	單一產品熱銷排行榜*/
--exercise1
--1.拆解產品貨號，以VIP會員為例
IF OBJECT_ID (N'[邦邦量販店].[dbo].[產品拆解組合資料表]') IS NOT NULL
DROP TABLE [邦邦量販店].[dbo].[產品拆解組合資料表];

SELECT	[ProductID],
		[Productname],
		MAX([組成順序]) [(不同)產品個數],
		SUM([產品組成數量]) [(不同)產品組成總數量],
		[產品訂單筆數],
		[產品訂單數量],
		MAX([產品銷售總數量]) [(不同)產品組成總銷售數量]
INTO	[邦邦量販店].[dbo].[產品拆解組合資料表]
FROM (	SELECT	A.[ProductID], 
				B.[Product_Combine1] [組成貨號],
				B.[Productname],
				COUNT(DISTINCT A.[TransactionID]) [產品訂單筆數],
				SUM(A.[Quantity]) [產品訂單數量],
				B.[ProdQuantity_Combine1] [產品組成數量],
				SUM(A.[Quantity])*B.[ProdQuantity_Combine1] [產品銷售總數量],
				CASE WHEN B.[Product_Combine1] IS NOT NULL THEN 1 ELSE NULL END AS [組成順序]
		FROM [邦邦量販店].[dbo].[VIP_TransDetail]	A
		LEFT JOIN
			 [邦邦量販店].[dbo].[Product_Detail]	B
		ON A.[ProductID]=B.[ProductID]
		GROUP BY B.[Product_Combine1],B.[ProdQuantity_Combine1],A.[ProductID],B.[Productname]
			UNION ALL
		SELECT	A.[ProductID],
				B.[Product_Combine2] [組成貨號],
				B.[Productname],
				COUNT(DISTINCT A.[TransactionID]) [產品訂單筆數],
				SUM(A.[Quantity]) [產品訂單數量],
				B.[ProdQuantity_Combine2] [產品組成數量],
				SUM(A.[Quantity])*B.[ProdQuantity_Combine2] [產品銷售總數量],
				CASE WHEN B.[Product_Combine2] IS NOT NULL THEN 2 ELSE NULL END AS [組成類別]
		FROM [邦邦量販店].[dbo].[VIP_TransDetail]	A
		LEFT JOIN
			 [邦邦量販店].[dbo].[Product_Detail]    B
		ON A.[ProductID]=B.[ProductID]
		GROUP BY B.[Product_Combine2],B.[ProdQuantity_Combine2],A.[ProductID],B.[Productname]
			UNION ALL
		SELECT	A.[ProductID], 
				B.[Product_Combine3] [組成貨號],
				B.[Productname],
				COUNT(DISTINCT A.[TransactionID]) [產品訂單筆數],
				SUM(A.[Quantity]) [產品訂單數量],
				B.[ProdQuantity_Combine3] [產品組成數量],
				SUM(A.[Quantity])*B.[ProdQuantity_Combine3] [產品銷售總數量],
				CASE WHEN B.[Product_Combine3] IS NOT NULL THEN 3 ELSE NULL END AS [組成類別]
		FROM [邦邦量販店].[dbo].[VIP_TransDetail]	A
		LEFT JOIN
			 [邦邦量販店].[dbo].[Product_Detail]    B
		ON A.[ProductID]=B.[ProductID]
		GROUP BY B.[Product_Combine3],B.[ProdQuantity_Combine3],A.[ProductID],B.[Productname]
			UNION ALL
		SELECT	A.[ProductID],
				B.[Product_Combine4] [組成貨號],
				B.[Productname],
				COUNT(DISTINCT A.[TransactionID]) [產品訂單筆數],
				SUM(A.[Quantity]) [產品訂單數量],
				B.[ProdQuantity_Combine4] [產品組成數量],
				SUM(A.[Quantity])*B.[ProdQuantity_Combine4] [產品銷售總數量],
				CASE WHEN B.[Product_Combine4] IS NOT NULL THEN 4 ELSE NULL END AS [組成類別]
		FROM [邦邦量販店].[dbo].[VIP_TransDetail]	A
		LEFT JOIN
			 [邦邦量販店].[dbo].[Product_Detail]    B
		ON A.[ProductID]=B.[ProductID]
		GROUP BY B.[Product_Combine4],B.[ProdQuantity_Combine4],A.[ProductID],B.[Productname])AA
WHERE 組成貨號 IS NOT NULL
GROUP BY [ProductID], [Productname], [產品訂單筆數], [產品訂單數量]
ORDER BY 1,3
GO

--2.單一產品銷售總數量前10名，以VIP會員為例
SELECT * 
FROM [邦邦量販店].[dbo].[產品拆解組合資料表]
WHERE LEFT(ProductID,1)<>'C'
ORDER BY [(不同)產品組成總銷售數量] DESC
GO

--3.不分單一產品銷售總數量前10名，以VIP會員為例
SELECT * 
FROM [邦邦量販店].[dbo].[產品拆解組合資料表]
/* WHERE LEFT(ProductID,1)<>'C' */
ORDER BY [(不同)產品組成總銷售數量] DESC
GO
