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
	*
FROM
	RPA.RPA_CTRL_JUD_SIMBA_BASIC_KIT
WHERE
	STATUS_EXTRATO = 'NEW'
	OR STATUS_DADOS = 'REQUESTED' 
	OR STATUS_FATURA IN ('REQUESTED' , 'NOT FOUND')
ORDER BY ID ASC;
-----------------------------------------------------------------------------------QUERY PARA GERACAO DO RELATORIO
SELECT
	CTRL_ENVIO AS "Nº DE CONTROLE"
	,CASE STATUS
		WHEN 3 THEN 'NA FILA'
		WHEN 1 THEN 'FINALIZADO'
		WHEN 6 THEN 'ERRO DE NEGÓCIO'
		WHEN 2 THEN 'ERRO DE APLICAÇÃO'
		WHEN 5 THEN 'CANCELADO'
		WHEN 4 THEN 'EM ANDAMENTO'
		ELSE TO_CHAR(STATUS)
	END AS "STATUS SOLICITACAO"
	,OBS_STATUS AS "DESCRIÇÃO DO STATUS"
	,CASE SOLIC_EXTRATO 
		WHEN 'Y' THEN 'SIM'
		WHEN 'N' THEN 'NÃO'
		ELSE TO_CHAR(SOLIC_EXTRATO) 
	END AS "EXRATO SOLICITADO?"
	,CASE 
		WHEN STATUS <> 1 THEN '-'
		WHEN STATUS_EXTRATO = 'REQUESTED' THEN 'SOLICITADO'
		WHEN STATUS_EXTRATO = 'NO ACTION' THEN '-'
		WHEN STATUS_EXTRATO = 'COMPLETED' THEN 'FEITO'
		WHEN STATUS_EXTRATO = 'CANCELED' THEN 'CANCELADO'
		WHEN STATUS_EXTRATO = 'NEW' THEN 'NA FILA'
		ELSE TO_CHAR(STATUS_EXTRATO)
	END AS "STATUS SOLIC. EXTRATO"
	,CASE SOLIC_FATURA
		WHEN 'Y' THEN 'SIM'
		WHEN 'N' THEN 'NÃO' 
		ELSE TO_CHAR(SOLIC_FATURA) 
	END AS "FATURA SOLICITADA?"
	,CASE
		WHEN STATUS <> 1 THEN '-'
		WHEN STATUS_FATURA = 'REQUESTED' THEN 'SOLICITADO'
		WHEN STATUS_FATURA = 'NO ACTION' THEN '-'
		WHEN STATUS_FATURA = 'COMPLETED' THEN 'FEITO'
		WHEN STATUS_FATURA = 'NOT FOUND' THEN 'NÃO ENCONTRADO'
		WHEN STATUS_FATURA = 'CANCELED' THEN 'CANCELADO'
		WHEN STATUS_FATURA = 'NEW' THEN 'NA FILA'
		ELSE TO_CHAR(STATUS_FATURA)
	END AS "STATUS SOLIC. FATURA"
	,QTD_TENT_FATURA AS "QTDE. TENTATIVAS FATURA"
	,CASE SOLIC_DADOS
		WHEN 'Y' THEN 'SIM'
		WHEN 'N' THEN 'NÃO' 
		ELSE TO_CHAR(SOLIC_DADOS)
	END AS "DADOS SOLICITADOS?"
	,CASE
		WHEN STATUS <> 1 THEN '-'
		WHEN STATUS_DADOS = 'REQUESTED' THEN 'SOLICITADO'
		WHEN STATUS_DADOS = 'NO ACTION' THEN '-'
		WHEN STATUS_DADOS = 'COMPLETED' THEN 'FEITO'
		WHEN STATUS_DADOS = 'CANCELED' THEN 'CANCELADO'
		WHEN STATUS_DADOS = 'NEW' THEN 'NA FILA'
		ELSE TO_CHAR(STATUS_DADOS)
	END AS "STATUS SOLIC. DADOS"
	,CASE SOLIC_3454
		WHEN 'Y' THEN 'SIM'
		WHEN 'N' THEN 'NÃO' 
		ELSE TO_CHAR(SOLIC_3454)
	END AS "É 3454?"
	,TO_CHAR(DT_INSERT, 'DD/MM/YYYY') AS "DATA INSERIDO NA FILA"
	,TO_CHAR(DT_END, 'DD/MM/YYYY HH24:MI') AS "DATA PROCESSAMENTO"
	,ID AS "RPA - ID NA TABELA DE CONTROLE"
	,ID_EXEC AS "RPA - ID DA EXECUÇÃO"
	,QTD_TENTATIVAS AS "QTDE. TENTATIVAS"
	,QTD_TENT_COMPLETUDE AS "QTDE. TENTATIVAS COMPLETUDE"
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
