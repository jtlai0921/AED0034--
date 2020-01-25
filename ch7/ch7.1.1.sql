/*7-1-1	會員基本資料整理－縣市別填答*/
--exercise1
--1.萃取Location欄位的前3個字元
USE [邦邦量販店]
GO

WITH TEST AS 
( SELECT [MemberID],
		 [Sex],
		 [Birthday],
		 [Marriage],
		 [Occupation],
		 SUBSTRING(Location,1,3) [COUNTY],--縣市別
		 [Location],
		 [Channel],
		 [Start_date],
		 [End_date]
 FROM [dbo].[GMC_Profile] )

--2.觀察萃取後的Location欄位內容分佈情形
SELECT [COUNTY],COUNT(*) [CNT] --次數
FROM TEST
GROUP BY [COUNTY]
ORDER BY 2 DESC
GO

--exercise2
--GMC會員
/*==1.利用SELECT…INTO…新增一新資料表單，過程中透過CASE WHEN…THEN…ELSE...分門別類==*/
IF OBJECT_ID (N'[邦邦量販店].[dbo].[GMC_Profile_new]') IS NOT NULL
DROP TABLE [邦邦量販店].[dbo].[GMC_Profile_new];

SELECT [MemberID], [Sex], [Birthday], [Marriage], [Occupation],
		CASE WHEN SUBSTRING([Location],1,3)='臺北市' THEN '台北市'
			 WHEN SUBSTRING([Location],1,3)='臺北縣' THEN '新北市'
			 WHEN SUBSTRING([Location],1,3)='臺中市' THEN '台中市'
			 WHEN SUBSTRING([Location],1,3)='臺東縣' THEN '台東縣'
			 WHEN SUBSTRING([Location],1,3)='臺北市' THEN '台北市'
			 WHEN SUBSTRING([Location],1,3)='台中市' THEN '台中市'
			 WHEN SUBSTRING([Location],1,3)='台中縣' THEN '台中市'
			 WHEN SUBSTRING([Location],1,3)='台北市' THEN '台北市'
			 WHEN SUBSTRING([Location],1,3)='台北縣' THEN '新北市'
			 WHEN SUBSTRING([Location],1,3)='台東市' THEN '台東縣'
			 WHEN SUBSTRING([Location],1,3)='台東縣' THEN '台東縣'
			 WHEN SUBSTRING([Location],1,3)='台南市' THEN '台南市'
			 WHEN SUBSTRING([Location],1,3)='台南縣' THEN '台南市'
			 WHEN SUBSTRING([Location],1,3)='宜蘭市' THEN '宜蘭縣'
			 WHEN SUBSTRING([Location],1,3)='宜蘭縣' THEN '宜蘭縣'
		 	 WHEN SUBSTRING([Location],1,3)='花蓮市' THEN '花蓮縣'
			 WHEN SUBSTRING([Location],1,3)='花蓮縣' THEN '花蓮縣'
			 WHEN SUBSTRING([Location],1,3)='金門縣' THEN '金門縣'
			 WHEN SUBSTRING([Location],1,3)='南投市' THEN '南投縣'
			 WHEN SUBSTRING([Location],1,3)='南投縣' THEN '南投縣'
			 WHEN SUBSTRING([Location],1,3)='屏東市' THEN '屏東縣'
			 WHEN SUBSTRING([Location],1,3)='屏東縣' THEN '屏東縣'
			 WHEN SUBSTRING([Location],1,3)='苗栗市' THEN '苗栗縣'
			 WHEN SUBSTRING([Location],1,3)='苗栗縣' THEN '苗栗縣'
			 WHEN SUBSTRING([Location],1,3)='桃園市' THEN '桃園縣'
			 WHEN SUBSTRING([Location],1,3)='桃園縣' THEN '桃園縣'
			 WHEN SUBSTRING([Location],1,3)='高雄市' THEN '高雄市'
			 WHEN SUBSTRING([Location],1,3)='高雄縣' THEN '高雄市'
			 WHEN SUBSTRING([Location],1,3)='基隆市' THEN '基隆市'
			 WHEN SUBSTRING([Location],1,3)='連江縣' THEN '連江縣'
			 WHEN SUBSTRING([Location],1,3)='雲林縣' THEN '雲林縣'
			 WHEN SUBSTRING([Location],1,3)='新竹市' THEN '新竹市'
			 WHEN SUBSTRING([Location],1,3)='新竹縣' THEN '新竹縣'
			 WHEN SUBSTRING([Location],1,3)='嘉義市' THEN '嘉義市'
			 WHEN SUBSTRING([Location],1,3)='嘉義縣' THEN '嘉義縣'
			 WHEN SUBSTRING([Location],1,3)='彰化市' THEN '彰化縣'
			 WHEN SUBSTRING([Location],1,3)='彰化縣' THEN '彰化縣'
			 WHEN SUBSTRING([Location],1,3)='澎湖縣' THEN '澎湖縣'
		ELSE '其他' END AS [COUNTY],--縣市別
		[Channel], [Start_date], [End_date]
