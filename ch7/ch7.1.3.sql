/*7-1-3	�|�����ܶ����R�ЩʧO�B¾�~�B�ӷ��޹D�K*/
--exercise1
--1.�@�����oGMC�MVIP�|�����H�Ʋέp���G
USE [�����q�c��]
GO

SELECT	A.Sex,
		A.[�@��|��], 
		B.[VIP�|��]
FROM(SELECT [Sex],
			COUNT(*) [�@��|��]
	 FROM [dbo].[GMC_Profile_new]
	 GROUP BY [Sex]) A
LEFT JOIN
(	SELECT	[Sex],
			COUNT(*) [VIP�|��]
	FROM [dbo].[VIP_Profile_new]
	GROUP BY [Sex])  B
ON A.[Sex]=B.[Sex]
ORDER BY 1
GO

--2.�@�����oGMC�MVIP�|����¾�~�H�Ʋέp���G
USE [�����q�c��]
GO

SELECT	A.[Occupation],
		A.[�@��|��], 
		B.[VIP�|��]
FROM(SELECT [Occupation],
			COUNT(*) [�@��|��]
	 FROM [dbo].[GMC_Profile_new]
	 GROUP BY [Occupation]) A
LEFT JOIN
(	SELECT	[Occupation],
			COUNT(*) [VIP�|��]
	FROM [dbo].[VIP_Profile_new]
	GROUP BY [Occupation])  B
ON A.[Occupation]=B.[Occupation]
ORDER BY 2 DESC
GO


--3.�@�����oGMC�MVIP�|���������O�H�Ʋέp���G
USE [�����q�c��]
GO

SELECT	A.[COUNTY],
		A.[�@��|��], 
		B.[VIP�|��]
FROM(SELECT [COUNTY],
			COUNT(*) [�@��|��]
	 FROM [dbo].[GMC_Profile_new]
	 GROUP BY [COUNTY]) A
LEFT JOIN
(	SELECT	[COUNTY],
			COUNT(*) [VIP�|��]
	FROM [dbo].[VIP_Profile_new]
	GROUP BY [COUNTY])  B
ON A.[COUNTY]=B.[COUNTY]
ORDER BY 2 DESC
GO


--4.�@�����oGMC�MVIP�|�����J�|�޹D�H�Ʋέp���G
USE [�����q�c��]
GO

SELECT	A.[Channel],
		A.[�@��|��], 
		B.[VIP�|��]
FROM(SELECT [Channel],
			COUNT(*) [�@��|��]
	 FROM [dbo].[GMC_Profile_new]
	 GROUP BY [Channel]) A
LEFT JOIN
(	SELECT	[Channel],
			COUNT(*) [VIP�|��]
	FROM [dbo].[VIP_Profile_new]
	GROUP BY [Channel])  B
ON A.[Channel]=B.[Channel]
ORDER BY 2 DESC
GO

--5.�@�����oGMC�MVIP�|�����B�ê��A�H�Ʋέp���G
USE [�����q�c��]
GO

SELECT	A.[Marriage_Status],
		A.[�@��|��], 
		B.[VIP�|��]
FROM(SELECT [Marriage_Status],
			COUNT(*) [�@��|��]
	 FROM [dbo].[GMC_Profile_new]
	 GROUP BY [Marriage_Status]) A
LEFT JOIN
(	SELECT	[Marriage_Status],
			COUNT(*) [VIP�|��]
	FROM [dbo].[VIP_Profile_new]
	GROUP BY [Marriage_Status])  B
ON A.[Marriage_Status]=B.[Marriage_Status]
ORDER BY 2 DESC
GO
