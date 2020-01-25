/*6-3-5	子查詢的運用*/
--1.「接在SELETCT後面使用」
--使用子查詢傳回對應單一數值，搭配聯結查詢
USE [邦邦量販店]
GO

SELECT	A.MemberID,
		A.Birthday,
		A.Occupation,
		A.Channel,
		(SELECT COUNT(DISTINCT TransactionID) 
		 FROM [dbo].[VIP_TransDetail]	B
		 WHERE A.MemberID=B.MemberID) [訂單筆數]
FROM [dbo].[VIP_Profile]		A
ORDER BY 1
GO

--使用子查詢傳回對應單一數值，搭配彙總函數找出價格差異
USE [邦邦量販店]
GO

SELECT	ProductID,
		Productname,
		Price,
		(SELECT AVG(Price) FROM [dbo].[Product_Detail]
		 WHERE ProductID NOT LIKE'%C%') [平均價格],
		(SELECT AVG(Price) FROM [dbo].[Product_Detail]
		 WHERE ProductID NOT LIKE'%C%') - Price [價格差異]
FROM [dbo].[Product_Detail]
WHERE ProductID NOT LIKE'%C%'
ORDER BY 1
GO

--2.「接在FROM後面使用」
--使用子查詢，搭配彙總函數找出符合條件資料集
USE [邦邦量販店]
GO

SELECT AA.*
FROM 
(SELECT MemberID,COUNT(DISTINCT TransactionID) [訂單筆數]
 FROM [dbo].[VIP_TransDetail]
 GROUP BY MemberID)	AA
WHERE AA.訂單筆數>=30
ORDER BY 2 DESC
GO

--使用子查詢，搭配聯結查詢找出符合條件資料集
USE [邦邦量販店]
GO

SELECT	A.MemberID,
		A.Birthday,
		A.Occupation,
		A.Channel,
		B.[訂單筆數]
FROM [dbo].[VIP_Profile]A
INNER JOIN
(SELECT MemberID,
		COUNT(DISTINCT TransactionID) [訂單筆數]
 FROM [dbo].[VIP_TransDetail]
 GROUP BY MemberID)		B
ON	A.MemberID=B.MemberID
WHERE B.[訂單筆數]>=30
ORDER BY 1
GO

--3.「接在WHERE條件後面使用」
--(1)搭配IN或NOT IN
USE [邦邦量販店]
GO

SELECT	MemberID,
		Sex,
		Occupation,
		Location,
		Channel
FROM [dbo].[GMC_Profile]
WHERE MemberID IN(
 SELECT MemberID
 FROM [dbo].[GMC_TransDetail]
 GROUP BY MemberID
 HAVING COUNT(DISTINCT TransactionID)>=10--訂單筆數超過10筆
 )

--(2)搭配運算子（EX.大於、小於或等於）
USE [邦邦量販店]
GO

SELECT	MemberID,
		[消費總額]
FROM(	SELECT	MemberID,
				SUM(Money) [消費總額]
		FROM [dbo].[VIP_TransDetail]
		WHERE (Trans_Createdate BETWEEN '2006-01-01' AND '2006-12-31')
		GROUP BY  MemberID)AA
WHERE [消費總額]<=(	SELECT AVG(Money) FROM [dbo].[VIP_TransDetail] 
					WHERE Trans_Createdate BETWEEN '2006-01-01' AND '2006-12-31')
ORDER BY 2 DESC

--(3)搭配關聯（JOIN）
SELECT	ProductID,
		Productname,
		Price
FROM [dbo].[Product_Detail] A
WHERE Price=
(SELECT MAX(Price) FROM [dbo].[Product_Detail] B
 WHERE A.Price=B.Price)
GO

 --4.「接在EXISTS和NOT EXISTS後面使用」
--EXISTS應用, 找出2007年之後有消費的人
SELECT	MemberID,
		Birthday,
		Occupation,
		Location 
FROM [dbo].[GMC_Profile]	A
WHERE EXISTS
(SELECT * FROM [dbo].[GMC_TransDetail] B
 WHERE A.MemberID=B.MemberID
 AND B.Trans_Createdate>='2007-01-01')
ORDER BY 1
GO
