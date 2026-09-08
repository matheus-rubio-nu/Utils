--"Local" Parameters---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT = 281
ORDER BY KEY ASC;
--CONTROL TABLE---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.RPA_CTRL_POSITIVE_REGISTRY
ORDER BY ID DESC;

SELECT count(*)
FROM RPA.RPA_CTRL_POSITIVE_REGISTRY
WHERE STATUS IN (1, 6);
--GERENCIADOR EXECUCOES---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 196
ORDER BY ID_EXECUTION DESC;