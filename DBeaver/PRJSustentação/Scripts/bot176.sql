SELECT ---------------------------------------------------------------------------------- "Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (176)
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
WHERE ID_BOT = 176
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT *
FROM RPA.RPA_CTRL_CX_ENVIO_REGISTROS_ATENDIMENTOS
WHERE REQUEST_CHANNEL = 'Download de ligações'
	AND TRUNC(DT_EXEC) = TRUNC(SYSDATE)
ORDER BY ID DESC;

SELECT DT_EXEC  
	,TELEPHONE 
	,status
FROM RPA.RPA_CTRL_CX_ENVIO_REGISTROS_ATENDIMENTOS
WHERE REQUEST_CHANNEL = 'Download de ligações'
	AND STATUS <> 'Done'
ORDER BY ID DESC;

SELECT *
FROM RPA.RPA_CTRL_CX_ENVIO_REGISTROS_ATENDIMENTOS
WHERE CPF_CNPJ = '00000046100'
ORDER BY ID DESC;

SELECT *
FROM RPA.RPA_CTRL_CX_ENVIO_REGISTROS_ATENDIMENTOS
WHERE CPF_CNPJ = '00000046200'
ORDER BY ID DESC;
---------------------------------------------------------------------------------- Global bot Parameters
SELECT * 
FROM RPA.RPA_GERENCIADOR_GLOBAL_PARAMETERS
ORDER BY key asc;
----------------------------------------------------------------------------------