/*CH5 T-SQL*/
/*�H�U��5-4�`*/
--ch5-4.2-01/*01�N��Ѥ����e�d�Ҫ�����,02,03...�H������*/
--�B�J1.�ťղ��͸�ƪ�
IF OBJECT_ID (N'[�����q�c��].[dbo].[Customers_MaskingTEST]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[Customers_MaskingTEST];

CREATE TABLE [�����q�c��].[dbo].[Customers_MaskingTEST](
	[Name] [nvarchar](5) NOT NULL,                  --�m�W
	[NameID] [varchar](10) NOT NULL,                --������
	[Email] [varchar](50) NOT NULL,                 --EMAIL
	[MOBILE] [varchar](20) NOT NULL,				--���
	[Address] [nvarchar](50) NOT NULL,				--�a�}
	[Salary] [money] NOT NULL,                      --�~�����J
	[CreditCard] [varchar](19) NOT NULL)			--�H�Υd��
GO

--�B�J2.�פJ�ťո�ƪ�
INSERT INTO [�����q�c��].[dbo].[Customers_MaskingTEST]
([Name],[NameID],[Email],[MOBILE],[Address],[Salary],[CreditCard])
VALUES (N'���N�W','A123456789','A01@hotmail.com','0910123456',N'�x�_���j�w�ϩM���F��11��',1000000,'5520-0001-1234-1234'),
       (N'���ʵ�','B123456001','B01@hotmail.com','0912123123',N'��饫���s��200��',1500000,'4726-3495-1234-5678'),
       (N'�L�ܬ�','C223456789','C01@hotmail.com','0915456789',N'�x����������168��3��',2000000,'4726-3498-1111-2121')
GO

--�B�J3.�d�߸�ƪ�
SELECT * FROM [�����q�c��].[dbo].[Customers_MaskingTEST]
GO

--ch5-4.2-02
--�רҤ@�y�k
--01.�ʺA��ƾB�n�\��]�w
USE [�����q�c��]
GO

ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [Name] 
ADD MASKED WITH (FUNCTION='PARTIAL(1,"X",1)')
GO

--02.�d�ߤw�]�w���B�n��Ʀ�
SELECT	C.name,
		D.name as table_name,
		C.is_masked,
		C.masking_function
FROM sys.masked_columns AS C
JOIN 
	 sys.tables AS D
ON C.[object_id] = D.[object_id]
WHERE is_masked = 1

--03.�إ߷s���ϥΪ̡A�ñ¤���ƪ�SELECT�v���C�H�K�˵��B�n��ƨð���d��
DROP USER EdisonSung
CREATE USER EdisonSung WITHOUT LOGIN;
GRANT SELECT ON [dbo].[Customers_MaskingTEST]  TO EdisonSung;

EXECUTE AS USER = 'EdisonSung';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT;

--�רҤG�y�k
--01.�ʺA��ƾB�n�\��]�w
USE [�����q�c��]
GO

ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [NameID] 
ADD MASKED WITH (FUNCTION='PARTIAL(2,"OOOOOO",2)')
GO

--02.�d�ߤw�]�w���B�n��Ʀ�
SELECT	C.name,
		D.name as table_name,
		C.is_masked,
		C.masking_function
FROM sys.masked_columns AS C
JOIN 
	 sys.tables AS D
ON C.[object_id] = D.[object_id]
WHERE is_masked = 1

--03.�إ߷s���ϥΪ̡A�ñ¤���ƪ�SELECT�v���C�H�K�˵��B�n��ƨð���d��
DROP USER EdisonSung
CREATE USER EdisonSung WITHOUT LOGIN;
GRANT SELECT ON [dbo].[Customers_MaskingTEST]  TO EdisonSung;

EXECUTE AS USER = 'EdisonSung';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT;

--�רҤT�y�k
--01.�ʺA��ƾB�n�\��]�w
USE [�����q�c��]
GO

ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [Email] 
ADD MASKED WITH (FUNCTION='email()')
GO

--02.�d�ߤw�]�w���B�n��Ʀ�
SELECT	C.name,
		D.name as table_name,
		C.is_masked,
		C.masking_function
FROM sys.masked_columns AS C
JOIN 
	 sys.tables AS D
ON C.[object_id] = D.[object_id]
WHERE is_masked = 1

--03.�إ߷s���ϥΪ̡A�ñ¤���ƪ�SELECT�v���C�H�K�˵��B�n��ƨð���d��
DROP USER EdisonSung
CREATE USER EdisonSung WITHOUT LOGIN;
GRANT SELECT ON [dbo].[Customers_MaskingTEST]  TO EdisonSung;

EXECUTE AS USER = 'EdisonSung';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT;

