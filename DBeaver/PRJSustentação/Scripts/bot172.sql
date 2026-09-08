SELECT ---------------------------------------------------------------------------------- "Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (172)
ORDER BY KEY ASC;

SELECT  ---------------------------------------------------------------------------------- Check exec status
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 178
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT *
FROM RPA.RPA_CTRL_AML_CFT_CPF_IRREGULAR_EMS
WHERE STATUS = 'Processing'
ORDER BY ID DESC;

SELECT *
FROM RPA.RPA_CTRL_AML_CFT_CPF_IRREGULAR_EMS
WHERE CPF = '00000046001'
ORDER BY ID DESC;


SELECT *
FROM RPA.RPA_CTRL_AML_CFT_CPF_IRREGULAR_EMS
WHERE ACCOUNT_STATUS = 'CUSTOMER-ESPOLIO'
ORDER BY ID DESC;


SELECT *
FROM RPA.RPA_CTRL_AML_CFT_CPF_IRREGULAR_EMS
WHERE CPF = ':CPF:'
	AND ACCOUNT_STATUS = 'CUSTOMER-ESPOLIO'
	AND STATUS = 'Processing';
ORDER BY ID DESC;
---------------------------------------------------------------------------------- Global bot Parameters
SELECT * 
FROM RPA.RPA_GERENCIADOR_GLOBAL_PARAMETERS
ORDER BY key asc;

SELECT
	*
FROM
	regs.customer_users cu
WHERE
	(cu.name LIKE '% ESPÓLIO'
		OR cu.name LIKE '% ESPOLIO')
	AND cu.STATUS = 'A'
	AND cu.LASTMODIFICATIONDATE >= (SYSDATE - 30);

SELECT
	COUNT(*)
FROM
	regs.customer_users cu
WHERE
	(cu.name LIKE '% ESPÓLIO'
		OR cu.name LIKE '% ESPOLIO')
	AND cu.STATUS = 'A'
	AND cu.LASTMODIFICATIONDATE <= (SYSDATE - 30);

SELECT
	*
FROM
	regs.customer_users cu
WHERE
	CUSTOMERID = '00000046001';
SELECT
	*
FROM
	regs.customer_users cu
WHERE
	ACCOUNTNUMBER = '5288184';



	AND cu.LASTMODIFICATIONDATE >= (sysdate -30);