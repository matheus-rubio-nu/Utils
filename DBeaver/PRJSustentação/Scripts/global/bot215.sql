SELECT ---------------------------------------------------------------------------------- "Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (215)
ORDER BY KEY ASC;

SELECT  ---------------------------------------------------------------------------------- Check exec status
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 215
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT *
FROM RPA.RPA_CTRL_LEGAL_SEPARACAO_DE_CARTAS
ORDER BY ID DESC;
---------------------------------------------------------------------------------- Global bot Parameters
SELECT * 
FROM RPA.RPA_GERENCIADOR_GLOBAL_PARAMETERS
ORDER BY key asc;
----------------------------------------------------------------------------------