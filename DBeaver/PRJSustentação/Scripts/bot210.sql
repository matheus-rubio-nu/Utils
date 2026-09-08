SELECT ----------------------------------------------------------------------------------"Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION 
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (210)
ORDER BY KEY ASC;

SELECT  ----------------------------------------------------------------------------------Check exec status
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 210
ORDER BY ID_EXECUTION DESC;

SELECT  ----------------------------------------------------------------------------------Check exec status
	*
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 210
	--AND count_exec = 0
	AND PROCESS_NAME = '210.OMB.Tickets.Classification'
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT *
FROM RPA.RPA_CTRL_OPS_DEFENSE_TICKES_CLASSIFICATION
WHERE ID_EXECUTION = 1011206
ORDER BY DT_UPDATE DESC;

SELECT *
FROM RPA.RPA_CTRL_OPS_DEFENSE_TICKES_CLASSIFICATION
WHERE ID_TICKET IN(120530369)
ORDER BY ID desc;

SELECT *
FROM RPA.RPA_CTRL_OPS_DEFENSE_TICKES_CLASSIFICATION
----------------------------------------------------------------------------------