SELECT ----------------------------------------------------------------------------------"Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION 
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT  IN (240)
ORDER BY KEY ASC;

SELECT  ----------------------------------------------------------------------------------Check exec status
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 240
ORDER BY ID_EXECUTION DESC;
----------------------------------------------------------------------------------

SELECT * FROM RPA.RPA_CTRL_JUD_OFFICIAL_LETTER_TYPE_OTHERS
WHERE ID_OFICIO = 311751
AND STATUS = 3
ORDER BY ID DESC;
