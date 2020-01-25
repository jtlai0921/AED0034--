/*8-1-3	SQL Server With R基礎統計分析範例*/
--案例一 加法（SUM）
--加法(從1加到1000)
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'TTLSUM <- sum(1:1000);
OutputDataSet <- data.frame(TTLSUM);',
@input_data_1 = N''
WITH RESULT SETS (([總和] INT NOT NULL));

--案例二 次方
--次方(2的10次方)
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'TTLSUM <- 2^10;
OutputDataSet <- data.frame(TTLSUM);',
@input_data_1 = N''
WITH RESULT SETS (([總和] INT NOT NULL));

--案例三 平均值(mean)
--平均值計算(1到1000)
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'Mean <- mean(1:1000);
OutputDataSet <- data.frame(Mean);',
@input_data_1 = N''
WITH RESULT SETS (([平均值] FLOAT NOT NULL));


--案例四 標準差（Standard Deviation）
--標準差計算(1到1000)
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'Standard_Deviation <- sd(1:1000);
OutputDataSet <- data.frame(Standard_Deviation);',
@input_data_1 = N''
WITH RESULT SETS (([標準差] FLOAT NOT NULL));

--案例五 變異數（Variance）
--變異數計算(1到1000)
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'Variance <- var(1:1000);
OutputDataSet <- data.frame(Variance);',
@input_data_1 = N''
WITH RESULT SETS (([變異係數] FLOAT NOT NULL));

--案例六 變異係數（CV）
--變異係數計算(1到1000)
EXECUTE sp_execute_external_script
@language = N'R',
@script = N'CV <- sd(1:1000)/mean(1:1000);
OutputDataSet <- data.frame(CV);',
@input_data_1 = N''
WITH RESULT SETS (([變異係數] FLOAT NOT NULL));
