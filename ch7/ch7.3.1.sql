/*7-3-1	���~�զX*/
--exercise1
--1.�ھڥ���q��s����X�e10�W�����~
--GMC�|��
SELECT	[ProductID],[Productname],
		COUNT(DISTINCT [TransactionID]) [���P�q��X�{����]
FROM [�����q�c��].[dbo].[GMC_TransDetail]
GROUP BY [ProductID], [Productname]
ORDER BY 3 DESC
GO

--VIP�|��
SELECT	[ProductID],[Productname],
		COUNT(DISTINCT [TransactionID]) [���P�q��X�{����]
FROM [�����q�c��].[dbo].[VIP_TransDetail]
GROUP BY [ProductID], [Productname]
ORDER BY 3 DESC
GO

--2.�ھڥ���q��s����X�e10�W�̨��|���ߦn�����~
--GMC�|��
SELECT	[ProductID], [Productname],
		COUNT(DISTINCT [MemberID]) [���~�ߦn�H��]
FROM [�����q�c��].[dbo].[GMC_TransDetail]
GROUP BY [ProductID], [Productname]
ORDER BY 3 DESC
GO

--VIP�|��
SELECT	[ProductID], [Productname],
		COUNT(DISTINCT [MemberID]) [���~�ߦn�H��]
FROM [�����q�c��].[dbo].[VIP_TransDetail]
GROUP BY [ProductID], [Productname]
ORDER BY 3 DESC
GO

--3.�ھڥ���q��s����X�e10�W�P��ƶq�̦n�����~
--GMC�|��
SELECT	[ProductID], [Productname],
		SUM([Quantity]) [���~�ƶq]
FROM [�����q�c��].[dbo].[GMC_TransDetail]
GROUP BY [ProductID], [Productname]
ORDER BY 3 DESC
GO

--VIP�|��
SELECT	[ProductID], [Productname],
		SUM([Quantity]) [���~�ƶq]
FROM [�����q�c��].[dbo].[VIP_TransDetail]
GROUP BY [ProductID], [Productname]
ORDER BY 3 DESC
GO

--4.�ھڥ���q��s����X�e10�W�P����B�̦n�����~
--GMC�|��
SELECT	[ProductID], [Productname],
		SUM([Quantity]) [���~�ƶq]
FROM [�����q�c��].[dbo].[GMC_TransDetail]
GROUP BY [ProductID], [Productname]
ORDER BY 3 DESC
GO

--VIP�|��
SELECT	[ProductID], [Productname],
		SUM([Quantity]) [���~�ƶq]
FROM [�����q�c��].[dbo].[VIP_TransDetail]
GROUP BY [ProductID], [Productname]
ORDER BY 3 DESC
GO
