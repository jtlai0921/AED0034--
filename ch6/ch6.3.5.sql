/*6-3-5	�l�d�ߪ��B��*/
--1.�u���bSELETCT�᭱�ϥΡv
--�ϥΤl�d�߶Ǧ^������@�ƭȡA�f�t�p���d��
USE [�����q�c��]
GO

SELECT	A.MemberID,
		A.Birthday,
		A.Occupation,
		A.Channel,
		(SELECT COUNT(DISTINCT TransactionID) 
		 FROM [dbo].[VIP_TransDetail]	B
		 WHERE A.MemberID=B.MemberID) [�q�浧��]
FROM [dbo].[VIP_Profile]		A
ORDER BY 1
GO

--�ϥΤl�d�߶Ǧ^������@�ƭȡA�f�t�J�`��Ƨ�X����t��
USE [�����q�c��]
GO

SELECT	ProductID,
		Productname,
		Price,
		(SELECT AVG(Price) FROM [dbo].[Product_Detail]
		 WHERE ProductID NOT LIKE'%C%') [��������],
		(SELECT AVG(Price) FROM [dbo].[Product_Detail]
		 WHERE ProductID NOT LIKE'%C%') - Price [����t��]
FROM [dbo].[Product_Detail]
WHERE ProductID NOT LIKE'%C%'
ORDER BY 1
GO

--2.�u���bFROM�᭱�ϥΡv
--�ϥΤl�d�ߡA�f�t�J�`��Ƨ�X�ŦX�����ƶ�
USE [�����q�c��]
GO

SELECT AA.*
FROM 
(SELECT MemberID,COUNT(DISTINCT TransactionID) [�q�浧��]
 FROM [dbo].[VIP_TransDetail]
 GROUP BY MemberID)	AA
WHERE AA.�q�浧��>=30
ORDER BY 2 DESC
GO

--�ϥΤl�d�ߡA�f�t�p���d�ߧ�X�ŦX�����ƶ�
USE [�����q�c��]
GO

SELECT	A.MemberID,
		A.Birthday,
		A.Occupation,
		A.Channel,
		B.[�q�浧��]
FROM [dbo].[VIP_Profile]A
INNER JOIN
(SELECT MemberID,
		COUNT(DISTINCT TransactionID) [�q�浧��]
 FROM [dbo].[VIP_TransDetail]
 GROUP BY MemberID)		B
ON	A.MemberID=B.MemberID
WHERE B.[�q�浧��]>=30
ORDER BY 1
GO

--3.�u���bWHERE����᭱�ϥΡv
--(1)�f�tIN��NOT IN
USE [�����q�c��]
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
 HAVING COUNT(DISTINCT TransactionID)>=10--�q�浧�ƶW�L10��
 )

--(2)�f�t�B��l�]EX.�j��B�p��ε���^
USE [�����q�c��]
GO

SELECT	MemberID,
		[���O�`�B]
FROM(	SELECT	MemberID,
				SUM(Money) [���O�`�B]
		FROM [dbo].[VIP_TransDetail]
		WHERE (Trans_Createdate BETWEEN '2006-01-01' AND '2006-12-31')
		GROUP BY  MemberID)AA
WHERE [���O�`�B]<=(	SELECT AVG(Money) FROM [dbo].[VIP_TransDetail] 
					WHERE Trans_Createdate BETWEEN '2006-01-01' AND '2006-12-31')
ORDER BY 2 DESC

--(3)�f�t���p�]JOIN�^
SELECT	ProductID,
		Productname,
		Price
FROM [dbo].[Product_Detail] A
WHERE Price=
(SELECT MAX(Price) FROM [dbo].[Product_Detail] B
 WHERE A.Price=B.Price)
GO

 --4.�u���bEXISTS�MNOT EXISTS�᭱�ϥΡv
--EXISTS����, ��X2007�~���ᦳ���O���H
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
