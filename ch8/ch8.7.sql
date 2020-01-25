
--1.建立儲存SLR模型的SQL資料表(模型名稱、訓練時間、模型內容)
CREATE TABLE [邦邦量販店].[dbo].[SLR_ML_Models]
(
    Model_NAME VARCHAR(20) NOT NULL,
    MODEL_TRAINING_DATE DATETIME  NOT NULL,
    MODEL_CONTENT VARBINARY(MAX) NOT NULL
);

/*2.建立訓練資料的SQL資料表及寫入訓練樣本資料(Training Data)
樣本資料表中，有2個欄位，分別是屋齡((年)House_age)及房價((坪/萬)House_Uniprice)
建立完成後，未來可以不斷寫入入新資料，將訓練模型的效果TRAINING更完整
*/

CREATE TABLE [邦邦量販店].[dbo].[SLR_ML_HouseAgeData]
(
    House_age FLOAT NOT NULL,
	House_Uniprice FLOAT NOT NULL
)
INSERT INTO [邦邦量販店].[dbo].[SLR_ML_HouseAgeData] ( House_age,House_Uniprice)
VALUES	(5.5,68.2),(6.5,66.9),(8.6,65.4),(15.3,62.3),(16.9,58.2),(25.2,55.3),(3.2,72.5),(4.6,74.6),(35.3,49.5),(15.3,63.3),
		(17.6,59.6),(28.0,48.6),(8.8,66.1),(7.9,66.5),(8.6,64.3),(15.3,62.3),(20.3,59.1),(22.6,53.2),(11.6,64.2),(28.6,51.0),
		(13.6,64.6),(17.6,56.0),(14.2,64.6),(1.6,76.2),(29.6,49.5),(21.2,56.0),(9.0,63.5),(11.3,64.5),(33.5,48.6),(40.2,45.1)

Exec sp_configure 'external scripts enabled', 1
Reconfigure with override

/*3.建立SLR訓練模型的預存程序
資料流由從[邦邦量販店].[dbo].[SLR_ML_HouseAgeData]寫入至到InputDataSet DataFrame。
*/
USE [邦邦量販店]
GO

CREATE PROC usp_SLR_ML_Houseprice AS
EXECUTE sp_execute_external_script
@language = N'R'
,@script =   N'

# 1.建立簡單線性迴歸模型
#Y:目標變數(因變數) House_Uniprice
#X:獨立變數(自變數) House_age
trainData <-InputDataSet
colnames(trainData) <- c("House_age", "House_Uniprice")
lmObj <- lm(formula = House_Uniprice ~ House_age, data = trainData) 

# (2)序列線性迴歸模型 
modelbin <- serialize(lmObj, NULL)  
modelbinstr=paste(modelbin, collapse="")  

OutputDataSet <- data.frame(data=readBin(modelbin,what=raw(),n=1e6))
'
, @input_data_1 = N'SELECT * FROM [邦邦量販店].[dbo].[SLR_ML_HouseAgeData]'
WITH RESULT SETS (([MODEL_CONTENT] VARBINARY(MAX) NOT NULL));


/*4.執行(呼叫)第3步驟的預存程序usp_SLR_ML_Houseprice，隨後將回傳的模型寫入至SQL Server資料表；
每當有新的訓練資料更新時，我們就可以透過排程方式執行，如此這樣模型更能夠與實際情況貼近*/

CREATE TABLE [邦邦量販店].[dbo].[Temp_Models]
(
 [MODEL_CONTENT] VARBINARY(MAX) NOT NULL
)

INSERT INTO [邦邦量販店].[dbo].[Temp_Models]
EXEC usp_SLR_ML_Houseprice

INSERT INTO [邦邦量販店].[dbo].[SLR_ML_Models]
SELECT	'House_Uniprice' Model_NAME,
		GETDATE() MODEL_TRAINING_DATE,
		[MODEL]
FROM [邦邦量販店].[dbo].[Temp_Models]
					

--5.查詢驗證儲存SLR模型的SQL資料表
SELECT * FROM [邦邦量販店].[dbo].[SLR_ML_HouseAgeData] GO;

					select * from ML_Models								

									
									

 values(29,77),(28,62),(34,93),(31,84),(25,59),(29,64),(32,79)
      ,(31,75),(24,58),(33,91),(25,51),(31,73),(26,65),(30,84)
資料表有2個欄位: 天氣溫度與冰紅茶銷售量的統計資料。

(未來可以不斷輸入新資料，讓模型訓練的更好!)