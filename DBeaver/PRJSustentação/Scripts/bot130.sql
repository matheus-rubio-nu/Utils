SELECT ---------------------------------------------------------------------------------- "Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (130)
ORDER BY KEY ASC;

SELECT  ---------------------------------------------------------------------------------- Check exec status
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 130
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT REQUEST_TYPE, STATUS, COUNT(*) 
FROM RPA.RPA_CTRL_CX_RELATORIOS_NOTAS
WHERE STATUS IN ('PENDING', 'SYSTEM EXCEPTION')
GROUP BY STATUS, REQUEST_TYPE
ORDER BY REQUEST_TYPE;

SELECT * 
FROM RPA.RPA_CTRL_CX_RELATORIOS_NOTAS
WHERE ID = '65858';

SELECT *
FROM RPA.RPA_CTRL_CX_RELATORIOS_NOTAS
WHERE STATUS IN ('PENDING', 'SYSTEM EXCEPTION')
ORDER BY STATUS DESC, REQUEST_TYPE;
--------------------------------------------------------------------------------- Global bot Parameters
SELECT * 
FROM RPA.RPA_GERENCIADOR_GLOBAL_PARAMETERS
ORDER BY key asc;
----------------------------------------------------------------------------------

SELECT *
FROM RPA.RPA_CTRL_CX_RELATORIOS_NOTAS
ORDER BY DT_EXEC DESC



