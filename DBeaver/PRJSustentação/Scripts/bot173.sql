SELECT ----------------------------------------------------------------------------------"Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (173)
	--AND KEY LIKE '%CONTROL_TABLE_NAME%'
ORDER BY KEY ASC;

SELECT  ----------------------------------------------------------------------------------Check exec status
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 173
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT *
FROM RPA.RPA_CTRL_CX_DECLARACAO_COLLECTIONS
ORDER BY ID DESC;

SELECT *
FROM RPA.RPA_CTRL_CX_DECLARACAO_COLLECTIONS
WHERE CPF_CNPJ like '514.905%'
ORDER BY ID DESC;
---------------------------------------------------------------------------------- 

SELECT
	DT_EXEC,
	'Declaração de Collections' AS DECLARACAO,
	NAME,
	PREFERRED_NAME,
	CPF_CNPJ,
	EMAIL,
	CASE WHEN STATUS = 'Wainting Report' THEN 'DONE' ELSE STATUS
	END AS STATUS,
	REASON,
	ZENDESK_TICKET
FROM  
	RPA.RPA_CTRL_CX_DECLARACAO_COLLECTIONS
WHERE 
	(STATUS = 'Wainting Report' OR STATUS = 'Análise Manual') AND
	TRUNC(dt_exec) = trunc(sysdate)
ORDER BY ID