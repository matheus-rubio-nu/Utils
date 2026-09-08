------------------------------------------------------------------------------------------------------CREVIEWERS
SELECT * 
FROM RPA.RPA_CTRL_CODE_REVIEW_ANALYST
WHERE NAME = '"+in_sUserName+"'
ORDER BY NAME ASC;
------------------------------------------------------------------------------------------------------CHANGE MANAGEMENT BOTS
SELECT
	*
FROM RPA.RPA_CHANGES rc
WHERE rc.IS_CONCLUDED  = 0
ORDER BY ID ASC;
------------------------------------------------------------------------------------------------------CMINHAS CHANGES
SELECT 
	*
FROM RPA.RPA_CHANGES rc
WHERE rc.AUTHOR  = 'matheus.rubio.gft'
ORDER BY 1 desc;
------------------------------------------------------------------------------------------------------CBOTS VERSION
SELECT 
	*
FROM
	RPA.RPA_CTRL_PROJECTS_VERSION
WHERE PROCESS_ID LIKE '105%';

