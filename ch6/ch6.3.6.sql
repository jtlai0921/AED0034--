/*6-3-6	��ƪ��s�W�B�R���P����*/
-- �@�B�u��Ʒs�W�v
--1.SELECT �KINTO�K
--(1)�s�W�����ƪ�
USE [�����q�c��]
GO

SELECT	TOP 100 *,--�즳��List���W��
				DATEPART(YEAR,[Start_date]) [NEW_STATS_DATE] --�s�����W��
INTO [dbo].[GMC_Profile_TOP100]--�ϥ�INTO�P�ɷs�W�إ߸�ƪ�ʧ@
FROM [dbo].[GMC_Profile]
GO

--(2)�s�W�Ȧs��ƪ�
USE [�����q�c��]
GO

SELECT	TOP 1000 *,--�즳��List���W��
				DATEPART(YEAR,[Start_date]) [NEW_STATS_DATE] --�s�����W��
INTO #GMC_Profile_TOP1000--�ϥ�INTO�f�t#�Ÿ�,�P�ɷs�W�إ߼Ȧs��ƪ�ʧ@
FROM [dbo].[GMC_Profile]
GO

--(3)���ͪťո�ƴ�
USE [�����q�c��]
GO

SELECT	*--�즳��List���W��
INTO [dbo].[GMC_Profile_ETL]--�ϥ�INTO�P�ɷs�W�إ߸�ƪ�ʧ@
FROM [dbo].[GMC_Profile]
WHERE 1=2--����List���W��,���s�W���
GO

--2.CREATE TABLE �f�t INSERT INTO
--(1)�ϥ�INSERT INTO���w�����Ʀ�
/*�إ߷|���򥻸�ƪ��c�A�R�W���u[dbo].[GMC_Profile_Same]�v*/

USE [�����q�c��]
GO

CREATE TABLE [dbo].[GMC_Profile_Same]
(
	MemberID NVARCHAR (255) NULL,
	Sex NVARCHAR (255) NULL,
	Birthday DATETIME NULL,
	Marriage NVARCHAR (255) NULL,
	Occupation NVARCHAR (255) NULL,
	Location NVARCHAR (255) NULL,
	Channel NVARCHAR (255) NULL,
	Start_date DATETIME NULL,
	End_date DATETIME NULL
)
GO

/*INSERT INTO 5���|���򥻸��*/
INSERT INTO [dbo].[GMC_Profile_Same] 
(	MemberID, Sex , Birthday, Marriage, Occupation, Location, Channel, Start_date, End_date)

VALUES ('DM000001', 'F', '1984-10-21', '2', '�A�Ȥu�@�H��', '���ƿ����ƥ�', 'Advertising', '2006-11-23', '2007-11-23'),
			  ('DM000002', 'F', '1962-10-17', '1', '�A�Ȥu�@�H��', '�x�n���w�n��', 'Voluntary',	 '2006-11-23', '2007-11-23'),
			  ('DM000003', 'F', '1981-06-10', '2', '��F�ΥD�ޤH��', '�������򤺶m', 'Voluntary', '2006-11-23', '2007-11-23'),
			  ('DM000004', 'F', '1981-09-17', '2', '�޳N�ʤH��', '�������j���m', 'DM', '2006-11-23', '2007-11-23'),
			  ('DM000005', 'M', '1951-09-25', '1', '��F�ΥD�ޤH��', '�x���������', 'DM',	'2006-11-23', '2007-11-23')
GO


/*�d�� 5���|���򥻸��*/
SELECT * FROM  [dbo].[GMC_Profile_Same] GO

--(2)�ϥ�INSERT INTO���w������Ʀ�

/*INSERT INTO 5���|���򥻸��*/
INSERT INTO [dbo].[GMC_Profile_Same] 
(	MemberID, Sex , Birthday, Marriage, Occupation, Location, Channel, Start_date, End_date)

VALUES ('DM000006', 'F', '1984-10-21', '2', NULL, NULL, 'Advertising', '2006-11-23', '2007-11-23'),
			  ('DM000007', NULL, '1962-10-17', '1', '�A�Ȥu�@�H��', '�x�n���w�n��', 'Voluntary',	 '2006-11-23', '2007-11-23'),
			  ('DM000008', 'F', NULL, '2', '��F�ΥD�ޤH��', '�������򤺶m', 'Voluntary', '2006-11-23', '2007-11-23'),
			  ('DM000009', 'F', '1981-09-17', '2', NULL, '�������j���m', 'DM', '2006-11-23', '2007-11-23'),
			  ('DM000010', 'M', '1951-09-25', '1', '��F�ΥD�ޤH��', '�x���������', 'DM',	'2006-11-23', NULL)
GO

