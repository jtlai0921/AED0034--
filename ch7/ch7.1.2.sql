/*7-1-2	�|���򥻸�ƾ�z�бB�ê��A*/
--exercise1
--1.���s�s�X�u�B�ê��A�]Marriage�^�v���ﶵ����
SELECT	[MemberID],[Occupation],
		CASE WHEN [Marriage]='1' THEN '���B'
			 WHEN [Marriage]='2' THEN '�w�B'
		ELSE '��L' END AS [Marriage_Status]
FROM [�����q�c��].[dbo].[GMC_Profile]
GO

--GMC�|��
--2.1 ��X�u�B�ê��A�]Marriage�^�v�P�u�~��a�]Location�^�v�A�x�s��[dbo].[GMC_Profile_new]
IF OBJECT_ID (N'[�����q�c��].[dbo].[GMC_Profile_new]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[GMC_Profile_new];

SELECT	[MemberID], [Sex], [Birthday],
		CASE WHEN [Marriage]='1' THEN '���B'
			 WHEN [Marriage]='2' THEN '�w�B'
		ELSE '��L' END AS [Marriage_Status],
		[Occupation],
		CASE WHEN SUBSTRING([Location],1,3)='�O�_��' THEN '�x�_��'
			 WHEN SUBSTRING([Location],1,3)='�O�_��' THEN '�s�_��'
			 WHEN SUBSTRING([Location],1,3)='�O����' THEN '�x����'
			 WHEN SUBSTRING([Location],1,3)='�O�F��' THEN '�x�F��'
			 WHEN SUBSTRING([Location],1,3)='�O�_��' THEN '�x�_��'
			 WHEN SUBSTRING([Location],1,3)='�x����' THEN '�x����'
			 WHEN SUBSTRING([Location],1,3)='�x����' THEN '�x����'
			 WHEN SUBSTRING([Location],1,3)='�x�_��' THEN '�x�_��'
			 WHEN SUBSTRING([Location],1,3)='�x�_��' THEN '�s�_��'
			 WHEN SUBSTRING([Location],1,3)='�x�F��' THEN '�x�F��'
			 WHEN SUBSTRING([Location],1,3)='�x�F��' THEN '�x�F��'
			 WHEN SUBSTRING([Location],1,3)='�x�n��' THEN '�x�n��'
			 WHEN SUBSTRING([Location],1,3)='�x�n��' THEN '�x�n��'
			 WHEN SUBSTRING([Location],1,3)='�y����' THEN '�y����'
			 WHEN SUBSTRING([Location],1,3)='�y����' THEN '�y����'
		 	 WHEN SUBSTRING([Location],1,3)='�Ὤ��' THEN '�Ὤ��'
			 WHEN SUBSTRING([Location],1,3)='�Ὤ��' THEN '�Ὤ��'
			 WHEN SUBSTRING([Location],1,3)='������' THEN '������'
			 WHEN SUBSTRING([Location],1,3)='�n�륫' THEN '�n�뿤'
			 WHEN SUBSTRING([Location],1,3)='�n�뿤' THEN '�n�뿤'
			 WHEN SUBSTRING([Location],1,3)='�̪F��' THEN '�̪F��'
			 WHEN SUBSTRING([Location],1,3)='�̪F��' THEN '�̪F��'
			 WHEN SUBSTRING([Location],1,3)='�]�ߥ�' THEN '�]�߿�'
			 WHEN SUBSTRING([Location],1,3)='�]�߿�' THEN '�]�߿�'
			 WHEN SUBSTRING([Location],1,3)='��饫' THEN '��鿤'
			 WHEN SUBSTRING([Location],1,3)='��鿤' THEN '��鿤'
			 WHEN SUBSTRING([Location],1,3)='������' THEN '������'
			 WHEN SUBSTRING([Location],1,3)='������' THEN '������'
			 WHEN SUBSTRING([Location],1,3)='�򶩥�' THEN '�򶩥�'
			 WHEN SUBSTRING([Location],1,3)='�s����' THEN '�s����'
			 WHEN SUBSTRING([Location],1,3)='���L��' THEN '���L��'
			 WHEN SUBSTRING([Location],1,3)='�s�˥�' THEN '�s�˥�'
			 WHEN SUBSTRING([Location],1,3)='�s�˿�' THEN '�s�˿�'
			 WHEN SUBSTRING([Location],1,3)='�Ÿq��' THEN '�Ÿq��'
			 WHEN SUBSTRING([Location],1,3)='�Ÿq��' THEN '�Ÿq��'
			 WHEN SUBSTRING([Location],1,3)='���ƥ�' THEN '���ƿ�'
			 WHEN SUBSTRING([Location],1,3)='���ƿ�' THEN '���ƿ�'
			 WHEN SUBSTRING([Location],1,3)='���' THEN '���'
		ELSE '��L' END AS [COUNTY],--�����O
		[Channel], [Start_date], [End_date]
INTO [�����q�c��].[dbo].[GMC_Profile_new]
FROM [�����q�c��].[dbo].[GMC_Profile]
GO

--2.2 �d�� [�����q�c��].[dbo].[GMC_Profile_new]
SELECT * FROM [�����q�c��].[dbo].[GMC_Profile_new] GO


--VIP�|��
--2.1 ��X�u�B�ê��A�]Marriage�^�v�P�u�~��a�]Location�^�v�A�x�s��[dbo].[VIP_Profile_new]
IF OBJECT_ID (N'[�����q�c��].[dbo].[VIP_Profile_new]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[VIP_Profile_new];

SELECT	[MemberID], [Sex], [Birthday], 
		CASE WHEN [Marriage]='1' THEN '���B'
			 WHEN [Marriage]='2' THEN '�w�B'
		ELSE '��L' END AS [Marriage_Status],
		[Occupation],
		CASE WHEN SUBSTRING([Location],1,3)='�O�_��' THEN '�x�_��'
			 WHEN SUBSTRING([Location],1,3)='�O�_��' THEN '�s�_��'
			 WHEN SUBSTRING([Location],1,3)='�O����' THEN '�x����'
			 WHEN SUBSTRING([Location],1,3)='�O�F��' THEN '�x�F��'
			 WHEN SUBSTRING([Location],1,3)='�O�_��' THEN '�x�_��'
			 WHEN SUBSTRING([Location],1,3)='�x����' THEN '�x����'
			 WHEN SUBSTRING([Location],1,3)='�x����' THEN '�x����'
			 WHEN SUBSTRING([Location],1,3)='�x�_��' THEN '�x�_��'
			 WHEN SUBSTRING([Location],1,3)='�x�_��' THEN '�s�_��'
			 WHEN SUBSTRING([Location],1,3)='�x�F��' THEN '�x�F��'
			 WHEN SUBSTRING([Location],1,3)='�x�F��' THEN '�x�F��'
			 WHEN SUBSTRING([Location],1,3)='�x�n��' THEN '�x�n��'
			 WHEN SUBSTRING([Location],1,3)='�x�n��' THEN '�x�n��'
			 WHEN SUBSTRING([Location],1,3)='�y����' THEN '�y����'
			 WHEN SUBSTRING([Location],1,3)='�y����' THEN '�y����'
		 	 WHEN SUBSTRING([Location],1,3)='�Ὤ��' THEN '�Ὤ��'
			 WHEN SUBSTRING([Location],1,3)='�Ὤ��' THEN '�Ὤ��'
			 WHEN SUBSTRING([Location],1,3)='������' THEN '������'
			 WHEN SUBSTRING([Location],1,3)='�n�륫' THEN '�n�뿤'
			 WHEN SUBSTRING([Location],1,3)='�n�뿤' THEN '�n�뿤'
			 WHEN SUBSTRING([Location],1,3)='�̪F��' THEN '�̪F��'
			 WHEN SUBSTRING([Location],1,3)='�̪F��' THEN '�̪F��'
			 WHEN SUBSTRING([Location],1,3)='�]�ߥ�' THEN '�]�߿�'
			 WHEN SUBSTRING([Location],1,3)='�]�߿�' THEN '�]�߿�'
			 WHEN SUBSTRING([Location],1,3)='��饫' THEN '��鿤'
			 WHEN SUBSTRING([Location],1,3)='��鿤' THEN '��鿤'
			 WHEN SUBSTRING([Location],1,3)='������' THEN '������'
			 WHEN SUBSTRING([Location],1,3)='������' THEN '������'
			 WHEN SUBSTRING([Location],1,3)='�򶩥�' THEN '�򶩥�'
			 WHEN SUBSTRING([Location],1,3)='�s����' THEN '�s����'
			 WHEN SUBSTRING([Location],1,3)='���L��' THEN '���L��'
			 WHEN SUBSTRING([Location],1,3)='�s�˥�' THEN '�s�˥�'
			 WHEN SUBSTRING([Location],1,3)='�s�˿�' THEN '�s�˿�'
			 WHEN SUBSTRING([Location],1,3)='�Ÿq��' THEN '�Ÿq��'
			 WHEN SUBSTRING([Location],1,3)='�Ÿq��' THEN '�Ÿq��'
			 WHEN SUBSTRING([Location],1,3)='���ƥ�' THEN '���ƿ�'
			 WHEN SUBSTRING([Location],1,3)='���ƿ�' THEN '���ƿ�'
			 WHEN SUBSTRING([Location],1,3)='���' THEN '���'
		ELSE '��L' END AS [COUNTY],--�����O
		[Channel], [Start_date], [Create_date], [End_date]
INTO [�����q�c��].[dbo].[VIP_Profile_new]
FROM [�����q�c��].[dbo].[VIP_Profile]
GO

--2.2 �d�� [�����q�c��].[dbo].[VIP_Profile_new]
SELECT * FROM [�����q�c��].[dbo].[VIP_Profile_new] GO

--���G
(81035�Ӹ�ƦC����v�T)


--2.�[��Ѩ��᪺Location��줺�e���G����
SELECT [COUNTY],COUNT(*) [CNT] --����
FROM TEST
GROUP BY [COUNTY]
ORDER BY 2 DESC
GO

--exercise2
--GMC�|��
/*==1.�Q��SELECT�KINTO�K�s�W�@�s��ƪ��A�L�{���z�LCASE WHEN�KTHEN�KELSE...�����O��==*/
IF OBJECT_ID (N'[�����q�c��].[dbo].[GMC_Profile_new]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[GMC_Profile_new];

SELECT [MemberID], [Sex], [Birthday], [Marriage], [Occupation],
		CASE WHEN SUBSTRING([Location],1,3)='�O�_��' THEN '�x�_��'
			 WHEN SUBSTRING([Location],1,3)='�O�_��' THEN '�s�_��'
			 WHEN SUBSTRING([Location],1,3)='�O����' THEN '�x����'
			 WHEN SUBSTRING([Location],1,3)='�O�F��' THEN '�x�F��'
			 WHEN SUBSTRING([Location],1,3)='�O�_��' THEN '�x�_��'
			 WHEN SUBSTRING([Location],1,3)='�x����' THEN '�x����'
			 WHEN SUBSTRING([Location],1,3)='�x����' THEN '�x����'
			 WHEN SUBSTRING([Location],1,3)='�x�_��' THEN '�x�_��'
			 WHEN SUBSTRING([Location],1,3)='�x�_��' THEN '�s�_��'
			 WHEN SUBSTRING([Location],1,3)='�x�F��' THEN '�x�F��'
			 WHEN SUBSTRING([Location],1,3)='�x�F��' THEN '�x�F��'
			 WHEN SUBSTRING([Location],1,3)='�x�n��' THEN '�x�n��'
			 WHEN SUBSTRING([Location],1,3)='�x�n��' THEN '�x�n��'
			 WHEN SUBSTRING([Location],1,3)='�y����' THEN '�y����'
			 WHEN SUBSTRING([Location],1,3)='�y����' THEN '�y����'
		 	 WHEN SUBSTRING([Location],1,3)='�Ὤ��' THEN '�Ὤ��'
			 WHEN SUBSTRING([Location],1,3)='�Ὤ��' THEN '�Ὤ��'
			 WHEN SUBSTRING([Location],1,3)='������' THEN '������'
			 WHEN SUBSTRING([Location],1,3)='�n�륫' THEN '�n�뿤'
			 WHEN SUBSTRING([Location],1,3)='�n�뿤' THEN '�n�뿤'
			 WHEN SUBSTRING([Location],1,3)='�̪F��' THEN '�̪F��'
			 WHEN SUBSTRING([Location],1,3)='�̪F��' THEN '�̪F��'
			 WHEN SUBSTRING([Location],1,3)='�]�ߥ�' THEN '�]�߿�'
			 WHEN SUBSTRING([Location],1,3)='�]�߿�' THEN '�]�߿�'
			 WHEN SUBSTRING([Location],1,3)='��饫' THEN '��鿤'
			 WHEN SUBSTRING([Location],1,3)='��鿤' THEN '��鿤'
			 WHEN SUBSTRING([Location],1,3)='������' THEN '������'
			 WHEN SUBSTRING([Location],1,3)='������' THEN '������'
			 WHEN SUBSTRING([Location],1,3)='�򶩥�' THEN '�򶩥�'
			 WHEN SUBSTRING([Location],1,3)='�s����' THEN '�s����'
			 WHEN SUBSTRING([Location],1,3)='���L��' THEN '���L��'
			 WHEN SUBSTRING([Location],1,3)='�s�˥�' THEN '�s�˥�'
			 WHEN SUBSTRING([Location],1,3)='�s�˿�' THEN '�s�˿�'
			 WHEN SUBSTRING([Location],1,3)='�Ÿq��' THEN '�Ÿq��'
			 WHEN SUBSTRING([Location],1,3)='�Ÿq��' THEN '�Ÿq��'
			 WHEN SUBSTRING([Location],1,3)='���ƥ�' THEN '���ƿ�'
			 WHEN SUBSTRING([Location],1,3)='���ƿ�' THEN '���ƿ�'
			 WHEN SUBSTRING([Location],1,3)='���' THEN '���'
		ELSE '��L' END AS [COUNTY],--�����O
		[Channel], [Start_date], [End_date]
INTO [�����q�c��].[dbo].[GMC_Profile_new]
FROM [�����q�c��].[dbo].[GMC_Profile]
GO

--2.�Q��DISTINCT����
SELECT DISTINCT COUNTY
FROM [�����q�c��].[dbo].[GMC_Profile_new]
ORDER BY 1
GO

--VIP�|��
/*==1.�Q��SELECT�KINTO�K�s�W�@�s��ƪ��A�L�{���z�LCASE WHEN�KTHEN�KELSE...�����O��==*/
IF OBJECT_ID (N'[�����q�c��].[dbo].[VIP_Profile_new]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[VIP_Profile_new];

SELECT [MemberID], [Sex], [Birthday], [Marriage], [Occupation],
		CASE WHEN SUBSTRING([Location],1,3)='�O�_��' THEN '�x�_��'
			 WHEN SUBSTRING([Location],1,3)='�O�_��' THEN '�s�_��'
			 WHEN SUBSTRING([Location],1,3)='�O����' THEN '�x����'
			 WHEN SUBSTRING([Location],1,3)='�O�F��' THEN '�x�F��'
			 WHEN SUBSTRING([Location],1,3)='�O�_��' THEN '�x�_��'
			 WHEN SUBSTRING([Location],1,3)='�x����' THEN '�x����'
			 WHEN SUBSTRING([Location],1,3)='�x����' THEN '�x����'
			 WHEN SUBSTRING([Location],1,3)='�x�_��' THEN '�x�_��'
			 WHEN SUBSTRING([Location],1,3)='�x�_��' THEN '�s�_��'
			 WHEN SUBSTRING([Location],1,3)='�x�F��' THEN '�x�F��'
			 WHEN SUBSTRING([Location],1,3)='�x�F��' THEN '�x�F��'
			 WHEN SUBSTRING([Location],1,3)='�x�n��' THEN '�x�n��'
			 WHEN SUBSTRING([Location],1,3)='�x�n��' THEN '�x�n��'
			 WHEN SUBSTRING([Location],1,3)='�y����' THEN '�y����'
			 WHEN SUBSTRING([Location],1,3)='�y����' THEN '�y����'
		 	 WHEN SUBSTRING([Location],1,3)='�Ὤ��' THEN '�Ὤ��'
			 WHEN SUBSTRING([Location],1,3)='�Ὤ��' THEN '�Ὤ��'
			 WHEN SUBSTRING([Location],1,3)='������' THEN '������'
			 WHEN SUBSTRING([Location],1,3)='�n�륫' THEN '�n�뿤'
			 WHEN SUBSTRING([Location],1,3)='�n�뿤' THEN '�n�뿤'
			 WHEN SUBSTRING([Location],1,3)='�̪F��' THEN '�̪F��'
			 WHEN SUBSTRING([Location],1,3)='�̪F��' THEN '�̪F��'
			 WHEN SUBSTRING([Location],1,3)='�]�ߥ�' THEN '�]�߿�'
			 WHEN SUBSTRING([Location],1,3)='�]�߿�' THEN '�]�߿�'
			 WHEN SUBSTRING([Location],1,3)='��饫' THEN '��鿤'
			 WHEN SUBSTRING([Location],1,3)='��鿤' THEN '��鿤'
			 WHEN SUBSTRING([Location],1,3)='������' THEN '������'
			 WHEN SUBSTRING([Location],1,3)='������' THEN '������'
			 WHEN SUBSTRING([Location],1,3)='�򶩥�' THEN '�򶩥�'
			 WHEN SUBSTRING([Location],1,3)='�s����' THEN '�s����'
			 WHEN SUBSTRING([Location],1,3)='���L��' THEN '���L��'
			 WHEN SUBSTRING([Location],1,3)='�s�˥�' THEN '�s�˥�'
			 WHEN SUBSTRING([Location],1,3)='�s�˿�' THEN '�s�˿�'
			 WHEN SUBSTRING([Location],1,3)='�Ÿq��' THEN '�Ÿq��'
			 WHEN SUBSTRING([Location],1,3)='�Ÿq��' THEN '�Ÿq��'
			 WHEN SUBSTRING([Location],1,3)='���ƥ�' THEN '���ƿ�'
			 WHEN SUBSTRING([Location],1,3)='���ƿ�' THEN '���ƿ�'
			 WHEN SUBSTRING([Location],1,3)='���' THEN '���'
		ELSE '��L' END AS [COUNTY],--�����O
		[Channel], [Start_date], [Create_date], [End_date]
INTO [�����q�c��].[dbo].[VIP_Profile_new]
FROM [�����q�c��].[dbo].[VIP_Profile]
GO