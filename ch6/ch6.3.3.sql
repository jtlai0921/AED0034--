/*6-3-3	�i���\�ҡФ��R���*/
--1.�uGROUP BY�иs�դƱԭz�v�v
USE [�����q�c��]
GO

SELECT	[Productname],
		COUNT([TransactionID]) [�q��ƶq],
		SUM([Money]) [�q���`�B],
		AVG([Money]) [�����浧�q����B],
		MAX([Money]) [�̤j�浧�q����B],
		MIN([Money]) [�̤p�浧�q����B]
FROM [dbo].[GMC_TransDetail]
GROUP BY [Productname]
GO

--2.�u�J�`�L�o�z��]HAVING�^�v�v
USE �����q�c��
GO

SELECT	[Productname],
		COUNT([TransactionID]) [�q��ƶq],
		SUM([Money]) [�q���`�B],
		AVG([Money]) [�����浧�q����B],
		MAX([Money]) [�̤j�浧�q����B],
		MIN([Money]) [�̤p�浧�q����B]
FROM [dbo].[GMC_TransDetail]
GROUP BY [Productname]
HAVING COUNT([TransactionID]) >=10000 --�q��ƶq�ܤ�1�U��
GO

--3.�u��ƦX�֡]UNION�MUNION ALL�^�v
USE [�����q�c��]
GO

SELECT	[MemberID],
		'VIP�|��' [GROUP_NAME],
		[Birthday],
		[Occupation],
		[Channel]
FROM [dbo].[VIP_Profile]
 UNION ALL
SELECT	[MemberID],
		'�@��|��' [GROUP_NAME],
		[Birthday],
		[Occupation],
		[Channel]
FROM [dbo].[GMC_Profile]
GO

--4.�u�����V�]PIVOT�MUNPIVOT�^�v
--PVIOT���O
SELECT	TT.Channel [�|���ӷ��޹D�H��],
		[2000],
		[2001],
		[2002],
		[2003]
		[2004],
		[2005],
		[2006],
		[2007]
FROM (	SELECT	Channel,
				[MemberID],
				DATEPART(YEAR,[Start_date]) [YEAR]
		FROM [�����q�c��].[dbo].[GMC_Profile]	) TT
PIVOT ( COUNT([MemberID])
		FOR [YEAR] IN([2000],[2001],[2002],[2003],[2004],[2005],[2006],[2007])) TT
ORDER BY 1
GO

--�ϥ�CASE�F��PIVOT�ĪG
SELECT	Channel [�|���ӷ��޹D�H��],
		COUNT( CASE  WHEN DATEPART(YEAR,[Start_date])=2000 THEN [MemberID] ELSE NULL END) [2004],
		COUNT( CASE  WHEN DATEPART(YEAR,[Start_date])=2001 THEN [MemberID] ELSE NULL END) [2005],
		COUNT( CASE  WHEN DATEPART(YEAR,[Start_date])=2002 THEN [MemberID] ELSE NULL END) [2006],
		COUNT( CASE  WHEN DATEPART(YEAR,[Start_date])=2003 THEN [MemberID] ELSE NULL END) [2007],
		COUNT( CASE  WHEN DATEPART(YEAR,[Start_date])=2004 THEN [MemberID] ELSE NULL END) [2004],
		COUNT( CASE  WHEN DATEPART(YEAR,[Start_date])=2005 THEN [MemberID] ELSE NULL END) [2005],
		COUNT( CASE  WHEN DATEPART(YEAR,[Start_date])=2006 THEN [MemberID] ELSE NULL END) [2006],
		COUNT( CASE  WHEN DATEPART(YEAR,[Start_date])=2007 THEN [MemberID] ELSE NULL END) [2007]
FROM [�����q�c��].[dbo].[GMC_Profile]
GROUP BY Channel
ORDER BY 1
GO

--UNPVIOT���O
--1.�إߨϥθ�ƪ�
USE [�����q�c��]
GO

CREATE TABLE [dbo].[UNPVIOT_SQL]
(	ID INT,--�s��
	ITEM_NAME NVARCHAR(20),--�W��
	DATE_NAME CHAR(8),--�O�s����
	PRICE MONEY	)--����
GO

--2.�פJ���ո��
INSERT INTO [�����q�c��].[dbo].[UNPVIOT_SQL] VALUES(1,'�ζ]','20140506',20)
INSERT INTO [�����q�c��].[dbo].[UNPVIOT_SQL] VALUES(2,'�ζ]','20150506',20)
INSERT INTO [�����q�c��].[dbo].[UNPVIOT_SQL] VALUES(3,'�i�֦h','20160101',10)
INSERT INTO [�����q�c��].[dbo].[UNPVIOT_SQL] VALUES(4,'�i�֦h','20160501',10)
INSERT INTO [�����q�c��].[dbo].[UNPVIOT_SQL] VALUES(5,'�i�֦h','20160901',10)
INSERT INTO [�����q�c��].[dbo].[UNPVIOT_SQL] VALUES(6,'�ªQ�F�h','20170120',30)
INSERT INTO [�����q�c��].[dbo].[UNPVIOT_SQL] VALUES(7,'���j�O','20161115',35)
INSERT INTO [�����q�c��].[dbo].[UNPVIOT_SQL] VALUES(8,'���j�O','20161001',35)
INSERT INTO [�����q�c��].[dbo].[UNPVIOT_SQL] VALUES(9,'�_��','20151210',25)
INSERT INTO [�����q�c��].[dbo].[UNPVIOT_SQL] VALUES(10,'��F','20160505',28)

--3.�d�ߵ��G
SELECT * FROM [�����q�c��].[dbo].[UNPVIOT_SQL] GO


--4.�ϥ�UNPIVOT���O
SELECT [ID],ATTRIBUTE [COLUMN_NAME],VALUE [VALUES]
FROM (
SELECT	[ID],
		CAST(ITEM_NAME AS SQL_VARIANT) [���ƦW��],
		CAST(DATE_NAME AS SQL_VARIANT) [�O�s����],
		CAST(PRICE AS SQL_VARIANT) [����]
FROM [�����q�c��].[dbo].[UNPVIOT_SQL]) AA
	UNPIVOT
(
 VALUE FOR ATTRIBUTE IN([���ƦW��],[�O�s����],[����])
) BB
ORDER BY [ID]
GO
