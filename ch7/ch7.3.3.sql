/*7-3-3	產品重複購買比率*/
--exercise1
--1.建立彙總資料表，以VIP會員為例
IF OBJECT_ID (N'[邦邦量販店].[dbo].[VIPTEST]') IS NOT NULL
DROP TABLE [邦邦量販店].[dbo].[VIPTEST]

SELECT	A.[MemberID],
		A.[TransactionID],
		A.[Trans_Createdate], 
		A.[ProductID],
		B.[Productname],
		DENSE_RANK() OVER ( PARTITION BY A.[MemberID] ORDER BY
		A.[TransactionID]) [TransactionID_Seq],--購買次序
		A.[Quantity],
		A.[Money]
INTO [邦邦量販店].[dbo].[VIPTEST]
FROM [邦邦量販店].[dbo].[VIP_TransDetail] A
LEFT JOIN
	 [邦邦量販店].[dbo].[Product_Detail]  B
ON A.ProductID=B.ProductID

--2.建立產品重複購買人數分佈資料表，以VIP會員為例
IF OBJECT_ID (N'[邦邦量販店].[dbo].[VIP會員_產品重複購買人數分佈]') IS NOT NULL
DROP TABLE [邦邦量販店].[dbo].[VIP會員_產品重複購買人數分佈]

SELECT	[ProductID],
		[Productname],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=1 THEN [MemberID] ELSE NULL END) [第1次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=2 THEN [MemberID] ELSE NULL END) [第2次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=3 THEN [MemberID] ELSE NULL END) [第3次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=4 THEN [MemberID] ELSE NULL END) [第4次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=5 THEN [MemberID] ELSE NULL END) [第5次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=6 THEN [MemberID] ELSE NULL END) [第6次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=7 THEN [MemberID] ELSE NULL END) [第7次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=8 THEN [MemberID] ELSE NULL END) [第8次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=9 THEN [MemberID] ELSE NULL END) [第9次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=10 THEN [MemberID] ELSE NULL END) [第10次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=11 THEN [MemberID] ELSE NULL END) [第11次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=12 THEN [MemberID] ELSE NULL END) [第12次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=13 THEN [MemberID] ELSE NULL END) [第13次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=14 THEN [MemberID] ELSE NULL END) [第14次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=15 THEN [MemberID] ELSE NULL END) [第15次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=16 THEN [MemberID] ELSE NULL END) [第16次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=17 THEN [MemberID] ELSE NULL END) [第17次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=18 THEN [MemberID] ELSE NULL END) [第18次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=19 THEN [MemberID] ELSE NULL END) [第19次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=20 THEN [MemberID] ELSE NULL END) [第20次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=21 THEN [MemberID] ELSE NULL END) [第21次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=22 THEN [MemberID] ELSE NULL END) [第22次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=23 THEN [MemberID] ELSE NULL END) [第23次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=24 THEN [MemberID] ELSE NULL END) [第24次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=25 THEN [MemberID] ELSE NULL END) [第25次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=26 THEN [MemberID] ELSE NULL END) [第26次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=27 THEN [MemberID] ELSE NULL END) [第27次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=28 THEN [MemberID] ELSE NULL END) [第28次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=29 THEN [MemberID] ELSE NULL END) [第29次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=30 THEN [MemberID] ELSE NULL END) [第30次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=31 THEN [MemberID] ELSE NULL END) [第31次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=32 THEN [MemberID] ELSE NULL END) [第32次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=33 THEN [MemberID] ELSE NULL END) [第33次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=34 THEN [MemberID] ELSE NULL END) [第34次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=35 THEN [MemberID] ELSE NULL END) [第35次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=36 THEN [MemberID] ELSE NULL END) [第36次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=37 THEN [MemberID] ELSE NULL END) [第37次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=38 THEN [MemberID] ELSE NULL END) [第38次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=39 THEN [MemberID] ELSE NULL END) [第39次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=40 THEN [MemberID] ELSE NULL END) [第40次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=41 THEN [MemberID] ELSE NULL END) [第41次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=42 THEN [MemberID] ELSE NULL END) [第42次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=43 THEN [MemberID] ELSE NULL END) [第43次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=44 THEN [MemberID] ELSE NULL END) [第44次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=45 THEN [MemberID] ELSE NULL END) [第45次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=46 THEN [MemberID] ELSE NULL END) [第46次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=47 THEN [MemberID] ELSE NULL END) [第47次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=48 THEN [MemberID] ELSE NULL END) [第48次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=49 THEN [MemberID] ELSE NULL END) [第49次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=50 THEN [MemberID] ELSE NULL END) [第50次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=51 THEN [MemberID] ELSE NULL END) [第51次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=52 THEN [MemberID] ELSE NULL END) [第52次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=53 THEN [MemberID] ELSE NULL END) [第53次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=54 THEN [MemberID] ELSE NULL END) [第54次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=55 THEN [MemberID] ELSE NULL END) [第55次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=56 THEN [MemberID] ELSE NULL END) [第56次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=57 THEN [MemberID] ELSE NULL END) [第57次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=58 THEN [MemberID] ELSE NULL END) [第58次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=59 THEN [MemberID] ELSE NULL END) [第59次購買人數],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=60 THEN [MemberID] ELSE NULL END) [第60次購買人數]
INTO	[邦邦量販店].[dbo].[VIP會員_產品重複購買人數分佈]
FROM [邦邦量販店].[dbo].[VIPTEST]
GROUP BY [ProductID],[Productname]
ORDER BY 3 DESC,4 DESC
GO


--3.找出前2次產品重複購買比率前10名的產品，以VIP會員為例
SELECT	[ProductID],[Productname],
		[第1次購買人數],
		[第2次購買人數],
		([第2次購買人數]*1.0/[第1次購買人數]*1.0) [產品購買重複比率]
FROM [邦邦量販店].[dbo].[VIP會員_產品重複購買人數分佈]
ORDER BY 5 DESC
GO

SELECT * FROM [邦邦量販店].[dbo].[VIP會員_產品重複購買人數分佈]



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
