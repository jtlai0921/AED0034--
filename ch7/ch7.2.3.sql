/*7-2-3	������B�ŶZ���R*/
--exercise1
--1.VIP�|��������B�ŶZ���R
SELECT	[YEAR],[TTL_MoneyLevel],
		COUNT(MemberID) [Trans_people], --����H��
		SUM([Trans_CNT]) [Trans_CNT] --�������
FROM ( SELECT [MemberID], [YEAR], [Trans_CNT], [TTL_Money], 
			  CASE WHEN [TTL_Money]<500 THEN '01_������B����$500' 
				   WHEN [TTL_Money]>=500 AND [TTL_Money]<1000 THEN '02_������B����$500��$1000(���t)'
				   WHEN [TTL_Money]>=1000 AND [TTL_Money]<2000 THEN '03_������B����$1000��$2000(���t)'
				   WHEN [TTL_Money]>=2000 AND [TTL_Money]<3000 THEN '04_������B����$2000��$3000(���t)'
				   WHEN [TTL_Money]>=3000 AND [TTL_Money]<4000 THEN '05_������B����$3000��$4000(���t)'
				   WHEN [TTL_Money]>=4000 AND [TTL_Money]<5000 THEN '06_������B����$4000��$5000(���t)'
				   WHEN [TTL_Money]>=5000 AND [TTL_Money]<10000 THEN '07_������B����$5000��$10000(���t)'
				   WHEN [TTL_Money]>=10000 THEN '08_������B�ܤ�$10000'
			  ELSE '��L' END [TTL_MoneyLevel]
	   FROM (SELECT	[MemberID],
					RTRIM(LTRIM(CAST(DATEPART(YEAR,[Trans_Createdate]) AS CHAR)))+'�~' [YEAR], --�~��
					COUNT(DISTINCT [TransactionID]) [Trans_CNT],--����`����
					SUM([Money])[TTL_Money] --����`���B
			 FROM [�����q�c��].[dbo].[VIP_TransDetail]
			 GROUP BY [MemberID],RTRIM(LTRIM(CAST(DATEPART(YEAR,[Trans_Createdate]) AS CHAR)))+'�~')AA)BB
GROUP BY [YEAR],[TTL_MoneyLevel]
ORDER BY 1,2
GO

