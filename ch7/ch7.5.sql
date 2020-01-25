/*7-5 �|���^�m��*/
--exercise1
--1.�p��|���~�׮��O���B�A�J�������Ӹ�ƪ�
IF OBJECT_ID (N'[�����q�c��].[dbo].[VIP�|���^�m��]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[VIP�|���^�m��];

SELECT	A.[MemberID],
		B.[TransactionID], 
		A.[Create_date],
		A.[End_date],
		B.[Money],
		B.[Trans_Createdate], 
		CASE WHEN A.[Create_date]>='2004-01-01' AND A.[Create_date]<'2005-01-01' THEN '2004'
			 WHEN A.[Create_date]>='2005-01-01' AND A.[Create_date]<'2006-01-01' THEN '2005'
			 WHEN A.[Create_date]>='2006-01-01' AND A.[Create_date]<'2007-01-01' THEN '2006'
			 WHEN A.[Create_date]>='2007-01-01' AND A.[Create_date]<'2008-01-01' THEN '2007'
		ELSE NULL END AS [�[�J�~��],
		CASE WHEN DATEDIFF(DAY,A.[Create_date],B.[Trans_Createdate])<=365 THEN '��1�~���O' 
			 WHEN DATEDIFF(DAY,A.[Create_date],B.[Trans_Createdate])>365 AND DATEDIFF(DAY,A.[Create_date],B.[Trans_Createdate])<=730  THEN '��2�~���O'
			 WHEN DATEDIFF(DAY,A.[Create_date],B.[Trans_Createdate])>730 AND DATEDIFF(DAY,A.[Create_date],B.[Trans_Createdate])<=1095 THEN '��3�~���O'
			 WHEN DATEDIFF(DAY,A.[Create_date],B.[Trans_Createdate])>1095 THEN '��4�~���O'
		ELSE NULL END AS [�ʶR�~��]
INTO [�����q�c��].[dbo].[VIP�|���^�m��]
FROM [�����q�c��].[dbo].[VIP_Profile_new1]	A
LEFT JOIN
	 [�����q�c��].[dbo].[VIP_TransDetail]	B
ON A.MemberID=B.MemberID
WHERE B.MemberID IS NOT NULL --�ư��S��������|��
AND DATEDIFF(DAY,A.[Create_date],B.[Trans_Createdate])>0 --���Ѧ���VIP��B������欰
GO

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

--3.�d�ߦU�~�ץ[�JVIP�|���P���O�~�פ��G����
SELECT	[�[�J�~��],
		SUM(CASE WHEN [�ʶR�~��]='��1�~���O' THEN [Money] ELSE 0 END) AS '��1�~���O',
		SUM(CASE WHEN [�ʶR�~��]='��2�~���O' THEN [Money] ELSE 0 END) AS '��2�~���O',
		SUM(CASE WHEN [�ʶR�~��]='��3�~���O' THEN [Money] ELSE 0 END) AS '��3�~���O',
		SUM(CASE WHEN [�ʶR�~��]='��4�~���O' THEN [Money] ELSE 0 END) AS '��4�~���O'
FROM [�����q�c��].[dbo].[VIP�|���^�m��]
GROUP BY [�[�J�~��]
ORDER BY 1
GO

