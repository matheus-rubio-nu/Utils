SELECT ----------------------------------------------------------------------------------"Local" Parameters
	*
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (213)
ORDER BY KEY ASC;

SELECT  ----------------------------------------------------------------------------------Check exec status
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 213
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT *
FROM RPA.RPA_CTRL_OMB_ENVIO_MACRO_ACOLHIMENTO_0800
ORDER BY ID;

SELECT *
FROM RPA.RPA_CTRL_OMB_ENVIO_MACRO_ACOLHIMENTO_0800
WHERE CUSTOMER_ID = '6740fa6e-eef0-4ca4-8e97-0de2b15949dd'
ORDER BY ID;
---------------------------------------------------------------------------------- 
