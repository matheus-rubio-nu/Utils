--"Local" Parameters---------------------------------------------------------------------------------------------------------
SELECT KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT = 199
ORDER BY KEY ASC;
--CONTROL TABLE---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.RPA_CX_CTRL_ALTER_CADAST 
ORDER BY ID DESC;

SELECT * FROM RPA.RPA_CX_CTRL_ALTER_CADAST WHERE STATUS = 'NEW'

--GERENCIADOR EXECUCOES---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 199
ORDER BY ID_EXECUTION DESC;

--Tempo EXECUCAO------------------------------------
SELECT 
    ID_BOT
    ,TO_TIMESTAMP(END_EXECUTION, 'DD/MM/YYYY HH24:MI:SS') - 
    		TO_TIMESTAMP(INI_EXECUTION, 'DD/MM/YYYY HH24:MI:SS') AS DURACAO_INTERVALO
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 199
	AND END_EXECUTION IS NOT NULL
ORDER BY ID_EXECUTION DESC;
--Tempo MEDIO EXECUCAO------------------------------------
SELECT 
    ID_BOT,
    AVG(
        (TO_DATE(END_EXECUTION, 'DD/MM/YYYY HH24:MI:SS') - 
         TO_DATE(INI_EXECUTION, 'DD/MM/YYYY HH24:MI:SS')) * 1440
    ) AS MEDIA_MINUTOS_DOUBLE
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 199
GROUP BY ID_BOT;

