/*7-6 RFM�ҫ�*/
--exercise1
--1.�Q��NTILE��ƨӼ��g�򥻪��uRFM�ҫ�-�U��5�����k�v
IF OBJECT_ID (N'[�����q�c��].[dbo].[GMC_RFM_Model]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[GMC_RFM_Model];

SELECT	A.[MemberID],
		A.[Channel],
		ISNULL(B.[�̪�@�������Z���X��],0) [�̪�@�������Z���X��], --�L������O��������0
		ISNULL(C.[�`�������],0) [�`�������], --�L������O��������0
		ISNULL(D.[�`������B],0) [�`������B], --�L������O��������0
		ISNULL(B.[R_Index],0) [R_Index], --�L������O��������0
		ISNULL(C.[F_Index],0) [F_Index], --�L������O��������0
		ISNULL(D.[M_Index],0) [M_Index], --�L������O��������0
		RTRIM(LTRIM(CAST(ISNULL(B.[R_Index],0) AS CHAR)))+','+RTRIM(LTRIM(CAST(ISNULL(C.[F_Index],0) AS CHAR)))+','+RTRIM(LTRIM(CAST(ISNULL(D.[M_Index],0) AS CHAR))) [RFM_Seg], --RFM���s����,Ū�̥i�ۦ�վ�3�ӫ��ж���
		ISNULL(B.[R_Index],0)+ISNULL(C.[F_Index],0)+ISNULL(D.[M_Index],0) [RFM_Score] --RFM�ҫ�����, Ū�̥i�ۦ�վ�3�ӫ����v��
INTO [�����q�c��].[dbo].[GMC_RFM_Model]
FROM [�����q�c��].[dbo].[GMC_Profile_new1]	A
LEFT JOIN
/*�H�U���p��R���ХN���U�Ȫ�����O����]Recency�^*/
(SELECT [MemberID],
		[�̪�@�������Z���X��],
		NTILE(5) OVER ( ORDER BY [�̪�@�������Z���X��] DESC) [R_Index]--R����
 FROM ( SELECT	[MemberID],
				DATEDIFF(DAY,MAX([Trans_Createdate]),'2007-05-31') [�̪�@�������Z���X��] --���]��ɤ��Ѭ�2007/5/31�A�p��R���Ф���
		FROM [�����q�c��].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID])AA)				B
ON A.[MemberID]=B.[MemberID]
LEFT JOIN
/*�H�U���p��F���ХN��F���O���Ʃ��W�v�]Frequence�^*/
(SELECT [MemberID],
		[�`�������],
		NTILE(5) OVER ( ORDER BY [�`�������] ASC) [F_Index] --F����
 FROM ( SELECT	[MemberID],
				COUNT(DISTINCT [TransactionID]) [�`�������] --�p��F���Ф���
		FROM [�����q�c��].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID])AA)				C
ON A.[MemberID]=C.[MemberID]
LEFT JOIN
/*�H�U���p��M���ХN���ʶR���B�]Monetary�^*/
(SELECT [MemberID],
		[�`������B],
		NTILE(5) OVER ( ORDER BY [�`������B] ASC) [M_Index] --M����
 FROM ( SELECT	[MemberID],
				SUM([Money]) [�`������B] --�p��M���Ф���
		FROM [�����q�c��].[dbo].[GMC_TransDetail]
		GROUP BY [MemberID])AA)				D
ON A.[MemberID]=D.[MemberID]
GO

--2.�d��R�BF�BM�s�ӼƵ��G���G
--R���иs�Ӽ�
SELECT	[R_Index],
		COUNT(*) [�s�Ӽ�]
FROM [�����q�c��].[dbo].[GMC_RFM_Model]
GROUP BY [R_Index]
ORDER BY 1
GO

--F���иs�Ӽ�
SELECT	[F_Index],
		COUNT(*) [�s�Ӽ�]
FROM [�����q�c��].[dbo].[GMC_RFM_Model]
GROUP BY [F_Index]
ORDER BY 1
GO

--M���иs�Ӽ�
SELECT	[M_Index],
		COUNT(*) [�s�Ӽ�]
FROM [�����q�c��].[dbo].[GMC_RFM_Model]
GROUP BY [M_Index]
ORDER BY 1
GO

--3.�d��[RFM_Score]�s�S�x
SELECT	[RFM_Score],
		COUNT(*) [�s�Ӽ�],
		AVG([�̪�@�������Z���X��]*1.0) [��������Z���Ѽ�],
		MAX([�̪�@�������Z���X��]) [�̤j����Z���Ѽ�],
		MIN([�̪�@�������Z���X��]) [�̤p����Z���Ѽ�],
		STDEV([�̪�@�������Z���X��]*1.0) [�̪�@�������Z���X��_�s���зǮt],
		AVG([�`�������]*1.0) [��������������],
		MAX([�`�������]) [�̦h�������],
		MIN([�`�������]) [�̤֥������],
		STDEV([�`�������]*1.0) [�`�������_�s���зǮt],
		AVG([�`������B]*1.0) [�������������B],
		MAX([�`������B]) [�̦h������B],
		MIN([�`������B]) [�̤֥�����B],
		STDEV([�`������B]*1.0) [�`������B_�s���зǮt]
FROM [�����q�c��].[dbo].[GMC_RFM_Model]
GROUP BY [RFM_Score]
ORDER BY 1
GO

--4.�d��[RFM_Seg]�s�S�x
SELECT	[RFM_Seg],
		COUNT(*) [�s�Ӽ�],
		AVG([�̪�@�������Z���X��]*1.0) [��������Z���Ѽ�],
		MAX([�̪�@�������Z���X��]) [�̤j����Z���Ѽ�],
		MIN([�̪�@�������Z���X��]) [�̤p����Z���Ѽ�],
		STDEV([�̪�@�������Z���X��]*1.0) [�̪�@�������Z���X��_�s���зǮt],
		AVG([�`�������]*1.0) [��������������],
		MAX([�`�������]) [�̦h�������],
		MIN([�`�������]) [�̤֥������],
		STDEV([�`�������]*1.0) [�`�������_�s���зǮt],
		AVG([�`������B]*1.0) [�������������B],
		MAX([�`������B]) [�̦h������B],
		MIN([�`������B]) [�̤֥�����B],
		STDEV([�`������B]*1.0) [�`������B_�s���зǮt]
FROM [�����q�c��].[dbo].[GMC_RFM_Model]
GROUP BY [RFM_Seg]
ORDER BY 1
GO
