SELECT ----------------------------------------------------------------------------------"Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION 
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (238)
	--AND KEY LIKE '%CONTROL_TABLE_NAME%'
ORDER BY KEY ASC;

SELECT  ----------------------------------------------------------------------------------Check exec status
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 238
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT *
FROM RPA.RPA_CTRL_OMB_PEDIDO_AVALIACAO_AUTOMATICA_RA
WHERE STATUS = 3
ORDER BY ID;

---------------------------------------------------------------------------------- REMOVER CLIENTE DAS NOTIFICACOES
SELECT *
FROM RPA.RPA_CTRL_OMB_PEDIDO_AVALIACAO_AUTOMATICA_RA
WHERE PHONE = 31989654734;

SELECT ATTEMPS
FROM RPA.RPA_CTRL_OMB_PEDIDO_AVALIACAO_AUTOMATICA_RA
GROUP BY ATTEMPS

https://app.hugme.com.br/api/ticket/v1/tickets?id[eq]=