/*8-3 �uR���o�w�w�˪�R�]�]Package�^�M��v*/
--�G�B�Q��T-SQL�]sp_execute_external_script�^����R���ت�installed.packages( )���O�C
--���o�ثe�w�˪�R�]�M��B�ؿ��Ϊ���
EXECUTE sp_execute_external_script
@language=N'R'
,@script = N'
packageList <-installed.packages();
NameOnly <- packageList[,c(1,2,3)];
OutputDataSet <- as.data.frame(NameOnly);'
, @input_data_1 = N''
WITH RESULT SETS ((RPackageName NVARCHAR(250),[LibFolder]  NVARCHAR(250),[Version]  NVARCHAR(250)))
