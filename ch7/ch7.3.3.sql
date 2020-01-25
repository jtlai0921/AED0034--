/*7-3-3	���~�����ʶR��v*/
--exercise1
--1.�إ߷J�`��ƪ�A�HVIP�|������
IF OBJECT_ID (N'[�����q�c��].[dbo].[VIPTEST]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[VIPTEST]

SELECT	A.[MemberID],
		A.[TransactionID],
		A.[Trans_Createdate], 
		A.[ProductID],
		B.[Productname],
		DENSE_RANK() OVER ( PARTITION BY A.[MemberID] ORDER BY
		A.[TransactionID]) [TransactionID_Seq],--�ʶR����
		A.[Quantity],
		A.[Money]
INTO [�����q�c��].[dbo].[VIPTEST]
FROM [�����q�c��].[dbo].[VIP_TransDetail] A
LEFT JOIN
	 [�����q�c��].[dbo].[Product_Detail]  B
ON A.ProductID=B.ProductID

--2.�إ߲��~�����ʶR�H�Ƥ��G��ƪ�A�HVIP�|������
IF OBJECT_ID (N'[�����q�c��].[dbo].[VIP�|��_���~�����ʶR�H�Ƥ��G]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[VIP�|��_���~�����ʶR�H�Ƥ��G]

SELECT	[ProductID],
		[Productname],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=1 THEN [MemberID] ELSE NULL END) [��1���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=2 THEN [MemberID] ELSE NULL END) [��2���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=3 THEN [MemberID] ELSE NULL END) [��3���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=4 THEN [MemberID] ELSE NULL END) [��4���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=5 THEN [MemberID] ELSE NULL END) [��5���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=6 THEN [MemberID] ELSE NULL END) [��6���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=7 THEN [MemberID] ELSE NULL END) [��7���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=8 THEN [MemberID] ELSE NULL END) [��8���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=9 THEN [MemberID] ELSE NULL END) [��9���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=10 THEN [MemberID] ELSE NULL END) [��10���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=11 THEN [MemberID] ELSE NULL END) [��11���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=12 THEN [MemberID] ELSE NULL END) [��12���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=13 THEN [MemberID] ELSE NULL END) [��13���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=14 THEN [MemberID] ELSE NULL END) [��14���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=15 THEN [MemberID] ELSE NULL END) [��15���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=16 THEN [MemberID] ELSE NULL END) [��16���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=17 THEN [MemberID] ELSE NULL END) [��17���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=18 THEN [MemberID] ELSE NULL END) [��18���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=19 THEN [MemberID] ELSE NULL END) [��19���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=20 THEN [MemberID] ELSE NULL END) [��20���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=21 THEN [MemberID] ELSE NULL END) [��21���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=22 THEN [MemberID] ELSE NULL END) [��22���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=23 THEN [MemberID] ELSE NULL END) [��23���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=24 THEN [MemberID] ELSE NULL END) [��24���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=25 THEN [MemberID] ELSE NULL END) [��25���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=26 THEN [MemberID] ELSE NULL END) [��26���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=27 THEN [MemberID] ELSE NULL END) [��27���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=28 THEN [MemberID] ELSE NULL END) [��28���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=29 THEN [MemberID] ELSE NULL END) [��29���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=30 THEN [MemberID] ELSE NULL END) [��30���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=31 THEN [MemberID] ELSE NULL END) [��31���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=32 THEN [MemberID] ELSE NULL END) [��32���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=33 THEN [MemberID] ELSE NULL END) [��33���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=34 THEN [MemberID] ELSE NULL END) [��34���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=35 THEN [MemberID] ELSE NULL END) [��35���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=36 THEN [MemberID] ELSE NULL END) [��36���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=37 THEN [MemberID] ELSE NULL END) [��37���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=38 THEN [MemberID] ELSE NULL END) [��38���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=39 THEN [MemberID] ELSE NULL END) [��39���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=40 THEN [MemberID] ELSE NULL END) [��40���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=41 THEN [MemberID] ELSE NULL END) [��41���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=42 THEN [MemberID] ELSE NULL END) [��42���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=43 THEN [MemberID] ELSE NULL END) [��43���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=44 THEN [MemberID] ELSE NULL END) [��44���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=45 THEN [MemberID] ELSE NULL END) [��45���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=46 THEN [MemberID] ELSE NULL END) [��46���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=47 THEN [MemberID] ELSE NULL END) [��47���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=48 THEN [MemberID] ELSE NULL END) [��48���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=49 THEN [MemberID] ELSE NULL END) [��49���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=50 THEN [MemberID] ELSE NULL END) [��50���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=51 THEN [MemberID] ELSE NULL END) [��51���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=52 THEN [MemberID] ELSE NULL END) [��52���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=53 THEN [MemberID] ELSE NULL END) [��53���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=54 THEN [MemberID] ELSE NULL END) [��54���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=55 THEN [MemberID] ELSE NULL END) [��55���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=56 THEN [MemberID] ELSE NULL END) [��56���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=57 THEN [MemberID] ELSE NULL END) [��57���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=58 THEN [MemberID] ELSE NULL END) [��58���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=59 THEN [MemberID] ELSE NULL END) [��59���ʶR�H��],
		COUNT(DISTINCT CASE WHEN TransactionID_Seq=60 THEN [MemberID] ELSE NULL END) [��60���ʶR�H��]
INTO	[�����q�c��].[dbo].[VIP�|��_���~�����ʶR�H�Ƥ��G]
FROM [�����q�c��].[dbo].[VIPTEST]
GROUP BY [ProductID],[Productname]
ORDER BY 3 DESC,4 DESC
GO


--3.��X�e2�����~�����ʶR��v�e10�W�����~�A�HVIP�|������
SELECT	[ProductID],[Productname],
		[��1���ʶR�H��],
		[��2���ʶR�H��],
		([��2���ʶR�H��]*1.0/[��1���ʶR�H��]*1.0) [���~�ʶR���Ƥ�v]
FROM [�����q�c��].[dbo].[VIP�|��_���~�����ʶR�H�Ƥ��G]
ORDER BY 5 DESC
GO

SELECT * FROM [�����q�c��].[dbo].[VIP�|��_���~�����ʶR�H�Ƥ��G]



--2.��@���~�P���`�ƶq�e10�W�A�HVIP�|������
SELECT * 
FROM [�����q�c��].[dbo].[���~��ѲզX��ƪ�]
WHERE LEFT(ProductID,1)<>'C'
ORDER BY [(���P)���~�զ��`�P��ƶq] DESC
GO

--3.������@���~�P���`�ƶq�e10�W�A�HVIP�|������
SELECT * 
FROM [�����q�c��].[dbo].[���~��ѲզX��ƪ�]
/* WHERE LEFT(ProductID,1)<>'C' */
ORDER BY [(���P)���~�զ��`�P��ƶq] DESC
GO