--�רҥ|�y�k
--01.�ʺA��ƾB�n�\��]�w
USE [�����q�c��]
GO

ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [MOBILE] 
ADD MASKED WITH (FUNCTION='default()')
GO

--02.�d�ߤw�]�w���B�n��Ʀ�
SELECT	C.name,
		D.name as table_name,
		C.is_masked,
		C.masking_function
FROM sys.masked_columns AS C
JOIN 
	 sys.tables AS D
ON C.[object_id] = D.[object_id]
WHERE is_masked = 1

--03.�إ߷s���ϥΪ̡A�ñ¤���ƪ�SELECT�v���C�H�K�˵��B�n��ƨð���d��
DROP USER EdisonSung
CREATE USER EdisonSung WITHOUT LOGIN;
GRANT SELECT ON [dbo].[Customers_MaskingTEST]  TO EdisonSung;

EXECUTE AS USER = 'EdisonSung';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT;

--�רҤ��y�k
--01.�ʺA��ƾB�n�\��]�w
USE [�����q�c��]
GO

ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [Address] 
ADD MASKED WITH (FUNCTION='partial(6,"OOOOO",0)')
GO

--02.�d�ߤw�]�w���B�n��Ʀ�
SELECT	C.name,
		D.name as table_name,
		C.is_masked,
		C.masking_function
FROM sys.masked_columns AS C
JOIN 
	 sys.tables AS D
ON C.[object_id] = D.[object_id]
WHERE is_masked = 1

--03.�إ߷s���ϥΪ̡A�ñ¤���ƪ�SELECT�v���C�H�K�˵��B�n��ƨð���d��
DROP USER EdisonSung
CREATE USER EdisonSung WITHOUT LOGIN;
GRANT SELECT ON [dbo].[Customers_MaskingTEST]  TO EdisonSung;

EXECUTE AS USER = 'EdisonSung';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT;

--�רҤ��y�k
--01.�ʺA��ƾB�n�\��]�w
USE [�����q�c��]
GO

ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [Salary] 
ADD MASKED WITH (FUNCTION='default()')
GO

--02.�d�ߤw�]�w���B�n��Ʀ�
SELECT	C.name,
		D.name as table_name,
		C.is_masked,
		C.masking_function
FROM sys.masked_columns AS C
JOIN 
	 sys.tables AS D
ON C.[object_id] = D.[object_id]
WHERE is_masked = 1

--03.�إ߷s���ϥΪ̡A�ñ¤���ƪ�SELECT�v���C�H�K�˵��B�n��ƨð���d��
DROP USER EdisonSung
CREATE USER EdisonSung WITHOUT LOGIN;
GRANT SELECT ON [dbo].[Customers_MaskingTEST]  TO EdisonSung;

EXECUTE AS USER = 'EdisonSung';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT;

--�רҤC�y�k
--01.�ʺA��ƾB�n�\��]�w
USE [�����q�c��]
GO

ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [CreditCard] 
ADD MASKED WITH (FUNCTION= 'PARTIAL(0,"xxxx-xxxx-xxxx-",4)')
GO

--02.�d�ߤw�]�w���B�n��Ʀ�
SELECT	C.name,
		D.name as table_name,
		C.is_masked,
		C.masking_function
FROM sys.masked_columns AS C
JOIN 
	 sys.tables AS D
ON C.[object_id] = D.[object_id]
WHERE is_masked = 1

--03.�إ߷s���ϥΪ̡A�ñ¤���ƪ�SELECT�v���C�H�K�˵��B�n��ƨð���d��
DROP USER EdisonSung
CREATE USER EdisonSung WITHOUT LOGIN;
GRANT SELECT ON [dbo].[Customers_MaskingTEST]  TO EdisonSung;

EXECUTE AS USER = 'EdisonSung';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT;

--�רҤC�y�k
--01.�ʺA��ƾB�n�\��]�w
USE [�����q�c��]
GO

ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [CreditCard] 
ADD MASKED WITH (FUNCTION= 'PARTIAL(0,"xxxx-xxxx-xxxx-",4)')
GO

--02.�d�ߤw�]�w���B�n��Ʀ�
SELECT	C.name,
		D.name as table_name,
		C.is_masked,
		C.masking_function
FROM sys.masked_columns AS C
JOIN 
	 sys.tables AS D
ON C.[object_id] = D.[object_id]
WHERE is_masked = 1

--03.�إ߷s���ϥΪ̡A�ñ¤���ƪ�SELECT�v���C�H�K�˵��B�n��ƨð���d��
DROP USER EdisonSung
CREATE USER EdisonSung WITHOUT LOGIN;
GRANT SELECT ON [dbo].[Customers_MaskingTEST]  TO EdisonSung;

