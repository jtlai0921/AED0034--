/*8-1-3	SQL Server With R��¦�έp���R�d��*/
--�רҤ@ �[�k�]SUM�^
--�[�k(�q1�[��1000)
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'TTLSUM <- sum(1:1000);
OutputDataSet <- data.frame(TTLSUM);',
@input_data_1 = N''
WITH RESULT SETS (([�`�M] INT NOT NULL));

--�רҤG ����
--����(2��10����)
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'TTLSUM <- 2^10;
OutputDataSet <- data.frame(TTLSUM);',
@input_data_1 = N''
WITH RESULT SETS (([�`�M] INT NOT NULL));

--�רҤT ������(mean)
--�����ȭp��(1��1000)
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'Mean <- mean(1:1000);
OutputDataSet <- data.frame(Mean);',
@input_data_1 = N''
WITH RESULT SETS (([������] FLOAT NOT NULL));


--�רҥ| �зǮt�]Standard Deviation�^
--�зǮt�p��(1��1000)
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'Standard_Deviation <- sd(1:1000);
OutputDataSet <- data.frame(Standard_Deviation);',
@input_data_1 = N''
WITH RESULT SETS (([�зǮt] FLOAT NOT NULL));

--�רҤ� �ܲ��ơ]Variance�^
--�ܲ��ƭp��(1��1000)
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'Variance <- var(1:1000);
OutputDataSet <- data.frame(Variance);',
@input_data_1 = N''
WITH RESULT SETS (([�ܲ��Y��] FLOAT NOT NULL));

--�רҤ� �ܲ��Y�ơ]CV�^
--�ܲ��Y�ƭp��(1��1000)
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'CV <- sd(1:1000)/mean(1:1000);
OutputDataSet <- data.frame(CV);',
@input_data_1 = N''
WITH RESULT SETS (([�ܲ��Y��] FLOAT NOT NULL));
