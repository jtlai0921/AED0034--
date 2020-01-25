/*7-2-4	縩翴だ猂*/
--exercise1
--VIP穦
--1.穝糤ユ絪腹KEY逆[縩翴羆翴计]籔[縩翴禯]
IF OBJECT_ID (N'[üü秖砪┍].[dbo].[VIP穦縩翴]') IS NOT NULL
DROP TABLE [üü秖砪┍].[dbo].[VIP穦縩翴];

SELECT *
INTO [üü秖砪┍].[dbo].[VIP穦縩翴]
FROM ( SELECT	DISTINCT [TransactionID],
				CASE WHEN SUM([Point])<50 THEN '01_縩翴羆翴计ぃ50'
					 WHEN SUM([Point])>=50 AND SUM([Point])<100		THEN '02_縩翴羆翴计ざ50100(ぃ)'
					 WHEN SUM([Point])>=100 AND SUM([Point])<200	THEN '03_縩翴羆翴计ざ100200(ぃ)'
					 WHEN SUM([Point])>=200 AND SUM([Point])<300	THEN '04_縩翴羆翴计ざ200300(ぃ)'
					 WHEN SUM([Point])>=300 AND SUM([Point])<400	THEN '05_縩翴羆翴计ざ300400(ぃ)'
					 WHEN SUM([Point])>=400 AND SUM([Point])<500	THEN '06_縩翴羆翴计ざ400500(ぃ)'
					 WHEN SUM([Point])>=500 THEN '07_縩翴羆翴计ぶ500'
				ELSE 'ㄤ' END AS [縩翴禯],
				SUM([Point]) [縩翴羆翴计]
FROM [üü秖砪┍].[dbo].[VIP_TransDetail]
GROUP BY [TransactionID])AA
GO

--2.VIP穦縩翴禯だ
SELECT	[縩翴禯],
		COUNT([縩翴禯]) [縩翴CNT],
		ROUND((CAST(COUNT([縩翴禯])AS FLOAT) / (SELECT CAST(COUNT([縩翴禯]) AS FLOAT)  FROM [üü秖砪┍].[dbo].[VIP穦縩翴])),4) AS [Percent] --κだゑ
FROM [üü秖砪┍].[dbo].[VIP穦縩翴]
GROUP BY [縩翴禯]
ORDER BY 1
GO

--exercise2
--GMC穦
--1.穝糤ユ絪腹KEY逆[縩翴羆翴计]籔[縩翴禯]
IF OBJECT_ID (N'[üü秖砪┍].[dbo].[GMC穦縩翴]') IS NOT NULL
DROP TABLE [üü秖砪┍].[dbo].[GMC穦縩翴];

SELECT *
INTO [üü秖砪┍].[dbo].[GMC穦縩翴]
FROM ( SELECT	DISTINCT [TransactionID],
				CASE WHEN SUM([Point])<50 THEN '01_縩翴羆翴计ぃ50'
					 WHEN SUM([Point])>=50 AND SUM([Point])<100		THEN '02_縩翴羆翴计ざ50100(ぃ)'
					 WHEN SUM([Point])>=100 AND SUM([Point])<200	THEN '03_縩翴羆翴计ざ100200(ぃ)'
					 WHEN SUM([Point])>=200 AND SUM([Point])<300	THEN '04_縩翴羆翴计ざ200300(ぃ)'
					 WHEN SUM([Point])>=300 AND SUM([Point])<400	THEN '05_縩翴羆翴计ざ300400(ぃ)'
					 WHEN SUM([Point])>=400 AND SUM([Point])<500	THEN '06_縩翴羆翴计ざ400500(ぃ)'
					 WHEN SUM([Point])>=500 THEN '07_縩翴羆翴计ぶ500'
				ELSE 'ㄤ' END AS [縩翴禯],
				SUM([Point]) [縩翴羆翴计]
FROM [üü秖砪┍].[dbo].[GMC_TransDetail]
GROUP BY [TransactionID])AA
GO

--2.GMC穦縩翴禯だ
SELECT	[縩翴禯],
		COUNT([縩翴禯]) [縩翴CNT],
		ROUND((CAST(COUNT([縩翴禯])AS FLOAT) / (SELECT CAST(COUNT([縩翴禯]) AS FLOAT)  FROM [üü秖砪┍].[dbo].[GMC穦縩翴])),4) AS [Percent] --κだゑ
FROM [üü秖砪┍].[dbo].[GMC穦縩翴]
GROUP BY [縩翴禯]
ORDER BY 1
GO
