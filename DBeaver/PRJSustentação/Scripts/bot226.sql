SELECT ---------------------------------------------------------------------------------- "Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (226)
ORDER BY KEY ASC;

SELECT  ---------------------------------------------------------------------------------- Check exec status
	ID_EXECUTION 
	,INI_EXECUTION
	,END_EXECUTION
	,STATUS 
	,ENVIRONMENT 
	,HOST_NAME 
	,EXTERNAL_ID s
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 226
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT *
FROM RPA.RPA_CTRL_JUD_VALIDADOR_SIMBA
ORDER BY ID DESC;

SELECT *
FROM RPA.RPA_CTRL_JUD_VALIDADOR_SIMBA
WHERE STATUS = 2
ORDER BY ID DESC;

SELECT *
FROM RPA.RPA_CTRL_JUD_VALIDADOR_SIMBA
WHERE STATUS = 2
ORDER BY ID DESC;

SELECT ORGAO_SOLICITANTE_FORMATADO
	,STATUS
FROM RPA.RPA_CTRL_JUD_VALIDADOR_SIMBA
GROUP BY ORGAO_SOLICITANTE_FORMATADO
	,STATUS
ORDER BY ORGAO_SOLICITANTE_FORMATADO;

SELECT STATUS 
FROM RPA.RPA_CTRL_JUD_VALIDADOR_SIMBA
GROUP BY STATUS;
---------------------------------------------------------------------------------- Global bot Parameters
SELECT * 
FROM RPA.RPA_GERENCIADOR_GLOBAL_PARAMETERS
ORDER BY key asc;
----------------------------------------------------------------------------------