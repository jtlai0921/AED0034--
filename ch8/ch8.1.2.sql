/*8-1-2	安裝R Services*/
--執行陳述式啟用R Services功能
Exec sp_configure 'external scripts enabled', 1
Reconfigure with override

