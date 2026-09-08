SELECT ----------------------------------------------------------------------------------"Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION 
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (273)
ORDER BY KEY ASC;

SELECT  ----------------------------------------------------------------------------------Check exec status
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 273
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT *
FROM RPA.RPA_CTRL_AML_VARYS
ORDER BY ID DESC;

SELECT COUNT(*) FROM RPA.RPA_CTRL_AML_VARYS WHERE ID_EXEC = '1003722';

SELECT *
FROM RPA.RPA_CTRL_AML_VARYS
WHERE INCIDENT_ID = '1519632e-8a49-3dfc-836c-39ea82690691'
ORDER BY ID DESC;
---------------------------------------------------------------------------------- 
