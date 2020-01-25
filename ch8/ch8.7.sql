
--1.�إ��x�sSLR�ҫ���SQL��ƪ�(�ҫ��W�١B�V�m�ɶ��B�ҫ����e)
CREATE TABLE [�����q�c��].[dbo].[SLR_ML_Models]
(
    Model_NAME VARCHAR(20) NOT NULL,
    MODEL_TRAINING_DATE DATETIME  NOT NULL,
    MODEL_CONTENT VARBINARY(MAX) NOT NULL
);

/*2.�إ߰V�m��ƪ�SQL��ƪ�μg�J�V�m�˥����(Training Data)
�˥���ƪ��A��2�����A���O�O����((�~)House_age)�Ωл�((�W/�U)House_Uniprice)
�إߧ�����A���ӥi�H���_�g�J�J�s��ơA�N�V�m�ҫ����ĪGTRAINING�󧹾�
*/

CREATE TABLE [�����q�c��].[dbo].[SLR_ML_HouseAgeData]
(
    House_age FLOAT NOT NULL,
	House_Uniprice FLOAT NOT NULL
)
INSERT INTO [�����q�c��].[dbo].[SLR_ML_HouseAgeData] ( House_age,House_Uniprice)
VALUES	(5.5,68.2),(6.5,66.9),(8.6,65.4),(15.3,62.3),(16.9,58.2),(25.2,55.3),(3.2,72.5),(4.6,74.6),(35.3,49.5),(15.3,63.3),
		(17.6,59.6),(28.0,48.6),(8.8,66.1),(7.9,66.5),(8.6,64.3),(15.3,62.3),(20.3,59.1),(22.6,53.2),(11.6,64.2),(28.6,51.0),
		(13.6,64.6),(17.6,56.0),(14.2,64.6),(1.6,76.2),(29.6,49.5),(21.2,56.0),(9.0,63.5),(11.3,64.5),(33.5,48.6),(40.2,45.1)

Exec sp_configure 'external scripts enabled', 1
Reconfigure with override

/*3.�إ�SLR�V�m�ҫ����w�s�{��
��Ƭy�ѱq[�����q�c��].[dbo].[SLR_ML_HouseAgeData]�g�J�ܨ�InputDataSet DataFrame�C
*/
USE [�����q�c��]
GO

CREATE PROC usp_SLR_ML_Houseprice AS
EXECUTE sp_execute_external_script
@language = N'R'
,@script =   N'

# 1.�إ�²��u�ʰj�k�ҫ�
#Y:�ؼ��ܼ�(�]�ܼ�) House_Uniprice
#X:�W���ܼ�(���ܼ�) House_age
trainData <-InputDataSet
colnames(trainData) <- c("House_age", "House_Uniprice")
lmObj <- lm(formula = House_Uniprice ~ House_age, data = trainData) 

# (2)�ǦC�u�ʰj�k�ҫ� 
modelbin <- serialize(lmObj, NULL)  
modelbinstr=paste(modelbin, collapse="")  

OutputDataSet <- data.frame(data=readBin(modelbin,what=raw(),n=1e6))
'
, @input_data_1 = N'SELECT * FROM [�����q�c��].[dbo].[SLR_ML_HouseAgeData]'
WITH RESULT SETS (([MODEL_CONTENT] VARBINARY(MAX) NOT NULL));


/*4.����(�I�s)��3�B�J���w�s�{��usp_SLR_ML_Houseprice�A�H��N�^�Ǫ��ҫ��g�J��SQL Server��ƪ�F
�C���s���V�m��Ƨ�s�ɡA�ڭ̴N�i�H�z�L�Ƶ{�覡����A�p���o�˼ҫ������P��ڱ��p�K��*/

CREATE TABLE [�����q�c��].[dbo].[Temp_Models]
(
 [MODEL_CONTENT] VARBINARY(MAX) NOT NULL
)

INSERT INTO [�����q�c��].[dbo].[Temp_Models]
EXEC usp_SLR_ML_Houseprice

INSERT INTO [�����q�c��].[dbo].[SLR_ML_Models]
SELECT	'House_Uniprice' Model_NAME,
		GETDATE() MODEL_TRAINING_DATE,
		[MODEL]
FROM [�����q�c��].[dbo].[Temp_Models]
					

--5.�d�������x�sSLR�ҫ���SQL��ƪ�
SELECT * FROM [�����q�c��].[dbo].[SLR_ML_HouseAgeData] GO;

					select * from ML_Models								

									
									

 values(29,77),(28,62),(34,93),(31,84),(25,59),(29,64),(32,79)
      ,(31,75),(24,58),(33,91),(25,51),(31,73),(26,65),(30,84)
��ƪ�2�����: �Ѯ�ū׻P�B�����P��q���έp��ơC

(���ӥi�H���_��J�s��ơA���ҫ��V�m����n!)