EXECUTE AS USER = 'EdisonSung';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT;

--ch5-4.2-03
--�վ��ƾB�n�]�w
--01.�ʺA��ƾB�n�\��վ�]�w
USE [�����q�c��]
GO
--A.�վ�e
ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [CreditCard] 
ADD MASKED WITH (FUNCTION= 'PARTIAL(0,"xxxx-xxxx-xxxx-",4)')
GO

--B.�վ��
ALTER TABLE [dbo].[Customers_MaskingTEST] 
ALTER COLUMN [CreditCard] 
ADD MASKED WITH (FUNCTION= 'PARTIAL(0,"xxxx-xxxx",4)')
GO

--02.�d�ߤw�]�w���B�n��Ʀ�
SELECT	C.name,
		D.name as table_name,
		C.is_masked,
		C.masking_function
FROM sys.masked_columns AS C
JOIN 
	 sys.tables AS D
ON C.[object_id] = D.[object_id]
WHERE is_masked = 1

--03.�إ߷s���ϥΪ̡A�ñ¤���ƪ�SELECT�v���C�H�K�˵��B�n��ƨð���d��
DROP USER EdisonSung
CREATE USER EdisonSung WITHOUT LOGIN;
GRANT SELECT ON [dbo].[Customers_MaskingTEST]  TO EdisonSung;

EXECUTE AS USER = 'EdisonSung';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT;

--ch5-4.2-04
--�ᤩ�ϥΪ�UNMASK�v��
USE [�����q�c��]
GO
--01.�s�WEdisonChen�n��
CREATE USER EdisonChen WITHOUT LOGIN
GO
--02.�ᤩ�d��[dbo].[Customers_MaskingTEST]�v��
GRANT SELECT ON [dbo].[Customers_MaskingTEST] TO EdisonChen
GO
--03.�ᤩUNMASK�v��,�����B�n�v�T
GRANT UNMASK TO EdisonSung1
GO
--04.��������
EXECUTE AS USER ='EdisonChen';
SELECT * FROM [dbo].[Customers_MaskingTEST];
REVERT
GO

--ch5-4.2-05
--�ʺA��ƾB�n������
EXECUTE AS USER='Edisonsung'
SELECT * FROM [dbo].[Customers_MaskingTEST];
/*��������ഫ*/
SELECT	CAST(NAME AS NCHAR(10)),
		CAST(Salary AS VARCHAR(MAX)) FROM [dbo].[Customers_MaskingTEST]
REVERT
GO

--ch5-4.3-01
/*�䴩 JSON ���榡*/
--�[�WFOR JSON AUTO�A�䴩JSON��X
SELECT * FROM [�����q�c��].[dbo].[�@��|���򥻸��] FOR JSON AUTO

--ch5-4.3-02
/*�䴩 JSON ���榡*/
--��FOR JSON AUTO�[�WRoot Key�A�ϥ�ROOT�ﶵ�ۭqRoot Key�W��
SELECT * 
FROM [�����q�c��].[dbo].[�@��|���򥻸��] 
FOR JSON AUTO,ROOT('Retaildata')

--ch5-4.3-03
/*�䴩 JSON ���榡*/
--�ϥ�JSON PATH��XJSON�榡
--��l�d��,�s�bNULL
SELECT	[ProductID],
		[Productname],
		[Product_Combine1],
		[ProdQuantity_Combine1],
		[Product_Combine2],
		[ProdQuantity_Combine2],
		[Product_Combine3],
		[ProdQuantity_Combine3],
		[Product_Combine4],
		[ProdQuantity_Combine4],
		[Price]
FROM [�����q�c��].[dbo].[���~�զ��f��]
GO
--�ϥ�JSON AUTO��XJSON�榡�ANULL�|�Q����
SELECT	[ProductID],
		[Productname],
		[Product_Combine1],
		[ProdQuantity_Combine1],
		[Product_Combine2],
		[ProdQuantity_Combine2],
		[Product_Combine3],
		[ProdQuantity_Combine3],
		[Product_Combine4],
		[ProdQuantity_Combine4],
		[Price]
FROM [�����q�c��].[dbo].[���~�զ��f��]
FOR JSON AUTO

--�ϥ�JSON PATH��XNULL��Ʀ�
SELECT	[ProductID],
		[Productname],
		[Product_Combine1],
		[ProdQuantity_Combine1],
		[Product_Combine2],
		[ProdQuantity_Combine2],
		[Product_Combine3],
		[ProdQuantity_Combine3],
		[Product_Combine4],
		[ProdQuantity_Combine4],
		[Price]
FROM [�����q�c��].[dbo].[���~�զ��f��]
FOR JSON PATH,INCLUDE_NULL_VALUES
GO