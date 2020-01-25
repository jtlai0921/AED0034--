/*8-3 「R取得已安裝的R包（Package）清單」*/
--二、利用T-SQL（sp_execute_external_script）執行R內建的installed.packages( )指令。
--取得目前安裝的R包清單、目錄及版本
EXECUTE sp_execute_external_script
@language=N'R'
,@script = N'
packageList <-installed.packages();
NameOnly <- packageList[,c(1,2,3)];
OutputDataSet <- as.data.frame(NameOnly);'
, @input_data_1 = N''
WITH RESULT SETS ((RPackageName NVARCHAR(250),[LibFolder]  NVARCHAR(250),[Version]  NVARCHAR(250)))
