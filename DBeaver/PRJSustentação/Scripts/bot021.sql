SELECT ---------------------------------------------------------------------------------- "Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (21)
ORDER BY KEY ASC;

SELECT  ---------------------------------------------------------------------------------- Check exec status
	*
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 21
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT *
FROM RPA.RPA_CTRL_DATA_PEOPLE_LINKED
ORDER BY ID DESC;

SELECT *
FROM RPA.RPA_CTRL_PEOPLE_LINKED
ORDER BY ID DESC;
