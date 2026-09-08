-- PATH da planilha: https://docs.google.com/spreadsheets/d/1qvm9Kzsv9HmeoUv41wGsT6p_u7sM-IbFbtIzESeDZCI/edit?gid=872652057#gid=872652057

SELECT --"Local" Parameters
	ID_BOT 
	,KEY
	,VALUE
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS
WHERE ID_BOT  IN (117)
ORDER BY KEY ASC;