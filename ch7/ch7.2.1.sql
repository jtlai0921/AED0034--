/*7-2-1	�|�����ܶ����R�з|�y�ɶ�����*/
--exercise1
--1.����g���ܤ�
--�@��|���������
USE [�����q�c��]
GO

SELECT	RTRIM(LTRIM(CAST(DATEPART(YEAR,[Trans_Createdate]) AS CHAR)))+'�~' [����~],
		DATEPART(MONTH,[Trans_Createdate]) [�����],
		COUNT(DISTINCT [TransactionID]) [GMC�������]
FROM [dbo].[GMC_TransDetail]
GROUP BY RTRIM(LTRIM(CAST(DATEPART(YEAR,[Trans_Createdate]) AS CHAR)))+'�~', DATEPART(MONTH,[Trans_Createdate])
ORDER BY 1,2
GO

--VIP�|���������
USE [�����q�c��]
GO

SELECT	RTRIM(LTRIM(CAST(DATEPART(YEAR,[Trans_Createdate]) AS CHAR)))+'�~' [����~],
		DATEPART(MONTH,[Trans_Createdate]) [�����],
		COUNT(DISTINCT [TransactionID]) [GMC�������]
FROM [dbo].[VIP_TransDetail]
GROUP BY RTRIM(LTRIM(CAST(DATEPART(YEAR,[Trans_Createdate]) AS CHAR)))+'�~', DATEPART(MONTH,[Trans_Createdate])
ORDER BY 1,2
GO 
