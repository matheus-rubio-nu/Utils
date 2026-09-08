SELECT ----------------------------------------------------------------------------------"Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION 
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT  IN (206)
ORDER BY KEY ASC;

SELECT  ----------------------------------------------------------------------------------Check exec status
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 206
ORDER BY ID_EXECUTION DESC;
----------------------------------------------------------------------------------
SELECT
	*
FROM
	RPA.RPA_CTRL_CX_CANCELAMENTO_CDB
ORDER BY
	DT_EXEC DESC;
