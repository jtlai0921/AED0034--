/*6-3-4	合併聯結查詢應用*/
--1.「INNER JOIN」
--2個資料表的INNER JOIN
USE [邦邦量販店]
GO

SELECT	A.MemberID,
		A.Occupation,
		B.Trans_Createdate,
		B.TransactionID,
		B.ProductID
FROM [dbo].[VIP_Profile]		A
INNER JOIN
	 [dbo].[VIP_TransDetail]	B
ON	A.MemberID=B.MemberID
WHERE B.Trans_Createdate BETWEEN '2007-01-01' AND '2007-12-31'
ORDER BY 1
GO

--3個資料表的INNER JOIN
USE [邦邦量販店]
GO

SELECT	A.MemberID,
		A.Occupation,
		B.Trans_Createdate,
		B.TransactionID,
		B.ProductID,
		C.Productname,
		B.Quantity,
		C.Price,
		B.Money
FROM [dbo].[VIP_Profile]		A
INNER JOIN
	 [dbo].[VIP_TransDetail]	B
ON	A.MemberID=B.MemberID
INNER JOIN
	 [dbo].[Product_Detail]		C
ON	B.ProductID=C.ProductID
WHERE B.Trans_Createdate BETWEEN '2007-01-01' AND '2007-12-31'
ORDER BY 1
GO

--2.「LEFT JOIN」
--2個資料表的LEFT JOIN
USE [邦邦量販店]
GO

SELECT	A.MemberID,
		A.Occupation,
		B.Trans_Createdate,
		B.TransactionID
FROM [dbo].[GMC_Profile]					A
LEFT JOIN
 (	SELECT * 
	FROM [dbo].[GMC_TransDetail]
	WHERE Trans_Createdate 
	BETWEEN '2007-01-01' AND '2007-06-30')	B
ON	A.MemberID=B.MemberID
GO

--3個資料表的LEFT JOIN
USE [邦邦量販店]
GO
	
SELECT	A.MemberID,
		A.Occupation,
		B.Trans_Createdate,
		B.TransactionID,
		B.ProductID,
		C.Productname,
		B.Quantity,
		C.Price,
		B.Money
FROM [dbo].[GMC_Profile]					A
LEFT JOIN
 (	SELECT * 
	FROM [dbo].[GMC_TransDetail]
	WHERE Trans_Createdate 
	BETWEEN '2007-01-01' AND '2007-06-30')	B
ON	A.MemberID=B.MemberID
LEFT JOIN
	 [dbo].[Product_Detail]					C
ON	B.ProductID=C.ProductID
ORDER BY 1
GO

--3.「RIGHT JOIN」
--2個資料表的RIGHT JOIN
USE [邦邦量販店]
GO

SELECT A.MemberID,
		A.Occupation,
		B.Trans_Createdate,
		B.TransactionID
FROM (	SELECT * 
		FROM [dbo].[GMC_Profile]
		WHERE Occupation IN('家管','監督及佐理人員','技術性人員'))	A
RIGHT JOIN
	[dbo].[GMC_TransDetail]											B
ON	A.MemberID=B.MemberID
GO

--3個資料表的RIGHT JOIN
USE [邦邦量販店]
GO
	
SELECT	A.MemberID,
		A.Occupation,
		B.Trans_Createdate,
		B.TransactionID,
		B.ProductID,
		C.Productname,
		B.Quantity,
		C.Price,
		B.Money
FROM [dbo].[GMC_Profile]					A
RIGHT JOIN
 (	SELECT * 
	FROM [dbo].[GMC_TransDetail]
	WHERE Trans_Createdate 
	BETWEEN '2007-01-01' AND '2007-12-31')	B
ON	A.MemberID=B.MemberID
RIGHT JOIN
	 [dbo].[Product_Detail]					C
ON	B.ProductID=C.ProductID
ORDER BY 1
GO

--4.「CROSS JOIN」
USE [邦邦量販店]
GO

SELECT DISTINCT Occupation,[Productname]
FROM [dbo].[GMC_Profile]
CROSS JOIN
	 [dbo].[Product_Detail]
ORDER BY 1,2
GO
