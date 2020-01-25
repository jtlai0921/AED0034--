/*7-2-4	���Q�n�I���R*/
--exercise1
--VIP�|��
--1.�s�W�H����s����KEY�Ȫ����A[���Q�n�I�`�I��]�P[���Q�n�I�ŶZ]
IF OBJECT_ID (N'[�����q�c��].[dbo].[VIP�|�����Q�n�I]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[VIP�|�����Q�n�I];

SELECT *
INTO [�����q�c��].[dbo].[VIP�|�����Q�n�I]
FROM ( SELECT	DISTINCT [TransactionID],
				CASE WHEN SUM([Point])<50 THEN '01_���Q�n�I�`�I�Ƥ���50'
					 WHEN SUM([Point])>=50 AND SUM([Point])<100		THEN '02_���Q�n�I�`�I�Ƥ���50��100(���t)'
					 WHEN SUM([Point])>=100 AND SUM([Point])<200	THEN '03_���Q�n�I�`�I�Ƥ���100��200(���t)'
					 WHEN SUM([Point])>=200 AND SUM([Point])<300	THEN '04_���Q�n�I�`�I�Ƥ���200��300(���t)'
					 WHEN SUM([Point])>=300 AND SUM([Point])<400	THEN '05_���Q�n�I�`�I�Ƥ���300��400(���t)'
					 WHEN SUM([Point])>=400 AND SUM([Point])<500	THEN '06_���Q�n�I�`�I�Ƥ���400��500(���t)'
					 WHEN SUM([Point])>=500 THEN '07_���Q�n�I�`�I�Ʀܤ�500'
				ELSE '��L' END AS [���Q�n�I�ŶZ],
				SUM([Point]) [���Q�n�I�`�I��]
FROM [�����q�c��].[dbo].[VIP_TransDetail]
GROUP BY [TransactionID])AA
GO

--2.VIP�|�����Q�n�I�ŶZ���G
SELECT	[���Q�n�I�ŶZ],
		COUNT([���Q�n�I�ŶZ]) [���Q�n�ICNT],
		ROUND((CAST(COUNT([���Q�n�I�ŶZ])AS FLOAT) / (SELECT CAST(COUNT([���Q�n�I�ŶZ]) AS FLOAT)  FROM [�����q�c��].[dbo].[VIP�|�����Q�n�I])),4) AS [Percent] --�ʤ���
FROM [�����q�c��].[dbo].[VIP�|�����Q�n�I]
GROUP BY [���Q�n�I�ŶZ]
ORDER BY 1
GO

--exercise2
--GMC�|��
--1.�s�W�H����s����KEY�Ȫ����A[���Q�n�I�`�I��]�P[���Q�n�I�ŶZ]
IF OBJECT_ID (N'[�����q�c��].[dbo].[GMC�|�����Q�n�I]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[GMC�|�����Q�n�I];

SELECT *
INTO [�����q�c��].[dbo].[GMC�|�����Q�n�I]
FROM ( SELECT	DISTINCT [TransactionID],
				CASE WHEN SUM([Point])<50 THEN '01_���Q�n�I�`�I�Ƥ���50'
					 WHEN SUM([Point])>=50 AND SUM([Point])<100		THEN '02_���Q�n�I�`�I�Ƥ���50��100(���t)'
					 WHEN SUM([Point])>=100 AND SUM([Point])<200	THEN '03_���Q�n�I�`�I�Ƥ���100��200(���t)'
					 WHEN SUM([Point])>=200 AND SUM([Point])<300	THEN '04_���Q�n�I�`�I�Ƥ���200��300(���t)'
					 WHEN SUM([Point])>=300 AND SUM([Point])<400	THEN '05_���Q�n�I�`�I�Ƥ���300��400(���t)'
					 WHEN SUM([Point])>=400 AND SUM([Point])<500	THEN '06_���Q�n�I�`�I�Ƥ���400��500(���t)'
					 WHEN SUM([Point])>=500 THEN '07_���Q�n�I�`�I�Ʀܤ�500'
				ELSE '��L' END AS [���Q�n�I�ŶZ],
				SUM([Point]) [���Q�n�I�`�I��]
FROM [�����q�c��].[dbo].[GMC_TransDetail]
GROUP BY [TransactionID])AA
GO

--2.GMC�|�����Q�n�I�ŶZ���G
SELECT	[���Q�n�I�ŶZ],
		COUNT([���Q�n�I�ŶZ]) [���Q�n�ICNT],
		ROUND((CAST(COUNT([���Q�n�I�ŶZ])AS FLOAT) / (SELECT CAST(COUNT([���Q�n�I�ŶZ]) AS FLOAT)  FROM [�����q�c��].[dbo].[GMC�|�����Q�n�I])),4) AS [Percent] --�ʤ���
FROM [�����q�c��].[dbo].[GMC�|�����Q�n�I]
GROUP BY [���Q�n�I�ŶZ]
ORDER BY 1
GO
