SELECT ----------------------------------------------------------------------------------"Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (191)
ORDER BY KEY ASC;

SELECT  ----------------------------------------------------------------------------------Check exec status
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 191
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT *
FROM RPA.RPA_CTRL_REGSOL_JUD_BC_CORREIOS
ORDER BY DATE_EXECUTION DESC;
---------------------------------------------------------------------------------- 


SELECT *
FROM RPA.RPA_CTRL_REGSOL_JUD_BC_CORREIOS
WHERE NUMERO_CORREIO = '125175513'


SELECT *
FROM RPA.RPA_CTRL_REGSOL_JUD_BC_CORREIOS
ORDER BY 1 DESC;



SELECT *
FROM RPA.RPA_CTRL_REGSOL_JUD_BC_CORREIOS
WHERE NUMERO_CORREIO IN (
125138582
,125138580
,125138583)
ORDER BY 1 DESC;
