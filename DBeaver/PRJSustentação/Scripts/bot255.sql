SELECT ----------------------------------------------------------------------------------"Local" Parameters
	ID_BOT 
	,KEY
	,VALUE
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS
WHERE ID_BOT  IN (255)
ORDER BY KEY ASC;


SELECT
	*
FROM
	RPA.RPA_CTRL_COMPSOL_AGENCIA_EXTERNA_SLACK_MONITOR
ORDER BY
	ID DESC;