/*7-3-2	��@���~���P�Ʀ�]*/
--exercise1
--1.��Ѳ��~�f���A�HVIP�|������
IF OBJECT_ID (N'[�����q�c��].[dbo].[���~��ѲզX��ƪ�]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[���~��ѲզX��ƪ�];

SELECT	[ProductID],
		[Productname],
		MAX([�զ�����]) [(���P)���~�Ӽ�],
		SUM([���~�զ��ƶq]) [(���P)���~�զ��`�ƶq],
		[���~�q�浧��],
		[���~�q��ƶq],
		MAX([���~�P���`�ƶq]) [(���P)���~�զ��`�P��ƶq]
INTO	[�����q�c��].[dbo].[���~��ѲզX��ƪ�]
FROM (	SELECT	A.[ProductID], 
				B.[Product_Combine1] [�զ��f��],
				B.[Productname],
				COUNT(DISTINCT A.[TransactionID]) [���~�q�浧��],
				SUM(A.[Quantity]) [���~�q��ƶq],
				B.[ProdQuantity_Combine1] [���~�զ��ƶq],
				SUM(A.[Quantity])*B.[ProdQuantity_Combine1] [���~�P���`�ƶq],
				CASE WHEN B.[Product_Combine1] IS NOT NULL THEN 1 ELSE NULL END AS [�զ�����]
		FROM [�����q�c��].[dbo].[VIP_TransDetail]	A
		LEFT JOIN
			 [�����q�c��].[dbo].[Product_Detail]	B
		ON A.[ProductID]=B.[ProductID]
		GROUP BY B.[Product_Combine1],B.[ProdQuantity_Combine1],A.[ProductID],B.[Productname]
			UNION ALL
		SELECT	A.[ProductID],
				B.[Product_Combine2] [�զ��f��],
				B.[Productname],
				COUNT(DISTINCT A.[TransactionID]) [���~�q�浧��],
				SUM(A.[Quantity]) [���~�q��ƶq],
				B.[ProdQuantity_Combine2] [���~�զ��ƶq],
				SUM(A.[Quantity])*B.[ProdQuantity_Combine2] [���~�P���`�ƶq],
				CASE WHEN B.[Product_Combine2] IS NOT NULL THEN 2 ELSE NULL END AS [�զ����O]
		FROM [�����q�c��].[dbo].[VIP_TransDetail]	A
		LEFT JOIN
			 [�����q�c��].[dbo].[Product_Detail]    B
		ON A.[ProductID]=B.[ProductID]
		GROUP BY B.[Product_Combine2],B.[ProdQuantity_Combine2],A.[ProductID],B.[Productname]
			UNION ALL
		SELECT	A.[ProductID], 
				B.[Product_Combine3] [�զ��f��],
				B.[Productname],
				COUNT(DISTINCT A.[TransactionID]) [���~�q�浧��],
				SUM(A.[Quantity]) [���~�q��ƶq],
				B.[ProdQuantity_Combine3] [���~�զ��ƶq],
				SUM(A.[Quantity])*B.[ProdQuantity_Combine3] [���~�P���`�ƶq],
				CASE WHEN B.[Product_Combine3] IS NOT NULL THEN 3 ELSE NULL END AS [�զ����O]
		FROM [�����q�c��].[dbo].[VIP_TransDetail]	A
		LEFT JOIN
			 [�����q�c��].[dbo].[Product_Detail]    B
		ON A.[ProductID]=B.[ProductID]
		GROUP BY B.[Product_Combine3],B.[ProdQuantity_Combine3],A.[ProductID],B.[Productname]
			UNION ALL
		SELECT	A.[ProductID],
				B.[Product_Combine4] [�զ��f��],
				B.[Productname],
				COUNT(DISTINCT A.[TransactionID]) [���~�q�浧��],
				SUM(A.[Quantity]) [���~�q��ƶq],
				B.[ProdQuantity_Combine4] [���~�զ��ƶq],
				SUM(A.[Quantity])*B.[ProdQuantity_Combine4] [���~�P���`�ƶq],
				CASE WHEN B.[Product_Combine4] IS NOT NULL THEN 4 ELSE NULL END AS [�զ����O]
		FROM [�����q�c��].[dbo].[VIP_TransDetail]	A
		LEFT JOIN
			 [�����q�c��].[dbo].[Product_Detail]    B
		ON A.[ProductID]=B.[ProductID]
		GROUP BY B.[Product_Combine4],B.[ProdQuantity_Combine4],A.[ProductID],B.[Productname])AA
WHERE �զ��f�� IS NOT NULL
GROUP BY [ProductID], [Productname], [���~�q�浧��], [���~�q��ƶq]
ORDER BY 1,3
GO

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
