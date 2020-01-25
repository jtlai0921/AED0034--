/*6-3-4	�X���p���d������*/
--1.�uINNER JOIN�v
--2�Ӹ�ƪ�INNER JOIN
USE [�����q�c��]
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

--3�Ӹ�ƪ�INNER JOIN
USE [�����q�c��]
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

--2.�uLEFT JOIN�v
--2�Ӹ�ƪ�LEFT JOIN
USE [�����q�c��]
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

--3�Ӹ�ƪ�LEFT JOIN
USE [�����q�c��]
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

--3.�uRIGHT JOIN�v
--2�Ӹ�ƪ�RIGHT JOIN
USE [�����q�c��]
GO

SELECT A.MemberID,
		A.Occupation,
		B.Trans_Createdate,
		B.TransactionID
FROM (	SELECT * 
		FROM [dbo].[GMC_Profile]
		WHERE Occupation IN('�a��','�ʷ��Φ��z�H��','�޳N�ʤH��'))	A
RIGHT JOIN
	[dbo].[GMC_TransDetail]											B
ON	A.MemberID=B.MemberID
GO

--3�Ӹ�ƪ�RIGHT JOIN
USE [�����q�c��]
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

--4.�uCROSS JOIN�v
USE [�����q�c��]
GO

SELECT DISTINCT Occupation,[Productname]
FROM [dbo].[GMC_Profile]
CROSS JOIN
	 [dbo].[Product_Detail]
ORDER BY 1,2
GO
