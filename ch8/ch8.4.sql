/*8-4  利用R Script讀取SQL Server資料表與寫入資料至SQL Server資料表*/
--一、透過R Script預存程序寫入資料至SQL Server資料庫
--1..建立測試資料表
USE [邦邦量販店]
CREATE TABLE [dbo].[Worldbaseball_Score]
( [Country] VARCHAR(20) NOT NULL, --國家
  [Year] INT, --年度
  [Population] INT, --人口
  [WBSC_Score] INT) --排名積分
GO

--2..寫入測試資料表至SQL Server資料庫
--(1) 利用R Script建立預存程序
CREATE PROC usp_Worldbaseball_Score AS
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'
Country <- c("USA","Japan","Cuba","Taiwan","Korea","Holland","Canada","Dominican","PuertoRico","Venezuela","USA","Japan","Cuba","Taiwan","Korea","Holland","Canada","Dominican","PuertoRico","Venezuela");
Year <- c(2015,2015,2015,2015,2015,2015,2015,2015,2015,2015,2014,2014,2014,2014,2014,2014,2014,2014,2014,2014);
Population <- c(32076,12681,1127,2351,5062,1699,3600,1079,347,3085,31890,12730,1142,2341,4952,1680,3516,1040,355,3041);
WBSC_Score <- c(1006,965,732,643,641,492,422,396,340,296,766,785,663,605,340,433,353,379,292,269);
OutputDataSet <- data.frame(Country,Year,Population,WBSC_Score)',
@input_data_1 = N''
WITH RESULT SETS (([Country] VARCHAR(20) NOT NULL,[Year] INT,[Population] INT,[WBSC_Score] INT));
GO

--(2)透過建立完成的預存程序結果，將資料集寫入SQL Server資料表
INSERT INTO [dbo].[Worldbaseball_Score]
EXECUTE usp_Worldbaseball_Score

--(3)驗證查詢剛剛寫入的SQL Server資料表
SELECT * FROM [dbo].[Worldbaseball_Score]
GO

--二、透過R Script讀取SQL Server資料表
--1.在R Script中執行T-SQL
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'
OutputDataSet <- InputDataSet',
@input_data_1 = N'SELECT * FROM [dbo].[Worldbaseball_Score]'
WITH RESULT SETS (([Country] VARCHAR(20) NOT NULL,[Year] INT,[Population] INT,[WBSC_Score] INT));

--2.在OutputDataSet加入篩選條件-->country== "Taiwan"
--在R Script中執行T-SQL，並加入篩選條件
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'
library("plyr")
OutputDataSet <- subset(InputDataSet, Country=="Taiwan")',
@input_data_1 = N'SELECT * FROM [邦邦量販店].[dbo].[Worldbaseball_Score]'
WITH RESULT SETS (([Country] VARCHAR(20) NOT NULL,[Year] INT,[Population] INT,[WBSC_Score] INT));

--三.透過R Script執行線性迴歸取出R-Square
--1.在R Script中執行線性迴歸分析，並計算R-Square
execute sp_execute_external_script
@language = N'R',
@script = N'
OutputDataSet <- data.frame(summary(lm(formula = WBSC_Score ~ Population,data = InputDataSet))$r.squared)',
@input_data_1 = N'SELECT * FROM [dbo].[Worldbaseball_Score]',
@parallel = 0
WITH RESULT SETS (([R_Squared] NUMERIC(6,5) NOT NULL))

--2.在R Script中執行線性迴歸分析，並計算R-Square，(排除古巴、日本、波多黎各)
execute sp_execute_external_script
@language = N'R',
@script = N'
d <- subset(InputDataSet, Country!="Cuba" & Country!="Japan" & Country!="PuertoRico")
OutputDataSet <- data.frame(summary(lm(formula = WBSC_Score ~ Population,data = d))$r.squared)'
, @input_data_1 = N'SELECT * FROM [dbo].[Worldbaseball_Score]'
, @parallel = 0
WITH RESULT SETS (([R_Squared] NUMERIC(6,5) NOT NULL))
