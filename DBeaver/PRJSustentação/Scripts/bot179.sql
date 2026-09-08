--"Local" Parameters---------------------------------------------------------------------------------------------------------
SELECT KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT = 179
ORDER BY KEY ASC;

--CONTROL TABLE---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.[control_table]
ORDER BY ID DESC;
--GERENCIADOR EXECUCOES---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 119
ORDER BY ID_EXECUTION DESC;
--Global bot Parameters---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.RPA_GERENCIADOR_GLOBAL_PARAMETERS
ORDER BY KEY ASC;
--------------------------------------------------------------------------------------------------------------------------------
--CALENDAR----------------------------------------------------------------------------------------------------------
SELECT
	MES_ANO,
	DATA_COMPLETA,
	DIA_FERIADO,
	DIA_FERIADO_SP,
	DIA_FINAL_SEMANA,
	DIA_ULTIMO_UTIL,
	DIA_UTIL_MES,
	MES,
	MES_NOME,
	MES_NOME_ABREVIADO,
	MES_SEMANA,
	ANO,
	ANO_SEMANA,
	BIMESTRE,
	BIMESTRE_NOME,
	TRIMESTRE,
	TRIMESTRE_NOME,
	SEMESTRE,
	SEMESTRE_NOME,
	DIA_FERIADO_B3,
	CONTADOR_DIAS_UTEIS
FROM
	RPA.CALENDAR
WHERE
	CAST(MES_ANO AS VARCHAR(10)) LIKE '2025%'
	AND DIA_FERIADO = 1
ORDER BY ID_EXECUTION DESC;
--Gerenciador de bots---------------------------------------------------------------------------------------------------------
SELECT
	*
FROM RPA.RPA_AA_GERENCIADOR_ROBOS gr
WHERE BU = 'Brazil - Operations'
	AND ID = 276;