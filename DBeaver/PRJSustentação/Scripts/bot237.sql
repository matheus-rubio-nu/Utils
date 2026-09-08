SELECT ----------------------------------------------------------------------------------"Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION 
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (237)
ORDER BY KEY ASC;

SELECT  ----------------------------------------------------------------------------------Check exec status
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 237
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT *
FROM RPA.RPA_CTRL_REGSOL_CANCELAMENTO_UNIFICADO
ORDER BY ID DESC;

SELECT *
FROM RPA.RPA_CTRL_REGSOL_CANCELAMENTO_UNIFICADO
WHERE ID_EXEC = 949708
	AND CPF = '00000046700'
ORDER BY ID DESC;

SELECT *
FROM RPA.RPA_CTRL_REGSOL_CANCELAMENTO_UNIFICADO
WHERE CPF = '00000046700'
ORDER BY ID DESC;
---------------------------------------------------------------------------------- 

SELECT
  C.easynvest_account__id as ACI
FROM
   etl.br__dataset.sina_tscclibol A
INNER JOIN
  etl.br__contract.customers__customers B
ON
  B.customer__cpf = A.cd_cpfcgc_hash
INNER JOIN etl.br__contract.investment_accounts__investment_accounts C
ON B.customer__id = C.customer__id
LEFT JOIN etl.br__dataset.investments_daily_custody D
ON C.customer__id = D.customer__id
AND D.date = '%DATE%'
WHERE
  (D.CUSTODY_TREASURY_DIRECT = 0 OR D.CUSTODY_TREASURY_DIRECT IS NULL)
  AND (D.CUSTODY_VARIABLE_INCOME = 0 OR D.CUSTODY_VARIABLE_INCOME IS NULL)
  AND A.dt_ult_oper <= current_date() - INTERVAL 58 MONTH
  AND A.in_situac = 'A'
  AND C.easynvest_account__id IS NOT NULL
  
  
	
SELECT
	A.in_situac,
	C.easynvest_account__id
FROM
	etl.br__dataset.sina_tscclibol A
INNER JOIN
  etl.br__contract.customers__customers B
ON
	B.customer__cpf = A.cd_cpfcgc_hash
INNER JOIN etl.br__contract.investment_accounts__investment_accounts C
ON
	B.customer__id = C.customer__id
WHERE
	B.customer__id = "+sCurCustomerId+"