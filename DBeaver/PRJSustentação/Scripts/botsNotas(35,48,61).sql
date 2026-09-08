SELECT ----------------------------------------------------------------------------------"Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION 
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (61)
ORDER BY KEY ASC;

SELECT  ----------------------------------------------------------------------------------Check exec status
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 48
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT * FROM RPA.RPA_UI_CTRL_NOTAS_CORR WHERE TIPO_REQ = 4 AND STATUS_EXEC = 4 AND (FOLDERID <> '2' OR FOLDERID IS NULL) ORDER BY ID ASC;
SELECT
	*
FROM
	RPA.RPA_UI_CTRL_NOTAS_CORR
WHERE
	TIPO_REQ = 4
	AND (FOLDERID <> '2'
		OR FOLDERID IS NULL)
ORDER BY
	ID DESC;


SELECT *
FROM RPA.RPA_UI_CTRL_NOTAS_CORR
ORDER BY ID DESC;

SELECT *
FROM RPA.RPA_UI_CTRL_NOTAS_CORR
WHERE COD_CLIENTE = '7089221'
ORDER BY ID DESC;

------------------------------------------------------QUEUE PARA REPROCESSAR OS ITENS ESPECIFICOS

--,''

SELECT *
FROM
	RPA.RPA_UI_CTRL_NOTAS_CORR
WHERE
	(TIPO_REQ = 1
		--OR TIPO_REQ = 2
		--OR TIPO_REQ = 3
		--OR TIPO_REQ = 4
		OR TIPO_REQ BETWEEN 5 AND 5.9
		--OR TIPO_REQ = 6 --(DESABILITADOS)
		--OR TIPO_REQ = 7 --(DESABILITADOS)
		--OR TIPO_REQ = 8
		--OR TIPO_REQ = 9
	)
	AND STATUS_EXEC = 6
	AND NUM_CTRL_ENVIO IN ('057-PCPI-000424-10'
		,'060-PCRN-000259-47'
		,'110-TST-002009-81'
		,'110-TST-002022-59')
	AND COD_CLIENTE IN ('4998815'
		,'543915'
		,'16008843'
		,'5842685')
ORDER BY TIPO_REQ ASC, COD_CLIENTE DESC;

----------------------------------------------------------------------------------------------------------bot 035
------------------------------------------------------TIPO_REQ = 3
SELECT
	*
FROM
	RPA.RPA_UI_CTRL_NOTAS_CORR
WHERE
	TIPO_REQ = 3
	--AND STATUS_EXEC = 6
	AND TICKET = '314919'
ORDER BY COD_CLIENTE DESC;

----------------------------------------------------------------------------------------------------------bot 048
------------------------------------------------------TIPO_REQ = 4
SELECT
	*
FROM
	RPA.RPA_UI_CTRL_NOTAS_CORR
WHERE
	TIPO_REQ = 4
	AND STATUS_EXEC = 4
ORDER BY
	ID DESC;


--Query para gerar arquivos para ops PF:
SELECT
	*
FROM
	RPA.RPA_UI_CTRL_NOTAS_CORR
WHERE
	TIPO_REQ = 4
	AND STATUS_EXEC = 4
	AND (FOLDERID <> '2'
		OR FOLDERID IS NULL)
	AND SLACK_CHANNEL = 'C02NXE3L9JR'
ORDER BY
	ID ASC;

--Query para gerar arquivos para Jud:
SELECT
	*
FROM
	RPA.RPA_UI_CTRL_NOTAS_CORR
WHERE
	TIPO_REQ = 4
	AND STATUS_EXEC = 4
	AND (FOLDERID <> '2'
		OR FOLDERID IS NULL)
	AND SLACK_CHANNEL = 'C03DKEUR8GY'
ORDER BY
	ID ASC;
----------------------------------------------------------------------------------------------------------bot 061
----------------------------------------------------TIPO_REQ BETWEEN 5 AND 5.9
SELECT
	*
FROM
	RPA.RPA_UI_CTRL_NOTAS_CORR
WHERE
	TIPO_REQ BETWEEN 5 AND 5.9
	AND FOLDERID <> '2'
	AND STATUS_EXEC = 4

------------------------------------------------------TIPO_REQ = 8
SELECT
	*
FROM
	RPA.RPA_UI_CTRL_NOTAS_CORR
WHERE 
	TIPO_REQ = 8 
	AND STATUS_EXEC = 4
ORDER BY
	ID DESC
