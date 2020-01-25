/*7-2-5	��������ɶ����j*/
--exercise1
--GMC�|��
--1.���o�|�����`�������
IF OBJECT_ID (N'[�����q�c��].[dbo].[GMC�|������]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[GMC�|������];

SELECT	DISTINCT [MemberID],[Trans_Createdate],[TransactionID],
		DENSE_RANK() OVER ( PARTITION BY [MemberID],[Trans_Createdate] ORDER BY [TransactionID]) [���o�P�@�ѥ���s������],
		DENSE_RANK() OVER ( PARTITION BY [MemberID] ORDER BY [TransactionID]) [���o����s������],
		DENSE_RANK() OVER ( PARTITION BY [MemberID] ORDER BY [Trans_Createdate]) [���o����������]
INTO [�����q�c��].[dbo].[GMC�|������]
FROM [�����q�c��].[dbo].[GMC_TransDetail]
ORDER BY 1,2
GO

--2.�H�|���s��=��DM033194����
--�ƧǦP�@�ѥ���s��
SELECT	* FROM [�����q�c��].[dbo].[GMC�|������]
WHERE MemberID='DM033194'
ORDER BY 2,4
GO

--�Ƨǥ���s��
SELECT	* FROM [�����q�c��].[dbo].[GMC�|������]
WHERE MemberID='DM033194'
ORDER BY 5
GO

--�Ƨǥ�����
SELECT	* FROM [�����q�c��].[dbo].[GMC�|������]
WHERE MemberID='DM033194'
ORDER BY 6
GO

--3.�p��C��|��������������j�ɶ�
IF OBJECT_ID (N'[�����q�c��].[dbo].[GMC�|������������j�ɶ�]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[GMC�|������������j�ɶ�];

SELECT	[MemberID],
		MAX([Trans_Createdate]) [�̪�@�������],
		MIN([Trans_Createdate]) [�̪�@�������],
		DATEDIFF(DAY, MIN([Trans_Createdate]),MAX([Trans_Createdate])) [�`���j�Ѽ�], --���o�`���j�Ѽ�
		MAX([���o����s������]) [�`�������], --���o�`�����(��)��
		MAX([���o����������])-1 [�`������j�Ѽ�], --���o�`���j�Ѽ�
		(DATEDIFF(DAY,MIN([Trans_Createdate]),MAX([Trans_Createdate]))*1.0)/((MAX([���o����������])-1)*1.0) [�����C��������j�ɶ�]
INTO [�����q�c��].[dbo].[GMC�|������������j�ɶ�]
FROM [�����q�c��].[dbo].[GMC�|������]
GROUP BY [MemberID]
HAVING MAX([���o����������])-1>0 --�ǤJ������ƶW�L1�����|���A�ư����H�s���~
GO

--4.���P������Ƥ��U���C��|��������������j�ɶ�
SELECT	[�`�������],
		COUNT([MemberID]) [�`�|���H��],
		SUM([�`���j�Ѽ�]) [�`���j�Ѽ�],
		(SUM([�`���j�Ѽ�])*1.0)/(COUNT([MemberID])*1.0) [�C�H����������j�ɶ�]
FROM [�����q�c��].[dbo].[GMC�|������������j�ɶ�]
GROUP BY [�`�������]
ORDER BY 1
GO
