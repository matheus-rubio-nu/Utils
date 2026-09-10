SELECT ---------------------------------------------------------------------------------- "Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (156)
ORDER BY KEY ASC;

SELECT ---------------------------------------------------------------------------------- "Local" Parameters
	*
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (156)
ORDER BY KEY ASC;

SELECT  ---------------------------------------------------------------------------------- Check exec status
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 156
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT * --FILA
FROM RPA.RPA_CTRL_STA_NUBANK
WHERE STATUS = '3';

status = '5', obs_status = 'RPA-3385' onde status = '3'
SELECT COUNT(*)
FROM RPA.RPA_CTRL_STA_NUBANK
WHERE STATUS = '3';

SELECT *
FROM RPA.RPA_CTRL_STA_NUBANK
WHERE CCS_NUMBER = '20260729818554783'
ORDER BY ID DESC;

{
    'WEEKDAYS': ['SUNDAY'],
    'PERIOD': ['00:50-02:00'
	,'12:30-13:00']
}



---------------------------------------------------------------------------------- Global bot Parameters
SELECT * 
FROM RPA.RPA_GERENCIADOR_GLOBAL_PARAMETERS
ORDER BY key asc;
----------------------------------------------------------------------------------


SELECT  ---------------------------------------------------------------------------------- METRICAS
	'07/2026' AS PERIODO
	,COUNT(*) AS QTDE_EXECS
	,SUM(COUNT_EXEC) AS ITENS
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 156
	AND ENVIRONMENT = 3
	AND STATUS = 1
	AND INI_EXECUTION LIKE '%07/2026%'
ORDER BY ID_EXECUTION DESC;