SELECT ----------------------------------------------------------------------------------"Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION 
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (157)
ORDER BY KEY ASC;

SELECT  ----------------------------------------------------------------------------------Check exec status
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 157
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT *
FROM RPA.RPA_CTRL_LGL_PAYMENTS_RECEIPT
ORDER BY ID DESC;

SELECT *
FROM RPA.RPA_CTRL_LGL_PAYMENTS_RECEIPT
WHERE STATUS = 'Importacao Elaw'
ORDER BY ID DESC;
---------------------------------------------------------------------------------- 