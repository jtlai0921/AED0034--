/*7-1-3	穦膀セ跑兜だ猂⌒┦戮穨ㄓ方恨笵*/
--exercise1
--1.Ω眔GMC㎝VIP穦计参璸だ
USE [üü秖砪┍]
GO

SELECT	A.Sex,
		A.[穦], 
		B.[VIP穦]
FROM(SELECT [Sex],
			COUNT(*) [穦]
	 FROM [dbo].[GMC_Profile_new]
	 GROUP BY [Sex]) A
LEFT JOIN
(	SELECT	[Sex],
			COUNT(*) [VIP穦]
	FROM [dbo].[VIP_Profile_new]
	GROUP BY [Sex])  B
ON A.[Sex]=B.[Sex]
ORDER BY 1
GO

--2.Ω眔GMC㎝VIP穦戮穨计参璸だ
USE [üü秖砪┍]
GO

SELECT	A.[Occupation],
		A.[穦], 
		B.[VIP穦]
FROM(SELECT [Occupation],
			COUNT(*) [穦]
	 FROM [dbo].[GMC_Profile_new]
	 GROUP BY [Occupation]) A
LEFT JOIN
(	SELECT	[Occupation],
			COUNT(*) [VIP穦]
	FROM [dbo].[VIP_Profile_new]
	GROUP BY [Occupation])  B
ON A.[Occupation]=B.[Occupation]
ORDER BY 2 DESC
GO


--3.Ω眔GMC㎝VIP穦郡カ计参璸だ
USE [üü秖砪┍]
GO

SELECT	A.[COUNTY],
		A.[穦], 
		B.[VIP穦]
FROM(SELECT [COUNTY],
			COUNT(*) [穦]
	 FROM [dbo].[GMC_Profile_new]
	 GROUP BY [COUNTY]) A
LEFT JOIN
(	SELECT	[COUNTY],
			COUNT(*) [VIP穦]
	FROM [dbo].[VIP_Profile_new]
	GROUP BY [COUNTY])  B
ON A.[COUNTY]=B.[COUNTY]
ORDER BY 2 DESC
GO


--4.Ω眔GMC㎝VIP穦穦恨笵计参璸だ
USE [üü秖砪┍]
GO

SELECT	A.[Channel],
		A.[穦], 
		B.[VIP穦]
FROM(SELECT [Channel],
			COUNT(*) [穦]
	 FROM [dbo].[GMC_Profile_new]
	 GROUP BY [Channel]) A
LEFT JOIN
(	SELECT	[Channel],
			COUNT(*) [VIP穦]
	FROM [dbo].[VIP_Profile_new]
	GROUP BY [Channel])  B
ON A.[Channel]=B.[Channel]
ORDER BY 2 DESC
GO

--5.Ω眔GMC㎝VIP穦盉篈计参璸だ
USE [üü秖砪┍]
GO

SELECT	A.[Marriage_Status],
		A.[穦], 
		B.[VIP穦]
FROM(SELECT [Marriage_Status],
			COUNT(*) [穦]
	 FROM [dbo].[GMC_Profile_new]
	 GROUP BY [Marriage_Status]) A
LEFT JOIN
(	SELECT	[Marriage_Status],
			COUNT(*) [VIP穦]
	FROM [dbo].[VIP_Profile_new]
	GROUP BY [Marriage_Status])  B
ON A.[Marriage_Status]=B.[Marriage_Status]
ORDER BY 2 DESC
GO
