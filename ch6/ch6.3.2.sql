/*6-3-2	函數應用*/
/*一、字串函數*/
--1.「LOWER()和UPPER()－大小寫轉換」
SELECT	TOP 100 [MemberID],
		[Channel],
		LOWER([Channel]) [轉大寫],
		UPPER([Channel]) [轉小寫]
FROM [邦邦量販店].[dbo].[GMC_Profile]
GO

--2.「RIGHT和LEFT－針對指定資料行或字串，從右邊或左邊擷取指定字數的字串」
SELECT	TOP 100 [MemberID],
		[Location],
		LEFT([Location],3) [取左邊部分字串],
		RIGHT([Location],3) [取右邊部分字串]
FROM [邦邦量販店].[dbo].[GMC_Profile]
GO

--3.「LEN－計算字元數；DATALENGTH－計算位元組數」
SELECT	[MemberID],
		[Location],
		LEN([Location]) [字元數],--1個字等於1個字元
		DATALENGTH([Location]) [位元組數],--1個字等於2個字元
		DATALENGTH([Location]+' ') [加上空格的位元組數]--1個空格等於2個字元
FROM [邦邦量販店].[dbo].[GMC_Profile]
GO

--4.「RTRIM和LTRIM－針對指定資料行或字串，從右邊或左邊移除空白字元」
SELECT	[MemberID],
		[Occupation],
		'    '+[Occupation]+'   ' [左右加上空白字元],
		LTRIM('    '+[Occupation]+'    ') [移除左邊空白字元],
		RTRIM('    '+[Occupation]+'    ') [移除右邊空白字元],
		RTRIM(LTRIM('    '+[Occupation]+'   ')) [移除左右邊空白字元]
FROM [邦邦量販店].[dbo].[GMC_Profile]
GO

--5.「SUBSTRING－針對指定字串，從開始位置找出需要的字串」
SELECT	[MemberID],
		[Location],
		LEN([Location]) [計算字元數],
		SUBSTRING([Location],1,3) [取前3個字串長度],
		SUBSTRING([Location],4,6) [取後3個字串長度]
FROM [邦邦量販店].[dbo].[GMC_Profile]
GO

--6.「REPLACE－取代字串功能，從資料欄位或字串中，針對更換字串進行置換」
SELECT	[MemberID],
		REPLACE([MemberID],'DM','BEN') [NEW_MemberID_1],--字串取代字串形勢
		REPLACE([MemberID],'DM',1) [NEW_MemberID_2],--字串取代數字形勢
		REPLACE([Marriage],1,4) [NEW_Marriage_1],--數字取代數字形勢
		REPLACE([Marriage],1,'未婚') [NEW_Marriage_2]--數字取代字串形勢
FROM [邦邦量販店].[dbo].[GMC_Profile]
GO

/*二、時間函數*/

--1.「一次比較SYSDATETIME(), SYSUTCDATETIME(), SYSDATETIMEOFFSET() 的差異」
SELECT	SYSDATETIME() [現在時間],
		SYSUTCDATETIME() [現在國際標準時間],
		SYSDATETIMEOFFSET() [現在時間與時區]
GO

--2.「SWITCHOFFSET()－計算不同時區的現在時間」
SELECT	SWITCHOFFSET(SYSDATETIMEOFFSET(), '-07:00') [加州當地時間],
		SWITCHOFFSET(SYSDATETIMEOFFSET(), '+08:00') [台灣當地時間]
		/*加州和台灣相差15個小時*/
GO

--3.「一次比較CURRENT_TIMESTAMP, GETDATE(), GETUTCDATE() － 請瞭解彼此之間差異，作業系統所在+8時區和國際標準時間時區差異」
SELECT	CURRENT_TIMESTAMP [目前日期和時間],
		GETDATE() [目前日期和時間],
		GETUTCDATE() [國際標準日期和時間]
GO

--4.「DATEADD－可支援TIME, DATE, SMALLDATETIME, DATETIME, DATETIME2或DATETIMEOFFSET的運算」
SELECT	DATEADD(DD,12,'2017-01-01') [增加12天數],
		DATEADD(MM,12,'2017-01-01') [增加12個月],
		DATEADD(YY,12,'2017-01-01') [增加12個年]
GO

--5.「DATEDIFF－計算兩個日期時間的差，結果可為天數、月數和年數」
SELECT	DATEDIFF(DAY,'2016-01-01','2017-01-01') [兩個日期天數差],
		DATEDIFF(MONTH,'2016-01-01','2017-01-01') [兩個日期月數差],
		DATEDIFF(YEAR,'2016-01-01','2017-01-01') [兩個日期年數差]
GO

--6.「DATEPART與DATENAME－兩者都是回傳指定日期，主要差異為前者是數字，後者是文字；指定部份可為星期、日、月、季、年等」
SELECT	DATEPART(DW,'2017-01-08') [星期幾_數字],--星期日(數字1)開始，星期六(數字7)結束
		DATENAME(DW,'2017-01-08') [星期幾_文字]
GO

--7.「YEAR, MONTH ,DAY的應用－等同於DATEPART」
SELECT	YEAR('2017-01-08') [年],
		MONTH('2017-01-08') [月],
		DAY('2017-01-08') [日]
GO

