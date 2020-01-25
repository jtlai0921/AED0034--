/*7-2-2	第一次交易時年齡及婚姻狀態*/
--exercise1
--1.第一次交易時年齡及婚姻狀態
IF OBJECT_ID (N'[邦邦量販店].[dbo].[會員交易時的年齡_婚姻狀態]') IS NOT NULL
DROP TABLE [邦邦量販店].[dbo].[會員交易時的年齡_婚姻狀態];

SELECT	A.[MemberID], A.[Birthday],
		DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) [AGE],--第一次交易時年齡
		CASE WHEN DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) BETWEEN 0 AND 10 THEN '10歲以下' 
			 WHEN DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) BETWEEN 11 AND 20 THEN '11-20歲' 
			 WHEN DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) BETWEEN 21 AND 30 THEN '21-30歲' 
			 WHEN DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) BETWEEN 31 AND 40 THEN '31-40歲' 
			 WHEN DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) BETWEEN 41 AND 50 THEN '41-50歲' 
			 WHEN DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) BETWEEN 51 AND 60 THEN '51-60歲' 
			 WHEN DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) BETWEEN 61 AND 70 THEN '61-70歲' 
			 WHEN DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) >=71 THEN '超過70歲' 
			 WHEN DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) NOT BETWEEN 0 AND 107 THEN '其他' 
		ELSE '其他' END AS [AGE_Level],--交易時年齡分層
		A.[Marriage_Status], --交易時婚姻狀態,
		A.[Start_date],
		B.[First_Transdate]
INTO [邦邦量販店].[dbo].[會員交易時的年齡_婚姻狀態]
FROM [邦邦量販店].[dbo].[GMC_Profile_new1]	A
LEFT JOIN
(SELECT [MemberID],
		MIN([Trans_Createdate]) [First_Transdate] --取得第一次交易時間
 FROM [邦邦量販店].[dbo].[GNC_TransDetail]
 GROUP BY [MemberID])						B
ON A.MemberID=B.MemberID
GO

--exercise2
--1.「一般會員」在這段期間曾無購買商品的人數及佔比
SELECT	COUNT([MemberID]) [TTL_Members],--整體會員人數
		COUNT([First_Transdate]) [Buy_Members],--有交易紀錄會員人數
		ROUND(1-(COUNT([First_Transdate])*1.0) / (COUNT([MemberID])*1.0),3) [NoBuy_Percent] --無交易會員比例，取至小數點第3位
FROM [邦邦量販店].[dbo].[會員交易時的年齡_婚姻狀態]
GO

--2.「一般會員」在這段期間第一次交易時的年齡層人數分佈及佔比
SELECT	[AGE_Level],
		( SELECT COUNT([First_Transdate]) 
		  FROM [邦邦量販店].[dbo].[會員交易時的年齡_婚姻狀態] ) [Buy_ttlCNT],--第一次有交易總人數
		COUNT([First_Transdate]) [Buy_CNT], --各年齡層交易總人數
		(COUNT([First_Transdate])*1.0) / 
		(( SELECT COUNT([First_Transdate]) 
		   FROM [邦邦量販店].[dbo].[會員交易時的年齡_婚姻狀態])*1.0) [Buy_Percent]--計算年齡層比例
FROM [邦邦量販店].[dbo].[會員交易時的年齡_婚姻狀態]
GROUP BY [AGE_Level]
ORDER BY 1
GO
