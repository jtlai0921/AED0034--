/*6-3-2	�������*/
/*�@�B�r����*/
--1.�uLOWER()�MUPPER()�Фj�p�g�ഫ�v
SELECT	TOP 100 [MemberID],
		[Channel],
		LOWER([Channel]) [��j�g],
		UPPER([Channel]) [��p�g]
FROM [�����q�c��].[dbo].[GMC_Profile]
GO

--2.�uRIGHT�MLEFT�аw����w��Ʀ�Φr��A�q�k��Υ����^�����w�r�ƪ��r��v
SELECT	TOP 100 [MemberID],
		[Location],
		LEFT([Location],3) [�����䳡���r��],
		RIGHT([Location],3) [���k�䳡���r��]
FROM [�����q�c��].[dbo].[GMC_Profile]
GO

--3.�uLEN�Эp��r���ơFDATALENGTH�Эp��줸�ռơv
SELECT	[MemberID],
		[Location],
		LEN([Location]) [�r����],--1�Ӧr����1�Ӧr��
		DATALENGTH([Location]) [�줸�ռ�],--1�Ӧr����2�Ӧr��
		DATALENGTH([Location]+' ') [�[�W�Ů檺�줸�ռ�]--1�ӪŮ浥��2�Ӧr��
FROM [�����q�c��].[dbo].[GMC_Profile]
GO

--4.�uRTRIM�MLTRIM�аw����w��Ʀ�Φr��A�q�k��Υ��䲾���ťզr���v
SELECT	[MemberID],
		[Occupation],
		'    '+[Occupation]+'   ' [���k�[�W�ťզr��],
		LTRIM('    '+[Occupation]+'    ') [��������ťզr��],
		RTRIM('    '+[Occupation]+'    ') [�����k��ťզr��],
		RTRIM(LTRIM('    '+[Occupation]+'   ')) [�������k��ťզr��]
FROM [�����q�c��].[dbo].[GMC_Profile]
GO

--5.�uSUBSTRING�аw����w�r��A�q�}�l��m��X�ݭn���r��v
SELECT	[MemberID],
		[Location],
		LEN([Location]) [�p��r����],
		SUBSTRING([Location],1,3) [���e3�Ӧr�����],
		SUBSTRING([Location],4,6) [����3�Ӧr�����]
FROM [�����q�c��].[dbo].[GMC_Profile]
GO

--6.�uREPLACE�Ш��N�r��\��A�q������Φr�ꤤ�A�w��󴫦r��i��m���v
SELECT	[MemberID],
		REPLACE([MemberID],'DM','BEN') [NEW_MemberID_1],--�r����N�r��ζ�
		REPLACE([MemberID],'DM',1) [NEW_MemberID_2],--�r����N�Ʀr�ζ�
		REPLACE([Marriage],1,4) [NEW_Marriage_1],--�Ʀr���N�Ʀr�ζ�
		REPLACE([Marriage],1,'���B') [NEW_Marriage_2]--�Ʀr���N�r��ζ�
FROM [�����q�c��].[dbo].[GMC_Profile]
GO

/*�G�B�ɶ����*/

--1.�u�@�����SYSDATETIME(), SYSUTCDATETIME(), SYSDATETIMEOFFSET() ���t���v
SELECT	SYSDATETIME() [�{�b�ɶ�],
		SYSUTCDATETIME() [�{�b��ڼзǮɶ�],
		SYSDATETIMEOFFSET() [�{�b�ɶ��P�ɰ�]
GO

--2.�uSWITCHOFFSET()�Эp�⤣�P�ɰϪ��{�b�ɶ��v
SELECT	SWITCHOFFSET(SYSDATETIMEOFFSET(), '-07:00') [�[�{��a�ɶ�],
		SWITCHOFFSET(SYSDATETIMEOFFSET(), '+08:00') [�x�W��a�ɶ�]
		/*�[�{�M�x�W�ۮt15�Ӥp��*/
GO

--3.�u�@�����CURRENT_TIMESTAMP, GETDATE(), GETUTCDATE() �� ���A�ѩ��������t���A�@�~�t�ΩҦb+8�ɰϩM��ڼзǮɶ��ɰϮt���v
SELECT	CURRENT_TIMESTAMP [�ثe����M�ɶ�],
		GETDATE() [�ثe����M�ɶ�],
		GETUTCDATE() [��ڼзǤ���M�ɶ�]
GO

--4.�uDATEADD�Хi�䴩TIME, DATE, SMALLDATETIME, DATETIME, DATETIME2��DATETIMEOFFSET���B��v
SELECT	DATEADD(DD,12,'2017-01-01') [�W�[12�Ѽ�],
		DATEADD(MM,12,'2017-01-01') [�W�[12�Ӥ�],
		DATEADD(YY,12,'2017-01-01') [�W�[12�Ӧ~]
GO

--5.�uDATEDIFF�Эp���Ӥ���ɶ����t�A���G�i���ѼơB��ƩM�~�ơv
SELECT	DATEDIFF(DAY,'2016-01-01','2017-01-01') [��Ӥ���ѼƮt],
		DATEDIFF(MONTH,'2016-01-01','2017-01-01') [��Ӥ����Ʈt],
		DATEDIFF(YEAR,'2016-01-01','2017-01-01') [��Ӥ���~�Ʈt]
GO

--6.�uDATEPART�PDATENAME�Ш�̳��O�^�ǫ��w����A�D�n�t�����e�̬O�Ʀr�A��̬O��r�F���w�����i���P���B��B��B�u�B�~���v
SELECT	DATEPART(DW,'2017-01-08') [�P���X_�Ʀr],--�P����(�Ʀr1)�}�l�A�P����(�Ʀr7)����
		DATENAME(DW,'2017-01-08') [�P���X_��r]
GO

--7.�uYEAR, MONTH ,DAY�����Ρе��P��DATEPART�v
SELECT	YEAR('2017-01-08') [�~],
		MONTH('2017-01-08') [��],
		DAY('2017-01-08') [��]
GO

/*�|�B�ഫ���*/
--1.�uCONVERT��������CAST�v
SELECT CONVERT(VARCHAR(12), GETDATE(),100)
SELECT CONVERT(VARCHAR(12), GETDATE(),101)
SELECT CONVERT(VARCHAR(12), GETDATE(),102)
SELECT CONVERT(VARCHAR(12), GETDATE(),103)
SELECT CONVERT(VARCHAR(12), GETDATE(),104)
SELECT CONVERT(VARCHAR(12), GETDATE(),105)
SELECT CONVERT(VARCHAR(12), GETDATE(),106)
SELECT CONVERT(VARCHAR(12), GETDATE(),107)
SELECT CONVERT(VARCHAR(12), GETDATE(),108)
SELECT CONVERT(VARCHAR(12), GETDATE(),109)
SELECT CONVERT(VARCHAR(12), GETDATE(),110)
SELECT CONVERT(VARCHAR(12), GETDATE(),111)
SELECT CONVERT(VARCHAR(12), GETDATE(),112)
SELECT CONVERT(VARCHAR(12), GETDATE(),113) 
SELECT CONVERT(VARCHAR(12), GETDATE(),114)
SELECT CONVERT(VARCHAR(12), GETDATE(),121)

--2.�uCAST��������CONVERT�v
SELECT	[MemberID],
		CAST([MemberID] AS CHAR(5)) [MemberID_CHAR(5)_TYPE],--�I�_
		CAST([MemberID] AS VARBINARY(MAX)) [MemberID_VARBINARY(MAX)_TYPE]
FROM [�����q�c��].[dbo].[GMC_Profile]
GO

/*���B�{�Ѧ��Ǩ��*/
--1.�uROW_NUMBER�v
SELECT	[MemberID],
		[TTL_Price],
		ROW_NUMBER() OVER(ORDER BY [TTL_Price]) AS TTL_Price_Rank
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--�Ҫ᪺��
		FROM [�����q�c��].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID])AA
ORDER BY 3

--2.�uRANK�v
SELECT	[MemberID],
		[TTL_Price],
		RANK() OVER(ORDER BY [TTL_Price]) AS TTL_Price_Rank
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--�Ҫ᪺��
		FROM [�����q�c��].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID])AA
ORDER BY 3

--3.�uDENSE_RANK�v
SELECT	[MemberID],
		[TTL_Price],
		DENSE_RANK() OVER(ORDER BY [TTL_Price]) AS TTL_Price_Rank
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--�Ҫ᪺��
		FROM [�����q�c��].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID])AA
ORDER BY 3

--4.�uNTILE�v
SELECT	[MemberID],
		[TTL_Price],
		NTILE(5) OVER(ORDER BY [TTL_Price]) AS TTL_Price_NTILE--��5��
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--�Ҫ᪺��
		FROM [�����q�c��].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID])AA
WHERE TTL_Price>=150000
ORDER BY 3

--5.�u�@������ƧǨ�ơv
SELECT	[TTL_Price],
		ROW_NUMBER() OVER(ORDER BY [TTL_Price]) AS TTL_Price_ROW_NUMBER,
		RANK() OVER(ORDER BY [TTL_Price]) AS TTL_Price_RANK,
		DENSE_RANK() OVER(ORDER BY [TTL_Price]) AS TTL_Price_DENSE_RANK,
		NTILE(30) OVER(ORDER BY [TTL_Price]) AS TTL_Price_NTILE
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--�Ҫ᪺��
		FROM [�����q�c��].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID])AA
