-----------------------------------------------------------------------------------"Local" Parameters
SELECT
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (156)
ORDER BY KEY ASC;

{
    'WEEKDAYS': ['SUNDAY'],
    'PERIOD': ['00:50-02:00'
	,'12:20-13:00']
};
-----------------------------------------------------------------------------------Check exec status
SELECT  
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 156
	AND COUNT_EXEC IS NOT NULL
ORDER BY ID_EXECUTION DESC; 
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT * --FILA
FROM RPA.RPA_CTRL_STA_NUBANK
WHERE STATUS = '3'
ORDER BY ID ASC;

SELECT COUNT(*)
FROM RPA.RPA_CTRL_STA_NUBANK
WHERE STATUS = '3';

SELECT *
FROM RPA.RPA_CTRL_STA_NUBANK
WHERE CCS_NUMBER IN ('20260414246234512')
ORDER BY ID DESC;

SELECT *
FROM RPA.RPA_CTRL_STA_NUBANK
WHERE ID = 418454
ORDER BY ID DESC;
-----------------------------------------------------------------------------------QUERY PARA GERACAO DO RELATORIO
SELECT
	CCS_NUMBER AS "Nº DE CONTROLE"
	,CASE STATUS
		WHEN '3' THEN 'NA FILA'
		WHEN '1' THEN 'FINALIZADO'
		WHEN '6' THEN 'ERRO DE NEGÓCIO'
		WHEN '2' THEN 'ERRO DE APLICAÇÃO'
		WHEN '5' THEN 'CANCELADO'
		WHEN '4' THEN 'EM ANDAMENTO'
		ELSE TO_CHAR(STATUS)
	END AS "ETAPA"
	,OBS_STATUS AS "DESCRIÇÃO DA ETAPA"
	,TO_CHAR(DT_INSERT, 'DD/MM/YYYY') AS "DATA INSERIDO NA FILA"
	,TO_CHAR(DT_END, 'DD/MM/YYYY HH24:MI') AS "DATA PROCESSAMENTO"
	,ID AS "RPA - ID NA TABELA DE CONTROLE"
	,ID_EXEC AS "RPA - ID DA EXECUÇÃO"
FROM
	RPA.RPA_CTRL_STA_NUBANK
ORDER BY ID DESC;
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