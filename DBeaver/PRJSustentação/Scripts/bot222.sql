--"Local" Parameters---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT = 222
ORDER BY KEY ASC;
--CONTROL TABLE---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.RPA_CTRL_JUD_TRIAGEM_SIMBA
ORDER BY ID DESC;

--GERENCIADOR EXECUCOES---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 222
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
	ID, RESPONSIBLE
FROM RPA.RPA_AA_GERENCIADOR_ROBOS gr
WHERE BU = 'Brazil - Operations'
	AND gr.ENABLE = '1'
ORDER BY ID ASC;

SELECT ID_BOT, RESPONSIBLE
FROM RPA.RPA_AA_GERENCIADOR_APLIC_BOTS
WHERE U = 'Brazil - Operations'
ORDER BY ID_BOT ASC;