/*8-2 在R Services安裝R包（Package）*/
--1.查詢範例資料使用data.frame
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'
Country <- c ("USA","Japan","Cuba","Taiwan","Korea","Holland","Canada","Dominican","PuertoRico","Venezuela","USA","Japan","Cuba","Taiwan","Korea","Holland","Canada","Dominican","PuertoRico","Venezuela");
Year <- c (2015,2015,2015,2015,2015,2015,2015,2015,2015,2015,2014,2014,2014,2014,2014,2014,2014,2014,2014,2014);
Population <- c (32076,12681,1127,2351,5062,1699,3600,1079,347,3085,31890,12730,1142,2341,4952,1680,3516,1040,355,3041);
WBSC_Score <- c (1006,965,732,643,641,492,422,396,340,296,766,785,663,605,340,433,353,379,292,269);
OutputDataSet <- data.frame(Country,Year,Population,WBSC_Score)', 
@input_data_1 = N''
WITH RESULT SETS (([Country] VARCHAR(20) NOT NULL,[Year] INT,[Population] INT,[WBSC_Score] INT));


--2.使用plyr裡的ddply計算相關係數
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'
library("plyr")
Country <- c ("USA","Japan","Cuba","Taiwan","Korea","Holland","Canada","Dominican","PuertoRico","Venezuela","USA","Japan","Cuba","Taiwan","Korea","Holland","Canada","Dominican","PuertoRico","Venezuela");
Year <- c (2015,2015,2015,2015,2015,2015,2015,2015,2015,2015,2014,2014,2014,2014,2014,2014,2014,2014,2014,2014);
Population <- c (32076,12681,1127,2351,5062,1699,3600,1079,347,3085,31890,12730,1142,2341,4952,1680,3516,1040,355,3041);
WBSC_Score <- c (1006,965,732,643,641,492,422,396,340,296,766,785,663,605,340,433,353,379,292,269);
d <- data.frame (Country,Year,Population,WBSC_Score)
OutputDataSet <- ddply(d, c("Country"), function(df) cor(df$Population,df$WBSC_Score));',
@input_data_1 = N''
WITH RESULT SETS (([Country] NVARCHAR(20) NOT NULL, [Cor] NUMERIC(6,3)));

