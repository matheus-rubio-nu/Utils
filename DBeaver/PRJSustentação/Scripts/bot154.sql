SELECT ---------------------------------------------------------------------------------- "Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (154)
	--AND KEY LIKE '%CONTROL_TABLE_NAME%'
ORDER BY KEY ASC;

SELECT  ---------------------------------------------------------------------------------- Check exec status
	ID_EXECUTION 
	,INI_EXECUTION
	,END_EXECUTION
	,STATUS 
	,ENVIRONMENT 
	,HOST_NAME 
	,EXTERNAL_ID
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 228
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT *
FROM RPA.[control_table]
ORDER BY ID DESC;
---------------------------------------------------------------------------------- Global bot Parameters
SELECT * 
FROM RPA.RPA_GERENCIADOR_GLOBAL_PARAMETERS
ORDER BY key asc;
----------------------------------------------------------------------------------