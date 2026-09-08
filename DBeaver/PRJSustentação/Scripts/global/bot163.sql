--"Local" Parameters---------------------------------------------------------------------------------------------------------
SELECT 
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (163)
	--AND KEY LIKE '%CONTROL_TABLE_NAME%'
ORDER BY KEY ASC;
--Check exec status---------------------------------------------------------------------------------------------------------
SELECT 
	*
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 163
	AND ID_EXECUTION >= 756229
ORDER BY ID_EXECUTION ASC;

SELECT 
	*
FROM RPA.RPA_AA_GERENCIADOR_LOGS
WHERE ID_BOT = 163
	AND ID_EXECUTION = 756229
ORDER BY ID_EXECUTION ASC;
