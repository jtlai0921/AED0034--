/*7-6 RFM家*/
--exercise1
--1.ノNTILEㄧ计ㄓ级糶膀セRFM家-臮5单だ猭
IF OBJECT_ID (N'[üü秖砪┍].[dbo].[GMC_RFM_Model]') IS NOT NULL
DROP TABLE [üü秖砪┍].[dbo].[GMC_RFM_Model];

SELECT	A.[MemberID],
		A.[Channel],
		ISNULL(B.[程Ωユら禯さ碭ぱ],0) [程Ωユら禯さ碭ぱ], --礚ヴ禣魁跌0
		ISNULL(C.[羆ユΩ计],0) [羆ユΩ计], --礚ヴ禣魁跌0
		ISNULL(D.[羆ユ肂],0) [羆ユ肂], --礚ヴ禣魁跌0
		ISNULL(B.[R_Index],0) [R_Index], --礚ヴ禣魁跌0
		ISNULL(C.[F_Index],0) [F_Index], --礚ヴ禣魁跌0
		ISNULL(D.[M_Index],0) [M_Index], --礚ヴ禣魁跌0
		RTRIM(LTRIM(CAST(ISNULL(B.[R_Index],0) AS CHAR)))+','+RTRIM(LTRIM(CAST(ISNULL(C.[F_Index],0) AS CHAR)))+','+RTRIM(LTRIM(CAST(ISNULL(D.[M_Index],0) AS CHAR))) [RFM_Seg], --RFMだ竤夹乓,弄︽秸俱3夹抖
		ISNULL(B.[R_Index],0)+ISNULL(C.[F_Index],0)+ISNULL(D.[M_Index],0) [RFM_Score] --RFM家だ计, 弄︽秸俱3夹舦计
INTO [üü秖砪┍].[dbo].[GMC_RFM_Model]
FROM [üü秖砪┍].[dbo].[GMC_Profile_new1]	A
LEFT JOIN
/*璸衡R夹臮戳禣ら戳Recency*/
(SELECT [MemberID],
		[程Ωユら禯さ碭ぱ],
		NTILE(5) OVER ( ORDER BY [程Ωユら禯さ碭ぱ] DESC) [R_Index]--R夹
 FROM ( SELECT	[MemberID],
				DATEDIFF(DAY,MAX([Trans_Createdate]),'2007-05-31') [程Ωユら禯さ碭ぱ] --安砞讽さぱ2007/5/31璸衡R夹ぇノ
		FROM [üü秖砪┍].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID])AA)				B
ON A.[MemberID]=B.[MemberID]
LEFT JOIN
/*璸衡F夹F禣Ω计┪繵瞯Frequence*/
(SELECT [MemberID],
		[羆ユΩ计],
		NTILE(5) OVER ( ORDER BY [羆ユΩ计] ASC) [F_Index] --F夹
 FROM ( SELECT	[MemberID],
				COUNT(DISTINCT [TransactionID]) [羆ユΩ计] --璸衡F夹ぇノ
		FROM [üü秖砪┍].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID])AA)				C
ON A.[MemberID]=C.[MemberID]
LEFT JOIN
/*璸衡M夹潦禦肂Monetary*/
(SELECT [MemberID],
		[羆ユ肂],
		NTILE(5) OVER ( ORDER BY [羆ユ肂] ASC) [M_Index] --M夹
 FROM ( SELECT	[MemberID],
				SUM([Money]) [羆ユ肂] --璸衡M夹ぇノ
		FROM [üü秖砪┍].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID])AA)				D
ON A.[MemberID]=D.[MemberID]
GO

--2.琩高RFM竤计挡狦だ
--R夹竤计
SELECT	[R_Index],
		COUNT(*) [竤计]
FROM [üü秖砪┍].[dbo].[GMC_RFM_Model]
GROUP BY [R_Index]
ORDER BY 1
GO

--F夹竤计
SELECT	[F_Index],
		COUNT(*) [竤计]
FROM [üü秖砪┍].[dbo].[GMC_RFM_Model]
GROUP BY [F_Index]
ORDER BY 1
GO

--M夹竤计
SELECT	[M_Index],
		COUNT(*) [竤计]
FROM [üü秖砪┍].[dbo].[GMC_RFM_Model]
GROUP BY [M_Index]
ORDER BY 1
GO

--3.琩高[RFM_Score]竤疭紉
SELECT	[RFM_Score],
		COUNT(*) [竤计],
		AVG([程Ωユら禯さ碭ぱ]*1.0) [キАユ禯さぱ计],
		MAX([程Ωユら禯さ碭ぱ]) [程ユ禯さぱ计],
		MIN([程Ωユら禯さ碭ぱ]) [程ユ禯さぱ计],
		STDEV([程Ωユら禯さ碭ぱ]*1.0) [程Ωユら禯さ碭ぱ_竤ず夹非畉],
		AVG([羆ユΩ计]*1.0) [キАユユΩ计],
		MAX([羆ユΩ计]) [程ユΩ计],
		MIN([羆ユΩ计]) [程ぶユΩ计],
		STDEV([羆ユΩ计]*1.0) [羆ユΩ计_竤ず夹非畉],
		AVG([羆ユ肂]*1.0) [キАユユ肂],
		MAX([羆ユ肂]) [程ユ肂],
		MIN([羆ユ肂]) [程ぶユ肂],
		STDEV([羆ユ肂]*1.0) [羆ユ肂_竤ず夹非畉]
FROM [üü秖砪┍].[dbo].[GMC_RFM_Model]
GROUP BY [RFM_Score]
ORDER BY 1
GO

--4.琩高[RFM_Seg]竤疭紉
SELECT	[RFM_Seg],
		COUNT(*) [竤计],
		AVG([程Ωユら禯さ碭ぱ]*1.0) [キАユ禯さぱ计],
		MAX([程Ωユら禯さ碭ぱ]) [程ユ禯さぱ计],
		MIN([程Ωユら禯さ碭ぱ]) [程ユ禯さぱ计],
		STDEV([程Ωユら禯さ碭ぱ]*1.0) [程Ωユら禯さ碭ぱ_竤ず夹非畉],
		AVG([羆ユΩ计]*1.0) [キАユユΩ计],
		MAX([羆ユΩ计]) [程ユΩ计],
		MIN([羆ユΩ计]) [程ぶユΩ计],
		STDEV([羆ユΩ计]*1.0) [羆ユΩ计_竤ず夹非畉],
		AVG([羆ユ肂]*1.0) [キАユユ肂],
		MAX([羆ユ肂]) [程ユ肂],
		MIN([羆ユ肂]) [程ぶユ肂],
		STDEV([羆ユ肂]*1.0) [羆ユ肂_竤ず夹非畉]
FROM [üü秖砪┍].[dbo].[GMC_RFM_Model]
GROUP BY [RFM_Seg]
ORDER BY 1
GO
