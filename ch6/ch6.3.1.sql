/*6-3-1	�򥻥\�ҡЬd�߸��*/
--1.�uSELECT���榡�]1�^�п�ܡ]�οz��^�v
USE [�����q�c��]
GO

SELECT [MemberID] FROM [dbo].[GMC_Profile]
GO

--2.�uSELECT���榡�]2�^�ЧO�W�v
USE �����q�c��
GO

SELECT	[MemberID] AS �|���s��, --�ϥ�AS
		[MemberID] [�|���s��], --�ϥΤ��A��
		[MemberID] �|���s�� --�L�ϥΤ��A��
FROM [dbo].[GMC_Profile]
GO

--3.�u���󦡿z��]WHERE�^�[����B��l�]�p��B�j��B����K�^�v
SELECT [MemberID],[Sex],[Occupation]
FROM [�����q�c��].[dbo].[GMC_Profile]
WHERE [SEX]='F'
AND [Occupation]='�A�Ȥu�@�H��' 
AND [Start_date]>='2007-01-01'
GO

--4.�u���󦡿z��]WHERE�^�[�޿�B��l�]AND�BOR�BNOT�K�^�v
--AND
SELECT [MemberID],[Sex],[Occupation]
FROM [�����q�c��].[dbo].[GMC_Profile]
WHERE [SEX]='F'
AND [Occupation]='�A�Ȥu�@�H��' AND [Start_date]>='2007-01-01'
GO

--OR
SELECT [MemberID],[Sex],[Occupation]
FROM [�����q�c��].[dbo].[GMC_Profile]
WHERE SEX='F'
AND ( [Occupation]='�A�Ȥu�@�H��' OR [Occupation]='��F�ΥD�ޤH��' )
AND [Start_date]>='2007-01-01'
GO

--NOT
SELECT [MemberID],[Sex],[Occupation]
FROM [�����q�c��].[dbo].[GMC_Profile]
WHERE NOT ( [Occupation]='�A�Ȥu�@�H��' OR [Occupation]='��F�ΥD�ޤH��' )
AND [Sex]='F'

--5.�u���󦡿z��]WHERE�^�[�϶��B��l�]BETWEEN�KAND�K�^�v
SELECT *
FROM [�����q�c��].[dbo].[VIP_TransDetail]
WHERE [Trans_Createdate] BETWEEN '2006-01-01' AND '2006-06-30'
AND [Productname]='�����s�~(�])'
GO

--6.�u���󦡿z��]WHERE�^�[���϶��B��l�]IN�^�v
SELECT	*
FROM [�����q�c��].[dbo].[GMC_Profile]
WHERE [Occupation] IN('��F�ΥD�ޤH��','�B��]�ƾާ@�u','�ʷ��Φ��z�H��','�޳N�ʤH��')
AND [Channel] IN ('Voluntary','Advertising')
GO

--7.�u�ϥ�LIKE����v
--�ϥ�'%d%'
SELECT [MemberID],[Sex],[Birthday],[Occupation],[Channel]
FROM [�����q�c��].[dbo].[GMC_Profile]
WHERE [Channel] LIKE'%d%'
GO

--�ϥ�'%d'
SELECT [MemberID],[Sex],[Birthday],[Occupation],[Channel]
FROM [�����q�c��].[dbo].[GMC_Profile]
WHERE [Channel] LIKE'%d'
GO

--�ϥ�'%d'
SELECT [MemberID],[Sex],[Birthday],[Occupation],[Channel]
FROM [�����q�c��].[dbo].[GMC_Profile]
WHERE [Channel] LIKE'd%'
GO

--8.�uNULL���ϥΡv
--�]WHERE �[ NULL)
SELECT	*
FROM [�����q�c��].[dbo].[GMC_Profile]
WHERE Occupation IS NULL
GO

--�]SELECT �[ NULL)
SELECT [MemberID], [Occupation], [Location], NULL [���w��]
FROM [�����q�c��].[dbo].[GMC_Profile]
GO

--9.�uTOP���ϥΡv
SELECT	TOP 100 [MemberID],[Occupation],[Location],[Start_date]
FROM [�����q�c��].[dbo].[GMC_Profile]
ORDER BY [Start_date]
GO

--10.�uTABLESAMPLE���ϥΡv
--�ϥμƦr
SELECT	*
FROM [�����q�c��].[dbo].[GMC_Profile]
TABLESAMPLE(1000 ROWS)
ORDER BY [Start_date]
GO

--�ϥμƦr�÷f�tTOP
SELECT	TOP 1000 *
FROM [�����q�c��].[dbo].[GMC_Profile]
TABLESAMPLE(2000 ROWS)
ORDER BY [Start_date]
GO

--�ϥΦʤ���
SELECT	*
FROM [�����q�c��].[dbo].[GMC_Profile]
TABLESAMPLE(10 PERCENT)
ORDER BY [Start_date]
GO


--11.�u���w��ܱƧǡ]ORDER BY�^�v
SELECT	[MemberID],
		[Sex],
		[Birthday] [�ͤ�],
		[Marriage],
		[Occupation],
		[Location],
		[Channel], 
		[Start_date],
		[End_date]
FROM [�����q�c��].[dbo].[GMC_Profile]
ORDER BY [�ͤ�] ASC, --�ϥΧO�W
		 [Start_date] DESC, --�ϥθ�Ʀ�
		 4 --�ϥμƦr
GO

--12.�u�r��զX�v
--�r��ϥΤ覡�]1�^
SELECT	'���u�򥻸��' [����],
		[MemberID] [���u�s��],
		[Occupation] [�q��¾�~����],
		[Start_date] [��¾��],
		[End_date] [��¾��]
FROM [�����q�c��].[dbo].[GMC_Profile]
GO

--�r��ϥΤ覡�]2�^
SELECT '���u�s���G '+ [MemberID]+', �ͤ�G '+ RTRIM(LTRIM(CAST(CAST([Birthday] AS DATE) AS CHAR)))+' ,¾�~�G'+[Occupation]
FROM [�����q�c��].[dbo].[GMC_Profile]
GO

--13.�u�h�����ơ]DISTINCT�^�v
SELECT DISTINCT [Channel]
FROM [�����q�c��].[dbo].[GMC_Profile]
GO

--14.�u�h�����ơ]DISTINCT�^�v
USE [�����q�c��]
GO

SELECT	[MemberID],
		[Sex],
		CASE WHEN [Sex]='M' THEN '�k��'
			 WHEN [Sex]='F' THEN '�k��'
		ELSE NULL END AS [�ʧO]
FROM [dbo].[GMC_Profile]
GO

