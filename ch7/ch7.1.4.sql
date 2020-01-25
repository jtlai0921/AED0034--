/*7-1-4	�|�����ܶ����R�з|�y�ɶ�����*/
--exercise1
--1.�p��GMC�|�����|�y�Ѽ�
WITH TEST1 AS 
( SELECT *,DATEDIFF(DAY,[Start_date],[End_date]) AS �|�y�Ѽ�
  FROM [�����q�c��].[dbo].[GMC_Profile_new])

SELECT [�|�y�Ѽ�],COUNT(*) [�H��]
FROM TEST1
GROUP BY [�|�y�Ѽ�]
ORDER BY 2 DESC
GO

--2.�s��u�|�y�Ѽơv���u�|�y�~�ơv
IF OBJECT_ID (N'[�����q�c��].[dbo].[GMC_Profile_new1]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[GMC_Profile_new1];

SELECT	[MemberID], [Sex], [Birthday],
		[Marriage_Status],--�B�ê��A
		[Occupation],
		[COUNTY],--�����O
		[Channel], [Start_date], [End_date],
		CASE WHEN DATEDIFF(DAY,[Start_date],[End_date]) 
			 BETWEEN 0 AND 365 THEN '�@�~��'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 366 AND 730 THEN '�G�~��'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 731 AND 1095 THEN '�T�~��'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 1096 AND 1460 THEN '�|�~��'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 1461 AND 1825 THEN '���~��'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 1826 AND 2190 THEN '���~��'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 2191 AND 2555 THEN '�C�~��'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 2556 AND 2920 THEN '�K�~��'
		ELSE '��L' END AS [Member_Years] --�|�y�~��
INTO [�����q�c��].[dbo].[GMC_Profile_new1]
FROM [�����q�c��].[dbo].[GMC_Profile_new]
GO


--exercise2
--1.�p��VIP�|�����|�y�Ѽ�
WITH TEST2 AS 
( SELECT *,DATEDIFF(DAY,[Start_date],[End_date]) AS �|�y�Ѽ�
  FROM [�����q�c��].[dbo].[VIP_Profile_new])

SELECT [�|�y�Ѽ�],COUNT(*) [�H��]
FROM TEST2
GROUP BY [�|�y�Ѽ�]
ORDER BY 2 DESC
GO

--2.�s��u�|�y�Ѽơv���u�|�y�~�ơv
IF OBJECT_ID (N'[�����q�c��].[dbo].[VIP_Profile_new1]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[VIP_Profile_new1];

SELECT	[MemberID], [Sex], [Birthday],
		[Marriage_Status],--�B�ê��A
		[Occupation],
		[COUNTY],--�����O
		[Channel], [Create_date], [Start_date], [End_date],
		CASE WHEN DATEDIFF(DAY,[Start_date],[End_date]) 
			 BETWEEN 0 AND 365 THEN '�@�~��'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 366 AND 730 THEN '�G�~��'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 731 AND 1095 THEN '�T�~��'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 1096 AND 1460 THEN '�|�~��'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 1461 AND 1825 THEN '���~��'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 1826 AND 2190 THEN '���~��'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 2191 AND 2555 THEN '�C�~��'
			 WHEN DATEDIFF(DAY,[Start_date],[End_date])
			 BETWEEN 2556 AND 2920 THEN '�K�~��'
		ELSE '��L' END AS [Member_Years] --�|�y�~��
INTO [�����q�c��].[dbo].[VIP_Profile_new1]
FROM [�����q�c��].[dbo].[VIP_Profile_new]
GO

--exercise3
--1.�p��GMC�PVIP�|�����|�y�~�Ƥ��G
SELECT Member_Years,COUNT(*) [GMC�H��]
FROM [�����q�c��].[dbo].[GMC_Profile_new1]
GROUP BY Member_Years
ORDER BY 1

SELECT Member_Years,COUNT(*) [VIP�H��]
FROM [�����q�c��].[dbo].[VIP_Profile_new1]
GROUP BY Member_Years
ORDER BY 1
