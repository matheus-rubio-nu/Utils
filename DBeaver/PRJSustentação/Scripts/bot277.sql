--"Local" Parameters---------------------------------------------------------------------------------------------------------
SELECT KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (167)
	--AND KEY LIKE '%CONTROL_TABLE_NAME%'
ORDER BY KEY ASC;
--GERENCIADOR EXECUCOES---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 167
ORDER BY ID_EXECUTION DESC;

SELECT 
    ID_BOT
    ,TO_TIMESTAMP(END_EXECUTION, 'DD/MM/YYYY HH24:MI:SS') - 
    		TO_TIMESTAMP(INI_EXECUTION, 'DD/MM/YYYY HH24:MI:SS') AS DURACAO_INTERVALO
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 157
	AND END_EXECUTION IS NOT NULL
ORDER BY ID_EXECUTION DESC;
--CONTROL TABLE---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.[control_table]
ORDER BY ID DESC;
--Global bot Parameters---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.RPA_GERENCIADOR_GLOBAL_PARAMETERS
ORDER BY KEY ASC;
--------------------------------------------------------------------------------------------------------------------------------