INTO [邦邦量販店].[dbo].[GMC_Profile_new]
FROM [邦邦量販店].[dbo].[GMC_Profile]
GO

--2.利用DISTINCT驗證
SELECT DISTINCT COUNTY
FROM [邦邦量販店].[dbo].[GMC_Profile_new]
ORDER BY 1
GO

--VIP會員
/*==1.利用SELECT…INTO…新增一新資料表單，過程中透過CASE WHEN…THEN…ELSE...分門別類==*/
IF OBJECT_ID (N'[邦邦量販店].[dbo].[VIP_Profile_new]') IS NOT NULL
DROP TABLE [邦邦量販店].[dbo].[VIP_Profile_new];

SELECT [MemberID], [Sex], [Birthday], [Marriage], [Occupation],
		CASE WHEN SUBSTRING([Location],1,3)='臺北市' THEN '台北市'
			 WHEN SUBSTRING([Location],1,3)='臺北縣' THEN '新北市'
			 WHEN SUBSTRING([Location],1,3)='臺中市' THEN '台中市'
			 WHEN SUBSTRING([Location],1,3)='臺東縣' THEN '台東縣'
			 WHEN SUBSTRING([Location],1,3)='臺北市' THEN '台北市'
			 WHEN SUBSTRING([Location],1,3)='台中市' THEN '台中市'
			 WHEN SUBSTRING([Location],1,3)='台中縣' THEN '台中市'
			 WHEN SUBSTRING([Location],1,3)='台北市' THEN '台北市'
			 WHEN SUBSTRING([Location],1,3)='台北縣' THEN '新北市'
			 WHEN SUBSTRING([Location],1,3)='台東市' THEN '台東縣'
			 WHEN SUBSTRING([Location],1,3)='台東縣' THEN '台東縣'
			 WHEN SUBSTRING([Location],1,3)='台南市' THEN '台南市'
			 WHEN SUBSTRING([Location],1,3)='台南縣' THEN '台南市'
			 WHEN SUBSTRING([Location],1,3)='宜蘭市' THEN '宜蘭縣'
			 WHEN SUBSTRING([Location],1,3)='宜蘭縣' THEN '宜蘭縣'
		 	 WHEN SUBSTRING([Location],1,3)='花蓮市' THEN '花蓮縣'
			 WHEN SUBSTRING([Location],1,3)='花蓮縣' THEN '花蓮縣'
			 WHEN SUBSTRING([Location],1,3)='金門縣' THEN '金門縣'
			 WHEN SUBSTRING([Location],1,3)='南投市' THEN '南投縣'
			 WHEN SUBSTRING([Location],1,3)='南投縣' THEN '南投縣'
			 WHEN SUBSTRING([Location],1,3)='屏東市' THEN '屏東縣'
			 WHEN SUBSTRING([Location],1,3)='屏東縣' THEN '屏東縣'
			 WHEN SUBSTRING([Location],1,3)='苗栗市' THEN '苗栗縣'
			 WHEN SUBSTRING([Location],1,3)='苗栗縣' THEN '苗栗縣'
			 WHEN SUBSTRING([Location],1,3)='桃園市' THEN '桃園縣'
			 WHEN SUBSTRING([Location],1,3)='桃園縣' THEN '桃園縣'
			 WHEN SUBSTRING([Location],1,3)='高雄市' THEN '高雄市'
			 WHEN SUBSTRING([Location],1,3)='高雄縣' THEN '高雄市'
			 WHEN SUBSTRING([Location],1,3)='基隆市' THEN '基隆市'
			 WHEN SUBSTRING([Location],1,3)='連江縣' THEN '連江縣'
			 WHEN SUBSTRING([Location],1,3)='雲林縣' THEN '雲林縣'
			 WHEN SUBSTRING([Location],1,3)='新竹市' THEN '新竹市'
			 WHEN SUBSTRING([Location],1,3)='新竹縣' THEN '新竹縣'
			 WHEN SUBSTRING([Location],1,3)='嘉義市' THEN '嘉義市'
			 WHEN SUBSTRING([Location],1,3)='嘉義縣' THEN '嘉義縣'
			 WHEN SUBSTRING([Location],1,3)='彰化市' THEN '彰化縣'
			 WHEN SUBSTRING([Location],1,3)='彰化縣' THEN '彰化縣'
			 WHEN SUBSTRING([Location],1,3)='澎湖縣' THEN '澎湖縣'
		ELSE '其他' END AS [COUNTY],--縣市別
		[Channel], [Start_date], [Create_date], [End_date]
INTO [邦邦量販店].[dbo].[VIP_Profile_new]
FROM [邦邦量販店].[dbo].[VIP_Profile]
GO