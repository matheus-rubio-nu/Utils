--"Local" Parameters---------------------------------------------------------------------------------------------------------
SELECT 
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (185)
ORDER BY KEY ASC;
--Check exec status---------------------------------------------------------------------------------------------------------
SELECT 
	*
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 185
ORDER BY ID_EXECUTION DESC;
--CONTROL TABLE---------------------------------------------------------------------------------------------------------
SELECT *
FROM RPA.RPA_CTRL_CX_DECLARACAO_INVESTMENTS
WHERE CPF = '00000046300'
 AND TIMESTAMP_REQUEST = '2/5/2026 22:56:44'
ORDER BY TO_DATE(TIMESTAMP_REQUEST, 'MM/DD/YYYY HH24:MI:SS') DESC;

SELECT
	COUNT(*) AS QTD_EXEC
FROM  
	RPA.RPA_CTRL_CX_DECLARACAO_INVESTMENTS  
WHERE 
	CPF = '%CPF%' AND
	TIMESTAMP_REQUEST = '%TIME%'AND
	TYPE_REQUEST = 'DBV RETROATIVO' AND 
	PERIOD_START  = '%START%' AND
	PERIOD_END  = '%END%'|
SELECT
	COUNT(*) AS QTD_EXEC
FROM  
	RPA.RPA_CTRL_CX_DECLARACAO_INVESTMENTS  
WHERE 
	CPF = '%CPF%' AND
	TIMESTAMP_REQUEST = '%TIME%'AND
	TYPE_REQUEST = 'DBV ATUAL';

SELECT CPF, TIMESTAMP_REQUEST, COUNT(*)
FROM RPA.RPA_CTRL_CX_DECLARACAO_INVESTMENTS
GROUP BY CPF, TIMESTAMP_REQUEST
ORDER BY TO_DATE(TIMESTAMP_REQUEST, 'MM/DD/YYYY HH24:MI:SS') DESC;
--Global bot Parameters---------------------------------------------------------------------------------------------------------
SELECT * 
FROM RPA.RPA_GERENCIADOR_GLOBAL_PARAMETERS
ORDER BY key asc;
--------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM RPA.RPA_CTRL_CX_DECLARACAO_INVESTMENTS WHERE CPF = '"+sCpf+"' AND TIMESTAMP_REQUEST = '"+sTimeStampRequest+"' AND PERIOD_START = '"+sPeridodStart+"' AND PERIOD_END = '"+sPeriodEnd+"';

INSERT INTO RPA.RPA_CTRL_CX_DECLARACAO_INVESTMENTS
(
	DT_EXEC,
	CUSTOMER_ID,
	NAME, 
	PREFERRED_NAME,
	CPF,
	EMAIL, 
	ADDRESS, 
	ACCOUNT_NUMBER,
	OPENING_ACCOUNT_DATE, 
	TYPE_REQUEST, 
	PERIOD_START, 
	PERIOD_END, 
	LAST_DAY_DATE, 
	ASSET_TYPE, 
	CUSTODY_VALUE,
	STATUS, 
	REASON, 
	TIMESTAMP_REQUEST, 
	EMAIL_REQUEST
)
VALUES(
	SYSDATE,
	'%CUSTOMER%',
	'%NAME%',
	'%PREFERRED%',
	'%CPF%',
	'%EMAIL%',
	'%ADDRESS%',
	'%ACCOUNT%',
	'%OPENING%',
	'%TYPE%',
	'%START%',
	'%END%',
	'%LASTDAY%',
	'%ASSET%',
	%CUSTODY%,
	'%STATUS%',
	'%REASON%',
	'%TIME%',
	'%REQUESTER%'
)



