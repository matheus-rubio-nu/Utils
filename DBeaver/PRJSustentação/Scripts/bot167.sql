SELECT ---------------------------------------------------------------------------------- "Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (167)
ORDER BY KEY ASC;

SELECT  ---------------------------------------------------------------------------------- Check exec status
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 167
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT --FILA
	ID,
	CPF,
	ACCOUNTNUMBER,
	REQUEST_TICKET_ID,
	SYSTEM_REQUEST
FROM RPA.RPA_CTRL_REGSOL_REATIVACAO_CONTAS
WHERE STATUS = 'Processing'
AND TRUNC(DT_EXEC) = TRUNC(SYSDATE)
ORDER BY SYSTEM_REQUEST;

---------------------------------------------------------------------------------- Global bot Parameters
SELECT * 
FROM RPA.RPA_GERENCIADOR_GLOBAL_PARAMETERS
ORDER BY key asc;
----------------------------------------------------------------------------------

SELECT
	CASE
		WHEN customer_is_pep_official = TRUE THEN 'SIM'
		ELSE 'NAO'
	END AS CUSTOMER_IS_PEP,
	CASE
		WHEN customer_is_lrn = TRUE THEN 'SIM'
		ELSE 'NAO'
	END AS CUSTOMER_IS_LRN
FROM
	nu-br-data.dataset.reported_pep_lrn_customers
	etl.br__dataset.reported_pep_lrn_customers
WHERE
	UPPER(customer__id) = '5C6E7A5A-B1C5-4858-BE84-D75B9D936274'

SELECT
	CASE
		WHEN customer_is_pep_official = TRUE THEN 'SIM'
		ELSE 'NAO'
	END AS CUSTOMER_IS_PEP,
	CASE
		WHEN customer_is_lrn = TRUE THEN 'SIM'
		ELSE 'NAO'
	END AS CUSTOMER_IS_LRN
FROM
	nu-br-data.dataset.reported_pep_lrn_customers
	etl.br__dataset.reported_pep_lrn_customers
WHERE
	UPPER(customer__id) = UPPER('540f8f05-f3a4-4c36-aa6d-9cd110015baf')
	
SELECT
	CASE
		WHEN customer_is_pep_official = TRUE THEN 'SIM'
		ELSE 'NAO'
	END AS CUSTOMER_IS_PEP,
	CASE
		WHEN customer_is_lrn = TRUE THEN 'SIM'
		ELSE 'NAO'
	END AS CUSTOMER_IS_LRN
FROM
	nu-br-data.dataset.reported_pep_lrn_customers
WHERE
	UPPER(customer__id) = '%CUSTOMER_ID%'

SELECT
	CASE
		WHEN customer_is_pep_official = TRUE THEN 'SIM'
		ELSE 'NAO'
	END AS CUSTOMER_IS_PEP,
	CASE
		WHEN customer_is_lrn = TRUE THEN 'SIM'
		ELSE 'NAO'
	END AS CUSTOMER_IS_LRN
FROM
	etl.br__dataset.reported_pep_lrn_customers
WHERE
	UPPER(customer__id) = '%CUSTOMER_ID%'