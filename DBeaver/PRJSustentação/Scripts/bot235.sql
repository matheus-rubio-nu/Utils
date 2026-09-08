--"Local" Parameters---------------------------------------------------------------------------------------------------------
SELECT 
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (235)
	--AND KEY LIKE '%CONTROL_TABLE_NAME%'
ORDER BY KEY ASC;

--Check exec status---------------------------------------------------------------------------------------------------------
SELECT 
	*
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 235
ORDER BY ID_EXECUTION DESC;

--CONTROL TABLE---------------------------------------------------------------------------------------------------------
SELECT --FILA
	ID 
	,OBS_STATUS 
	,CTRL_ENVIO 
	,STATUS_EXTRATO
	,STATUS_FATURA 
	,STATUS_DADOS 
	,STATUS_3454
	,ID_DRIVE
FROM
	RPA.RPA_CTRL_JUD_SIMBA_BASIC_KIT
WHERE
	STATUS_EXTRATO = 'NEW'
	OR STATUS_DADOS = 'REQUESTED' 
	OR STATUS_FATURA IN ('REQUESTED' , 'NOT FOUND')
	OR OBS_STATUS = 'REPROCESS'
ORDER BY ID ASC;

SELECT --FILA
	COUNT(*)
FROM
	RPA.RPA_CTRL_JUD_SIMBA_BASIC_KIT
WHERE
	STATUS_EXTRATO = 'NEW'
	OR STATUS_DADOS = 'REQUESTED' 
	OR STATUS_FATURA IN ('REQUESTED' , 'NOT FOUND')
	OR OBS_STATUS = 'REPROCESS'
ORDER BY ID ASC;

09/03/2026 18:39:50 Processing item [203973] --consultar o camata

SELECT 
	*
FROM
	RPA.RPA_CTRL_JUD_SIMBA_BASIC_KIT
WHERE
	ID = 203973 
ORDER BY ID ASC;

UPDATE RPA.RPA_CTRL_JUD_SIMBA_BASIC_KIT x
	SET x.OBS_STATUS='REPROCESS'
	WHERE x.CTRL_ENVIO='024-PCSC-001323-99'
	AND x.SOLIC_3454 = 'N';
--Global bot Parameters---------------------------------------------------------------------------------------------------------
SELECT * 
FROM RPA.RPA_GERENCIADOR_GLOBAL_PARAMETERS
ORDER BY key asc;
--------------------------------------------------------------------------------------------------------------------------------
--METRICAS:------------------------------------------------------------------------------------------------------------------------------
/*
1) número? de casos PF (pessoa física) + STA processados end-to-end, com geração e envio automático dos documentos à autoridade competente.

2) número? casos SIMBA com documentos gerados e pedido via cooperação técnica, a serem transmitidos via validador/transmissor.

3) número? casos PJ com geração parcial de documentos, considerando limitações do escopo atual da automação.

4) número? de casos com falha na geração de documentos (Extrato Nuconta - timeout de API).
*/

SELECT 
    -- 1) Casos PF + STA (End-to-End)
    COUNT(CASE 
        WHEN TP_PESSOA = 'F' 
         AND ORIGEM = 'CCS' 
         AND STATUS_EXTRATO = 'COMPLETED' 
        THEN 1 END) AS TOTAL_PF_STA_E2E,
    -- 2) Casos SIMBA (Sistema de Envio 'S')
    COUNT(CASE 
        WHEN SISTEMA_ENVIO = 'S' 
        THEN 1 END) AS TOTAL_SIMBA_COOP_TECNICA,
    -- 3) Casos PJ com geração parcial
    COUNT(CASE 
        WHEN TP_PESSOA = 'J' 
         AND (STATUS_EXTRATO = 'COMPLETED' OR STATUS_FATURA = 'COMPLETED' OR STATUS_DADOS = 'COMPLETED')
         AND (STATUS_EXTRATO <> 'COMPLETED' OR STATUS_FATURA <> 'COMPLETED' OR STATUS_DADOS <> 'COMPLETED')
        THEN 1 END) AS TOTAL_PJ_PARCIAL,
    -- 4) Falha na geração (Timeout API)
    COUNT(CASE 
        WHEN STATUS_EXTRATO = 'ERRO' 
        THEN 1 END) AS TOTAL_FALHA_EXTRATO_TIMEOUT
FROM RPA.RPA_CTRL_JUD_SIMBA_BASIC_KIT
WHERE DT_INSERT BETWEEN DATE '2026-07-01' AND DATE '2026-07-31';
