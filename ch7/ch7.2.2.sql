/*7-2-2	�Ĥ@������ɦ~�֤αB�ê��A*/
--exercise1
--1.�Ĥ@������ɦ~�֤αB�ê��A
IF OBJECT_ID (N'[�����q�c��].[dbo].[�|������ɪ��~��_�B�ê��A]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[�|������ɪ��~��_�B�ê��A];

SELECT	A.[MemberID], A.[Birthday],
		DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) [AGE],--�Ĥ@������ɦ~��
		CASE WHEN DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) BETWEEN 0 AND 10 THEN '10���H�U' 
			 WHEN DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) BETWEEN 11 AND 20 THEN '11-20��' 
			 WHEN DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) BETWEEN 21 AND 30 THEN '21-30��' 
			 WHEN DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) BETWEEN 31 AND 40 THEN '31-40��' 
			 WHEN DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) BETWEEN 41 AND 50 THEN '41-50��' 
			 WHEN DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) BETWEEN 51 AND 60 THEN '51-60��' 
			 WHEN DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) BETWEEN 61 AND 70 THEN '61-70��' 
			 WHEN DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) >=71 THEN '�W�L70��' 
			 WHEN DATEDIFF(YEAR,A.[Birthday],B.[First_Transdate]) NOT BETWEEN 0 AND 107 THEN '��L' 
		ELSE '��L' END AS [AGE_Level],--����ɦ~�֤��h
		A.[Marriage_Status], --����ɱB�ê��A,
		A.[Start_date],
		B.[First_Transdate]
INTO [�����q�c��].[dbo].[�|������ɪ��~��_�B�ê��A]
FROM [�����q�c��].[dbo].[GMC_Profile_new1]	A
LEFT JOIN
(SELECT [MemberID],
		MIN([Trans_Createdate]) [First_Transdate] --���o�Ĥ@������ɶ�
 FROM [�����q�c��].[dbo].[GNC_TransDetail]
 GROUP BY [MemberID])						B
ON A.MemberID=B.MemberID
GO

--exercise2
--1.�u�@��|���v�b�o�q�������L�ʶR�ӫ~���H�ƤΦ���
SELECT	COUNT([MemberID]) [TTL_Members],--����|���H��
		COUNT([First_Transdate]) [Buy_Members],--����������|���H��
		ROUND(1-(COUNT([First_Transdate])*1.0) / (COUNT([MemberID])*1.0),3) [NoBuy_Percent] --�L����|����ҡA���ܤp���I��3��
FROM [�����q�c��].[dbo].[�|������ɪ��~��_�B�ê��A]
GO

--2.�u�@��|���v�b�o�q�����Ĥ@������ɪ��~�ּh�H�Ƥ��G�Φ���
SELECT	[AGE_Level],
		( SELECT COUNT([First_Transdate]) 
		  FROM [�����q�c��].[dbo].[�|������ɪ��~��_�B�ê��A] ) [Buy_ttlCNT],--�Ĥ@��������`�H��
		COUNT([First_Transdate]) [Buy_CNT], --�U�~�ּh����`�H��
		(COUNT([First_Transdate])*1.0) / 
		(( SELECT COUNT([First_Transdate]) 
		   FROM [�����q�c��].[dbo].[�|������ɪ��~��_�B�ê��A])*1.0) [Buy_Percent]--�p��~�ּh���
FROM [�����q�c��].[dbo].[�|������ɪ��~��_�B�ê��A]
GROUP BY [AGE_Level]
ORDER BY 1
GO
