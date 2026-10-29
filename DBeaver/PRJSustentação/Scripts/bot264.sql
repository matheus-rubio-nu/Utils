--"Local" Parameters---------------------------------------------------------------------------------------------------------
SELECT 
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (264)
	--AND KEY LIKE '%CONTROL_TABLE_NAME%'
ORDER BY KEY ASC;
--Check exec status---------------------------------------------------------------------------------------------------------
SELECT 
	*
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 264
ORDER BY ID_EXECUTION DESC;
--CONTROL TABLE---------------------------------------------------------------------------------------------------------
SELECT --FILA
	*
FROM
	RPA.RPA_CTRL_GROWTH_SEDEX
WHERE
	status = 3
	OR ( status = 6
		AND TRUNC(DT_INSERT) = DATE '2026-10-19'
			AND (OBS_STATUS = 'Não foi possivel encontrar o shard do cliente'
				OR OBS_STATUS LIKE '%Card%') );

IS_PROCEDENTE = 0 >> TRUE E o /*EMBASSER = GEMALTO isso n ta sendo retirado da fila de emissao*/ sedex
IS_PROCEDENTE = 1 >> FALSE NAO sedex?

se FOR procedente envia sedex

--Global bot Parameters---------------------------------------------------------------------------------------------------------
SELECT * 
FROM RPA.RPA_GERENCIADOR_GLOBAL_PARAMETERS
ORDER BY key asc;
--------------------------------------------------------------------------------------------------------------------------------