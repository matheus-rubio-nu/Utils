------------------------------------------------------------------------------------"Local" Parameters
SELECT
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (208)
ORDER BY KEY ASC;
------------------------------------------------------------------------------------Check exec status
SELECT  
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 208
ORDER BY ID_EXECUTION DESC;
------------------------------------------------------------------------------------CONTROL TABLE
SELECT 
	*
FROM RPA.RPA_CTRL_CX_EXTRATO_RENDIMENTOS
WHERE 
	CUSTOMER_ID = '6737d1ee-6d80-4b92-9dcb-3370d6b5dcd9'
	AND BOX_ID = '67bf5216-420a-4449-b446-7f906c4030f5'
------------------------------------------------------------------------------------Query da fila

SELECT 
	CPF,
	CUSTOMER_ID,
	PERIOD_START,
	PERIOD_END,
	TIMESTAMP_REQUEST,
	DT_INI
FROM
	RPA.RPA_CTRL_CX_EXTRATO_RENDIMENTOS
WHERE
	STATUS = '3'
GROUP BY
	CPF,
	CUSTOMER_ID,
	PERIOD_START,
	PERIOD_END,
	TIMESTAMP_REQUEST,
	DT_INI
ORDER BY TO_DATE(TIMESTAMP_REQUEST, 'MM/DD/YYYY HH24:MI:SS') ASC; 

SELECT
	*
FROM
	RPA.RPA_CTRL_CX_EXTRATO_RENDIMENTOS
WHERE STATUS = '3' 
	AND DT_INI IS NOT NULL
ORDER BY TO_DATE(TIMESTAMP_REQUEST, 'MM/DD/YYYY HH24:MI:SS') DESC; 

SELECT
	*
FROM
	RPA.RPA_CTRL_CX_EXTRATO_RENDIMENTOS
WHERE DT_INI IS NOT NULL
	AND DT_END IS NULL
ORDER BY TO_DATE(TIMESTAMP_REQUEST, 'MM/DD/YYYY HH24:MI:SS') DESC; 

SELECT
	* --PERIODO INICIO/FIM INVALIDO
FROM
	RPA.RPA_CTRL_CX_EXTRATO_RENDIMENTOS
	WHERE OBS_STATUS = 'PERIODO INICIO/FIM INVALIDO'

---------------------------------------------------------------------------------- Global bot Parameters
SELECT * 
FROM RPA.RPA_GERENCIADOR_GLOBAL_PARAMETERS
ORDER BY key asc;
----------------------------------------------------------------------------------