WHERE TTL_Price BETWEEN 60000 AND 80000
ORDER BY 1

/*���B�ƧǨ�ƥ[�WPARTITION BY�޼�*/
--1.�uROW_NUMBER( ) + PARTITION BY�v
SELECT	[MemberID],
		[Productname],
		ROW_NUMBER() OVER(PARTITION BY [MemberID] ORDER BY [Productname]) AS Product_Seq,--�C�ӤH�ʶR�X�ز��~(�Ǹ�)
		[TTL_Price]
FROM (	SELECT	[MemberID],
				[Productname],
				SUM([Money]) [TTL_Price]--�Ҫ᪺��
		FROM [�����q�c��].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID],[Productname])AA
ORDER BY 1,3

--2.�uRANK( ) + PARTITION BY�v
SELECT	[MemberID],
		[Productname],
		[TTL_Price],
		RANK() OVER(PARTITION BY [MemberID] ORDER BY [TTL_Price] DESC) AS Price_Rank --�C�ӤH��O(�ƦW)
FROM (	SELECT	[MemberID],
				[Productname],
				SUM([Money]) [TTL_Price]--�Ҫ᪺��
		FROM [�����q�c��].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID],[Productname])AA
ORDER BY 1,4

--3.�uDENSE_RANK( ) + PARTITION BY�v
SELECT	[MemberID],
		[Productname],
		[TTL_Price],
		DENSE_RANK() OVER(PARTITION BY [MemberID] ORDER BY [TTL_Price] DESC) AS Price_Rank --�C�ӤH��O(�ƦW)
FROM (	SELECT	[MemberID],
				[Productname],
				SUM([Money]) [TTL_Price]--�Ҫ᪺��
		FROM [�����q�c��].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID],[Productname])AA
ORDER BY 1,4

--4.�uNTILE + PARTITION BY�v
SELECT	[MemberID],
		[Productname],
		[TTL_Price],
		NTILE(5) OVER(PARTITION BY [MemberID] ORDER BY [TTL_Price]) AS TTL_Price_NTILE--�C�ӤH�d�ߵ��G��5��
FROM (	SELECT	[MemberID],
				[Productname],
				SUM([Money]) [TTL_Price]--�Ҫ᪺��
		FROM [�����q�c��].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID],[Productname])AA
ORDER BY 1
