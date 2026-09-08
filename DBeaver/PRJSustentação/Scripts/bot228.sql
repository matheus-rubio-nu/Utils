--"Local" Parameters---------------------------------------------------------------------------------------------------------
SELECT 
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (228)
	--AND KEY LIKE '%CONTROL_TABLE_NAME%'
ORDER BY KEY ASC;
--Check exec status---------------------------------------------------------------------------------------------------------
SELECT 
	*
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 228
ORDER BY ID_EXECUTION DESC;

SELECT 
	STATUS 
	,DESCR_ERR 
	,HOST_NAME 
	,COUNT(*)
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 228
	AND STATUS = 6
GROUP BY 
	HOST_NAME
	,DESCR_ERR 
	,STATUS; 
--CONTROL TABLE---------------------------------------------------------------------------------------------------------
SELECT *  
FROM RPA.[control_table]
ORDER BY ID DESC;
--Global bot Parameters---------------------------------------------------------------------------------------------------------
SELECT * 
FROM RPA.RPA_GERENCIADOR_GLOBAL_PARAMETERS
ORDER BY key asc;
--------------------------------------------------------------------------------------------------------------------------------