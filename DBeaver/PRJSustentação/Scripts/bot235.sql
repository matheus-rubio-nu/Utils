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
	ID_EXECUTION 
	,INI_EXECUTION
	,END_EXECUTION
	,STATUS 
	,COUNT_EXEC 
	,ENVIRONMENT 
	,HOST_NAME 
	,EXTERNAL_ID
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 235
	AND ID_EXECUTION >= 1060800
ORDER BY ID_EXECUTION DESC;

SELECT 
    ID_EXECUTION 
  , INI_EXECUTION || ' (' || TO_CHAR(TO_DATE(INI_EXECUTION, 'DD/MM/YYYY HH24:MI:SS'), 'DY', 'NLS_DATE_LANGUAGE=AMERICAN') || ')' AS INI_EXECUTION_COM_DIA
  , END_EXECUTION
  , STATUS 
  , COUNT_EXEC AS QTDE_ITENS_PROCESSADOS
  , ENVIRONMENT 
  , HOST_NAME 
  , EXTERNAL_ID
  , PROCESS_NAME 
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 235
  AND (PROCESS_NAME = '235.JUD.Simba.Basic.Kit.RequestDocs' OR PROCESS_NAME IS NULL)
  -- Filtra apenas Segunda (MON) ou Terça-feira (TUE) na data de início
  AND TO_CHAR(TO_DATE(INI_EXECUTION, 'DD/MM/YYYY HH24:MI:SS'), 'DY', 'NLS_DATE_LANGUAGE=AMERICAN') IN ('MON', 'TUE')
  -- Filtra apenas execuções iniciadas antes das 03:00 AM (horas 00, 01 e 02)
  AND TO_NUMBER(TO_CHAR(TO_DATE(INI_EXECUTION, 'DD/MM/YYYY HH24:MI:SS'), 'HH24')) < 2
ORDER BY ID_EXECUTION DESC;
--CONTROL TABLE---------------------------------------------------------------------------------------------------------
SELECT
	*
FROM
	RPA.RPA_CTRL_JUD_SIMBA_BASIC_KIT
WHERE STATUS_FATURA LIKE '%ERRO%' 
ORDER BY ID DESC;

SELECT
	*
FROM
	RPA.RPA_CTRL_JUD_SIMBA_BASIC_KIT
WHERE
	STATUS_EXTRATO = 'NEW'
	OR STATUS_DADOS = 'REQUESTED' 
	OR STATUS_FATURA = 'REQUESTED'
ORDER BY ID DESC;

SELECT
	*
FROM
	RPA.RPA_CTRL_JUD_SIMBA_BASIC_KIT
ORDER BY ID DESC;
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
