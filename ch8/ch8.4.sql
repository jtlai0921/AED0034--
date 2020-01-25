/*8-4  �Q��R ScriptŪ��SQL Server��ƪ�P�g�J��Ʀ�SQL Server��ƪ�*/
--�@�B�z�LR Script�w�s�{�Ǽg�J��Ʀ�SQL Server��Ʈw
--1..�إߴ��ո�ƪ�
USE [�����q�c��]
CREATE TABLE [dbo].[Worldbaseball_Score]
( [Country] VARCHAR(20) NOT NULL, --��a
  [Year] INT, --�~��
  [Population] INT, --�H�f
  [WBSC_Score] INT) --�ƦW�n��
GO

--2..�g�J���ո�ƪ��SQL Server��Ʈw
--(1) �Q��R Script�إ߹w�s�{��
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

--(2)�z�L�إߧ������w�s�{�ǵ��G�A�N��ƶ��g�JSQL Server��ƪ�
INSERT INTO [dbo].[Worldbaseball_Score]
EXECUTE usp_Worldbaseball_Score

--(3)���Ҭd�߭��g�J��SQL Server��ƪ�
SELECT * FROM [dbo].[Worldbaseball_Score]
GO

--�G�B�z�LR ScriptŪ��SQL Server��ƪ�
--1.�bR Script������T-SQL
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'
OutputDataSet <- InputDataSet',
@input_data_1 = N'SELECT * FROM [dbo].[Worldbaseball_Score]'
WITH RESULT SETS (([Country] VARCHAR(20) NOT NULL,[Year] INT,[Population] INT,[WBSC_Score] INT));

--2.�bOutputDataSet�[�J�z�����-->country== "Taiwan"
--�bR Script������T-SQL�A�å[�J�z�����
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'
library("plyr")
OutputDataSet <- subset(InputDataSet, Country=="Taiwan")',
@input_data_1 = N'SELECT * FROM [�����q�c��].[dbo].[Worldbaseball_Score]'
WITH RESULT SETS (([Country] VARCHAR(20) NOT NULL,[Year] INT,[Population] INT,[WBSC_Score] INT));

--�T.�z�LR Script����u�ʰj�k���XR-Square
--1.�bR Script������u�ʰj�k���R�A�íp��R-Square
execute sp_execute_external_script
@language = N'R',
@script = N'
OutputDataSet <- data.frame(summary(lm(formula = WBSC_Score ~ Population,data = InputDataSet))$r.squared)',
@input_data_1 = N'SELECT * FROM [dbo].[Worldbaseball_Score]',
@parallel = 0
WITH RESULT SETS (([R_Squared] NUMERIC(6,5) NOT NULL))

--2.�bR Script������u�ʰj�k���R�A�íp��R-Square�A(�ư��j�ڡB�饻�B�i�h���U)
execute sp_execute_external_script
@language = N'R',
@script = N'
d <- subset(InputDataSet, Country!="Cuba" & Country!="Japan" & Country!="PuertoRico")
OutputDataSet <- data.frame(summary(lm(formula = WBSC_Score ~ Population,data = d))$r.squared)'
, @input_data_1 = N'SELECT * FROM [dbo].[Worldbaseball_Score]'
, @parallel = 0
WITH RESULT SETS (([R_Squared] NUMERIC(6,5) NOT NULL))
