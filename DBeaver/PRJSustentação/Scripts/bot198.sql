--"Local" Parameters---------------------------------------------------------------------------------------------------------
SELECT 
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (198)
ORDER BY KEY ASC;
--Check exec status---------------------------------------------------------------------------------------------------------
SELECT 
	*
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 198
ORDER BY ID_EXECUTION DESC;
--CONTROL TABLE---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.RPA_CTRL_OMB_MODERACAO_RECLAME_AQUI
WHERE STATUS = 'Processing'
ORDER BY ID DESC;

SELECT
	ID,
	SQUAD,
	REASON_RA,
	SUBREASON_RA,
	ZENDESK_TICKET_ID,
	RECLAME_AQUI_ID,
	CUSTOMER_ID,
	COD_MOTIVO,
	REASON_TYPE,
	REASON_MACRO
FROM
	RPA.RPA_CTRL_OMB_MODERACAO_RECLAME_AQUI
WHERE
	STATUS = 'Processing'
	AND SQUAD NOT IN ('INV OPS', 'investigative_operations_')
	AND UPPER(SUBREASON_RA) NOT IN ('CONTA::PIX::INDEVIDO')


SELECT
	ID,
	DT_EXEC,
	SQUAD,
	REASON_RA,
	SUBREASON_RA,
	ZENDESK_TICKET_ID,
	RECLAME_AQUI_ID,
	CUSTOMER_ID,
	DATA_HORA_ENVIO,
	REASON_MACRO,
	STATUS,
	OBS
FROM  
	RPA.RPA_CTRL_OMB_MODERACAO_RECLAME_AQUI
WHERE 
	STATUS <> 'Processing'
	--AND DT_UPDATE > TIMESTAMP '%STARTDATETIME%'
ORDER BY ID;
--Global bot Parameters---------------------------------------------------------------------------------------------------------
SELECT * 
FROM RPA.RPA_GERENCIADOR_GLOBAL_PARAMETERS
ORDER BY key asc;
--------------------------------------------------------------------------------------------------------------------------------