/*�d�� 10���|���򥻸��(NULL)*/
SELECT * FROM  [dbo].[GMC_Profile_Same] GO


--�G�B�u��ƧR���v
--(1) �ϥ�SQL Server Management Studio�����R����ƪ����

--�H���إߤ@�i1000����ƪ���ƪ�
USE [�����q�c��]
GO

SELECT	TOP 1000 * --�즳��List���W�٥[�W�H���D��1000�����
INTO [dbo].[GMC_Profile_Top1000] --�ϥ�INTO�P�ɷs�W�إ߸�ƪ�ʧ@
FROM [dbo].[GMC_Profile]
GO


--(2)�ϥ�SQL Server Management Studio�����R����ƪ�

--(3)DELETE���O
--1.�إ�[dbo].[GMC_Profile_COPY]��ƪ�
USE [�����q�c��]
GO

SELECT	* --�즳��List���W��
INTO [dbo].[GMC_Profile_COPY] --�ϥ�INTO�P�ɷs�W�إ߸�ƪ�ʧ@
FROM [dbo].[GMC_Profile]
GO

--2.�R���J�|����b2007�~���|��
USE [�����q�c��]
GO

DELETE FROM [dbo].[GMC_Profile_COPY]
WHERE DATEPART(YEAR,Start_date)='2007'
GO

--3.�Q��COUNT()�d�߳Ѿl��Ƶ���
USE [�����q�c��]
GO

SELECT COUNT(*) FROM [dbo].[GMC_Profile_COPY] GO

--(4)TRUNCATE���O
--1.�ϥ�TRUNCATE���O�R��[dbo].[GMC_Profile_COPY]��ƪ����
USE [�����q�c��]
GO

TRUNCATE TABLE [dbo].[GMC_Profile_COPY]

--2.�d�߳Ѿl���
USE [�����q�c��]
GO

SELECT * FROM [dbo].[GMC_Profile_COPY] GO

--(5)DROP���O
--1.�ϥ�DROP���O�R��[dbo].[GMC_Profile_COPY]��ƪ�
USE [�����q�c��]
GO

DROP TABLE [dbo].[GMC_Profile_COPY]

--2.�d��[dbo].[GMC_Profile_COPY]��ƪ�Ѿl���
USE [�����q�c��]
GO

/*�T ��Ƨ�s*/
--(1) UPDATE���򥻨ϥ�
--1.�إ�[dbo].[[dbo].[Product_Detail_COPY]��ƪ�
USE [�����q�c��]
GO

SELECT	* --�즳��List���W��
INTO [dbo].[Product_Detail_COPY] --�ϥ�INTO�P�ɷs�W�إ߸�ƪ�ʧ@
FROM [dbo].[Product_Detail]
GO

--2.�ϥ�UPDATE���O�A�պ�[dbo].[Product_Detail_COPY] ��Price(���)��1.2��
USE [�����q�c��]
GO

UPDATE [dbo].[Product_Detail_COPY]
SET Price=Price*1.2
GO

--3.�d��[dbo].[Product_Detail_COPY] ��Price(���)���G
USE [�����q�c��]
GO

SELECT	ProductID,
				Productname,
				Price 
FROM [dbo].[Product_Detail_COPY] GO

--(2)UPDATE�f�tCASE�ϥ�

/*1.���P���uPrice�v�϶��A�պ����P�ʤ���
���󬰡uPrice�v�b1000�H�U�պ���1.2��
�F�uPrice�v����1001~2000�պ���1.5���F
�uPrice�v�W�L2000�պ���1.8��*/
USE [�����q�c��]
GO

UPDATE [dbo].[Product_Detail_COPY] 
SET Price =
CASE 
	 WHEN Price <=1000 THEN  Price*1.2
	 WHEN Price BETWEEN 1001 AND 2000 THEN  Price*1.5
	 WHEN Price >2000 THEN  Price*1.8
END
GO


--2.�d��[dbo].[Product_Detail_COPY] ��Price(���)���G
USE [�����q�c��]
GO

SELECT	ProductID,
				Productname,
				Price 
FROM [dbo].[Product_Detail_COPY] GO

/*�| ��X���*/

/* �� �P�_��ƪ�O�_�s�b*/

--(1) �ϥ�IF EXISTS �K DROP TABLE�K
USE [�����q�c��]
GO

SELECT	TOP 100 *,--�즳��List���W��
				DATEPART(YEAR,[Start_date]) [NEW_STATS_DATE] --�s�����W��
INTO [dbo].[GMC_Profile_TOP100]--�ϥ�INTO�P�ɷs�W�إ߸�ƪ�ʧ@
FROM [dbo].[GMC_Profile]
GO

--(2) �ϥ�IF OBJECT_ID �K IS NOT NULL DROP TABLE�K