/*四、轉換函數*/
--1.「CONVERT－類似於CAST」
SELECT CONVERT(VARCHAR(12), GETDATE(),100)
SELECT CONVERT(VARCHAR(12), GETDATE(),101)
SELECT CONVERT(VARCHAR(12), GETDATE(),102)
SELECT CONVERT(VARCHAR(12), GETDATE(),103)
SELECT CONVERT(VARCHAR(12), GETDATE(),104)
SELECT CONVERT(VARCHAR(12), GETDATE(),105)
SELECT CONVERT(VARCHAR(12), GETDATE(),106)
SELECT CONVERT(VARCHAR(12), GETDATE(),107)
SELECT CONVERT(VARCHAR(12), GETDATE(),108)
SELECT CONVERT(VARCHAR(12), GETDATE(),109)
SELECT CONVERT(VARCHAR(12), GETDATE(),110)
SELECT CONVERT(VARCHAR(12), GETDATE(),111)
SELECT CONVERT(VARCHAR(12), GETDATE(),112)
SELECT CONVERT(VARCHAR(12), GETDATE(),113) 
SELECT CONVERT(VARCHAR(12), GETDATE(),114)
SELECT CONVERT(VARCHAR(12), GETDATE(),121)

--2.「CAST－類似於CONVERT」
SELECT	[MemberID],
		CAST([MemberID] AS CHAR(5)) [MemberID_CHAR(5)_TYPE],--截斷
		CAST([MemberID] AS VARBINARY(MAX)) [MemberID_VARBINARY(MAX)_TYPE]
FROM [邦邦量販店].[dbo].[GMC_Profile]
GO

/*五、認識次序函數*/
--1.「ROW_NUMBER」
SELECT	[MemberID],
		[TTL_Price],
		ROW_NUMBER() OVER(ORDER BY [TTL_Price]) AS TTL_Price_Rank
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--所花的錢
		FROM [邦邦量販店].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID])AA
ORDER BY 3

--2.「RANK」
SELECT	[MemberID],
		[TTL_Price],
		RANK() OVER(ORDER BY [TTL_Price]) AS TTL_Price_Rank
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--所花的錢
		FROM [邦邦量販店].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID])AA
ORDER BY 3

--3.「DENSE_RANK」
SELECT	[MemberID],
		[TTL_Price],
		DENSE_RANK() OVER(ORDER BY [TTL_Price]) AS TTL_Price_Rank
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--所花的錢
		FROM [邦邦量販店].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID])AA
ORDER BY 3

--4.「NTILE」
SELECT	[MemberID],
		[TTL_Price],
		NTILE(5) OVER(ORDER BY [TTL_Price]) AS TTL_Price_NTILE--分5組
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--所花的錢
		FROM [邦邦量販店].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID])AA
WHERE TTL_Price>=150000
ORDER BY 3

--5.「一次比較排序函數」
SELECT	[TTL_Price],
		ROW_NUMBER() OVER(ORDER BY [TTL_Price]) AS TTL_Price_ROW_NUMBER,
		RANK() OVER(ORDER BY [TTL_Price]) AS TTL_Price_RANK,
		DENSE_RANK() OVER(ORDER BY [TTL_Price]) AS TTL_Price_DENSE_RANK,
		NTILE(30) OVER(ORDER BY [TTL_Price]) AS TTL_Price_NTILE
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--所花的錢
		FROM [邦邦量販店].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID])AA
WHERE TTL_Price BETWEEN 60000 AND 80000
ORDER BY 1

/*六、排序函數加上PARTITION BY引數*/
--1.「ROW_NUMBER( ) + PARTITION BY」
SELECT	[MemberID],
		[Productname],
		ROW_NUMBER() OVER(PARTITION BY [MemberID] ORDER BY [Productname]) AS Product_Seq,--每個人購買幾種產品(序號)
		[TTL_Price]
FROM (	SELECT	[MemberID],
				[Productname],
				SUM([Money]) [TTL_Price]--所花的錢
		FROM [邦邦量販店].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID],[Productname])AA
ORDER BY 1,3

--2.「RANK( ) + PARTITION BY」
SELECT	[MemberID],
		[Productname],
		[TTL_Price],
		RANK() OVER(PARTITION BY [MemberID] ORDER BY [TTL_Price] DESC) AS Price_Rank --每個人花費(排名)
FROM (	SELECT	[MemberID],
				[Productname],
				SUM([Money]) [TTL_Price]--所花的錢
		FROM [邦邦量販店].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID],[Productname])AA
ORDER BY 1,4

--3.「DENSE_RANK( ) + PARTITION BY」
SELECT	[MemberID],
		[Productname],
		[TTL_Price],
		DENSE_RANK() OVER(PARTITION BY [MemberID] ORDER BY [TTL_Price] DESC) AS Price_Rank --每個人花費(排名)
FROM (	SELECT	[MemberID],
				[Productname],
				SUM([Money]) [TTL_Price]--所花的錢
		FROM [邦邦量販店].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID],[Productname])AA
ORDER BY 1,4

--4.「NTILE + PARTITION BY」
SELECT	[MemberID],
		[Productname],
		[TTL_Price],
		NTILE(5) OVER(PARTITION BY [MemberID] ORDER BY [TTL_Price]) AS TTL_Price_NTILE--每個人查詢結果分5組
FROM (	SELECT	[MemberID],
				[Productname],
				SUM([Money]) [TTL_Price]--所花的錢
		FROM [邦邦量販店].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID],[Productname])AA
ORDER BY 1
