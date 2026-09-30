--"Local" Parameters---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT = 282
ORDER BY KEY ASC;
--CONTROL TABLE---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.RPA_CTRL_CREATE_TICKET_ZENDESK 
WHERE STATUS = 3
ORDER BY ID DESC;

SELECT *
FROM RPA.RPA_CTRL_CREATE_TICKET_ZENDESK 
WHERE CUSTOMER_CPF = '28403371500'
ORDER BY ID DESC;

UPDATE RPA.RPA_CTRL_CREATE_TICKET_ZENDESK 
SET CUSTOMER_CPF = '5|' || CUSTOMER_CPF
WHERE STATUS = 5;
--GERENCIADOR EXECUCOES---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 282
ORDER BY ID_EXECUTION DESC;