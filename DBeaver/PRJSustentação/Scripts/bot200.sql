SELECT ----------------------------------------------------------------------------------"Local" Parameters
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (200)
ORDER BY KEY ASC;

SELECT  ----------------------------------------------------------------------------------Check exec status
 *
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 200
ORDER BY ID_EXECUTION DESC;
---------------------------------------------------------------------------------- CONTROL TABLE
SELECT *
FROM RPA.[control_table]
ORDER BY ID DESC;
---------------------------------------------------------------------------------- 

{
  "ouvidoria": [
    {
      "abaTemplate": "Template <> WLs - Individual - Ouvidoria",
      "abaPrincipal": "WLs - Individual - Ouvidoria",
      "slackId": "C06L82PDYJX"
    }
  ],
  "aml": [
    {
      "abaTemplate": "Template <> WLs - Individual - AML CFT",
      "abaPrincipal": "WLs - Individual - AML CFT",
      "slackId": "C06L828S62F"
    }
  ]
}