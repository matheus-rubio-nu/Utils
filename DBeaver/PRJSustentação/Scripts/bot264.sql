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
SELECT *  
FROM RPA.RPA_CTRL_GROWTH_SEDEX
ORDER BY ID DESC;

SELECT
    SUM(CASE WHEN UV_REQUEST = 0 THEN 1 ELSE 0 END) AS CLIENT_UV,
    SUM(CASE WHEN UV_REQUEST = 1 THEN 1 ELSE 0 END) AS CLIENT_ROXINHO,
    COUNT(*) AS TOTAL_GERAL
FROM RPA.RPA_CTRL_GROWTH_SEDEX
WHERE UV_REQUEST IS NOT NULL;

IS_PROCEDENTE = 0 >> TRUE E o /*EMBASSER = GEMALTO isso n ta sendo retirado da fila de emissao*/ sedex
IS_PROCEDENTE = 1 >> FALSE NAO sedex?

se FOR procedente envia sedex

SELECT *  
FROM RPA.RPA_CTRL_GROWTH_SEDEX
WHERE IS_PROCEDENTE = 0
ORDER BY ID DESC;

--Qual a media de cartao roxinho por execucao do bot?
WITH ContagemPorExecucao AS (
    SELECT 
        ID_EXEC,
        COUNT(*) AS total_cartoes
    FROM RPA.RPA_CTRL_GROWTH_SEDEX
    WHERE UV_REQUEST = 1 -- Solicitacao de roxinho
    GROUP BY ID_EXEC
)
SELECT 
    ROUND(AVG(total_cartoes * 1.0), 0) AS media_cartoes_por_execucao
FROM ContagemPorExecucao;

MEDIA_CARTOES_ROXINHO__POR_EXECUCAO --RESULTADO
50

--Quantos % de roxinho caem pra sedex? 
WITH ContagemPorExecucao AS (
    SELECT 
        ID_EXEC,
        COUNT(*) AS total_cartoes
    FROM RPA.RPA_CTRL_GROWTH_SEDEX
    WHERE UV_REQUEST = 1 --Request de roxinho
    	AND IS_PROCEDENTE = 0 --Enviado para o sedex
    GROUP BY ID_EXEC
)
SELECT 
    ROUND(AVG(total_cartoes * 1.0), 0) AS media_cartoes_roxinho
FROM ContagemPorExecucao;

MEDIA_CARTOES_ROXINHO --RESULTADO
35

--Quantos % de uv caem pra sedex?
WITH ContagemPorExecucao AS (
    SELECT 
        ID_EXEC,
        COUNT(*) AS total_cartoes
    FROM RPA.RPA_CTRL_GROWTH_SEDEX
    WHERE UV_REQUEST = 0 --Request de UV
    	AND IS_PROCEDENTE = 0 --Enviado para o sedex
    GROUP BY ID_EXEC
)
SELECT 
    ROUND(AVG(total_cartoes * 1.0), 0) AS media_cartoes_UV
FROM ContagemPorExecucao;

MEDIA_CARTOES_UV --RESULTADO
4
--Global bot Parameters---------------------------------------------------------------------------------------------------------
SELECT * 
FROM RPA.RPA_GERENCIADOR_GLOBAL_PARAMETERS
ORDER BY key asc;
--------------------------------------------------------------------------------------------------------------------------------