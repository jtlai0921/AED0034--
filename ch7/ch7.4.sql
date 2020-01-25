/*7-4 �|���y���v*/
--exercise1
--1.�إ߷J�`��ƪ�A�HVIP�|������
IF OBJECT_ID (N'[�����q�c��].[dbo].[VIP�|���y���v]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[VIP�|���y���v];

SELECT	DISTINCT A.[MemberID], A.[Create_date], A.[End_date], 
		CASE WHEN [Create_date]>='2004-01-01' AND [Create_date]<'2005-01-01' THEN '2004'
			 WHEN [Create_date]>='2005-01-01' AND [Create_date]<'2006-01-01' THEN '2005'
			 WHEN [Create_date]>='2006-01-01' AND [Create_date]<'2007-01-01' THEN '2006'
			 WHEN [Create_date]>='2007-01-01' AND [Create_date]<'2008-01-01' THEN '2007'
		ELSE NULL END AS [�[�J�~��],
		CASE WHEN DATEDIFF(DAY,[Create_date],[End_date])<=365 THEN '��1�~�y��'
			 WHEN DATEDIFF(DAY,[Create_date],[End_date])>365 AND DATEDIFF(DAY,[Create_date],[End_date])<=730 THEN '��2�~�y��'
			 WHEN DATEDIFF(DAY,[Create_date],[End_date])>730 AND DATEDIFF(DAY,[Create_date],[End_date])<=1095 THEN '��3�~�y��' 
			 WHEN DATEDIFF(DAY,[Create_date],[End_date])>1095 AND DATEDIFF(DAY,[Create_date],[End_date])<=1460 THEN '��4�~�y��'
			 WHEN DATEDIFF(DAY,[Create_date],[End_date])>1460 AND DATEDIFF(DAY,[Create_date],[End_date])<=1825 THEN '��5�~�y��'
			 WHEN DATEDIFF(DAY,[Create_date],[End_date])>1825 AND DATEDIFF(DAY,[Create_date],[End_date])<=2190 THEN '��6�~�y��'
			 WHEN DATEDIFF(DAY,[Create_date],[End_date])>2190 AND DATEDIFF(DAY,[Create_date],[End_date])<=2555 THEN '��7�~�y��'
		ELSE '��L' END AS [�y���~��]
INTO [�����q�c��].[dbo].[VIP�|���y���v]
FROM [�����q�c��].[dbo].[VIP_Profile_new1]	A
LEFT JOIN
	 [�����q�c��].[dbo].[VIP_TransDetail]   B
ON	A.[MemberID]=B.[MemberID]
WHERE B.MemberID IS NOT NULL --�ư��S��������|��

--2.�d�ߦU�~�ץ[�JVIP�|���H��
SELECT	[�[�J�~��], 
		COUNT([MemberID]) [VIP�H��]
FROM (	SELECT	[MemberID],
				CASE WHEN [Create_date]>='2004-01-01' AND [Create_date]<'2005-01-01' THEN '2004' 
					 WHEN [Create_date]>='2005-01-01' AND [Create_date]<'2006-01-01' THEN '2005'
					 WHEN [Create_date]>='2006-01-01' AND [Create_date]<'2007-01-01' THEN '2006' 
					 WHEN [Create_date]>='2007-01-01' AND [Create_date]<'2008-01-01' THEN '2007'
				ELSE NULL END AS [�[�J�~��]
		FROM [�����q�c��].[dbo].[VIP_Profile_new1] )AA
GROUP BY [�[�J�~��]
ORDER BY 1
GO 

--3.�d�ߦU�~�ץ[�JVIP�|�����y������
SELECT	[�[�J�~��],
		COUNT(CASE WHEN [�y���~��]='��1�~�y��' THEN 1 ELSE NULL END) AS '��1�~�y��',
		COUNT(CASE WHEN [�y���~��]='��2�~�y��' THEN 1 ELSE NULL END) AS '��2�~�y��',
		COUNT(CASE WHEN [�y���~��]='��3�~�y��' THEN 1 ELSE NULL END) AS '��3�~�y��',
		COUNT(CASE WHEN [�y���~��]='��4�~�y��' THEN 1 ELSE NULL END) AS '��4�~�y��',
		COUNT(CASE WHEN [�y���~��]='��5�~�y��' THEN 1 ELSE NULL END) AS '��5�~�y��',
		COUNT(CASE WHEN [�y���~��]='��6�~�y��' THEN 1 ELSE NULL END) AS '��6�~�y��',
		COUNT(CASE WHEN [�y���~��]='��7�~�y��' THEN 1 ELSE NULL END) AS '��7�~�y��'
FROM [�����q�c��].[dbo].[VIP�|���y���v]
GROUP BY [�[�J�~��]
ORDER BY 1
GO
