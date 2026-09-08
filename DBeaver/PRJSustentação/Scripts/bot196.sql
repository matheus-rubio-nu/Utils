--"Local" Parameters--------------------------------------------------------------------------------
SELECT 
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (138)
ORDER BY KEY ASC;
--Check exec status--------------------------------------------------------------------------------
SELECT  
*
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 196
ORDER BY ID_EXECUTION DESC;
--CONTROL TABLE-------------------------------------------------------------------------------- 
SELECT *
FROM RPA.RPA_CTRL_CX_EXTRATO_RDB
WHERE CPF = '00000046600';

SELECT CPF
	,COUNT(*)
	,CUSTOMER_ID 
	,TIMESTAMP_REQUEST 
	,PERIOD_START 
	,PERIOD_END
FROM RPA.RPA_CTRL_CX_EXTRATO_RDB
WHERE STATUS = '3'
GROUP BY CPF
	,CUSTOMER_ID 
	,TIMESTAMP_REQUEST 
	,PERIOD_START 
	,PERIOD_END
ORDER BY TO_DATE(TIMESTAMP_REQUEST, 'MM/DD/YYYY HH24:MI:SS') ASC;
----------------------------------------------------------------------------------
SELECT
	CPF
FROM
	RPA.RPA_CTRL_CX_EXTRATO_RDB
WHERE
	STATUS = '3'
GROUP BY
	CPF;
----------------------------------------------------------------------------------