--"Local" Parameters---------------------------------------------------------------------------------------------------------
SELECT 
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (153)
	--AND KEY LIKE '%CONTROL_TABLE_NAME%'
ORDER BY KEY ASC;
--Check exec status---------------------------------------------------------------------------------------------------------
SELECT 
	ID_EXECUTION 
	,INI_EXECUTION
	,END_EXECUTION
	,STATUS 
	,COUNT_EXEC 
	,ENVIRONMENT 
	,HOST_NAME 
	,EXTERNAL_ID
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 156
ORDER BY ID_EXECUTION DESC;
--CONTROL TABLE---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.RPA_CTRL_REGSOL_JUD_LEITURA_DE_OFICIOS
ORDER BY ID DESC;
--Global bot Parameters---------------------------------------------------------------------------------------------------------
SELECT * 
FROM RPA.RPA_GERENCIADOR_GLOBAL_PARAMETERS
ORDER BY key asc;
-------------------------------------------------------------------------------------------------------------------------------
--METRICAS--------------------------------------------------------------------------------------------------------------------
SELECT 
	*
FROM RPA.RPA_CTRL_REGSOL_JUD_LEITURA_DE_OFICIOS_EMAILS

--------------------------------------------------------------------------------------------------------------------------------
/* Sobre o RPA para leitura de oficios sabem me dizer se temos como extrair métricas voltadas ao canal de entrada ?
Sendo:
PRAJA (AWSS3)
Zendesk/Email (EMAILZENDESK)
Google Drive (GDRIVE)
*/

SELECT 
	FILE_ORIGIN
	,COUNT(*) AS QTDE
FROM RPA.RPA_CTRL_REGSOL_JUD_LEITURA_DE_OFICIOS
WHERE TO_DATE(DT_INSERT) = TO_DATE(DT_END)
	AND TO_CHAR(DT_INSERT , 'MM')  = 7
GROUP BY FILE_ORIGIN 
--------------------------------------------------------------------------------------------------------------------------------
/*Pessoal Bom dia tudo bem ? O Klips havia extraído tempos atrás um relatório do action center, action activities, 
 contendo as 
 task id, PRAJA_SUBMISSION_ID ou AC_ZENDESK_TICKET_NUMBER?
 task activity, 
 Task Activity Id, 
 Target User e 
 data de criação eh (AC_REQUESTED_PERIOD_START_DATE)?
preciso 
 dos meses de Julho e Agosto para mensuração de time spent. 
 */

SELECT 
	*
FROM RPA.RPA_CTRL_REGSOL_JUD_LEITURA_DE_OFICIOS
ORDER BY ID DESC