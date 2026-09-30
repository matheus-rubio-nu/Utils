--"Local" Parameters--------------------------------------------------------------------------------
SELECT 
	KEY
	,pr.VALUE
	,DESCRIPTION
FROM RPA.RPA_AA_GERENCIADOR_PARAMETERS pr
WHERE ID_BOT IN (196)
ORDER BY KEY ASC;
--Check exec status--------------------------------------------------------------------------------
SELECT  
*
FROM RPA.RPA_AA_GERENCIADOR_EXECUCOES
WHERE ID_BOT = 196
ORDER BY ID_EXECUTION DESC;
--CONTROL TABLE-------------------------------------------------------------------------------- 
SELECT CPF
	,COUNT(*)
	,CUSTOMER_ID 
	,TIMESTAMP_REQUEST 
	,PERIOD_START 
	,PERIOD_END
FROM RPA.RPA_CTRL_CX_EXTRATO_RDB
WHERE STATUS = '3'
GROUP BY CPF
	,CUSTOMER_ID 
	,TIMESTAMP_REQUEST 
	,PERIOD_START 
	,PERIOD_END
ORDER BY TO_DATE(TIMESTAMP_REQUEST, 'MM/DD/YYYY HH24:MI:SS') ASC;

SELECT *
FROM RPA.RPA_CTRL_CX_EXTRATO_RDB
WHERE STATUS = '3'
	AND DT_INI IS NOT NULL;

SELECT *
FROM RPA.RPA_CTRL_CX_EXTRATO_RDB
WHERE TIMESTAMP_REQUEST = '9/17/2026 9:08:32';

SELECT 
    *
FROM 
    RPA.RPA_CTRL_CX_EXTRATO_RDB
WHERE 
    STATUS = '3'
    AND CPF = '18451830706'
    AND TIMESTAMP_REQUEST = '9/17/2026 9:42:19'
    AND PERIOD_START = '01/08/2026'
    AND PERIOD_END = '17/09/2026';

----------------------------------------------------------------------------------
SELECT
	CPF
FROM
	RPA.RPA_CTRL_CX_EXTRATO_RDB
WHERE
	STATUS = '3'
GROUP BY
	CPF;
----------------------------------------------------------------------------------

WITH rdb_purchases AS (
SELECT
	liquid_deposit__id AS id,
	liquid_deposit__portfolio_id AS portfolio_id,
	liquid_deposit__offer_id AS offer_id,
	liquid_deposit__open_date AS DATE,
	liquid_deposit__principal AS deposited_principal,
	NULL AS redeemed_principal,
	NULL AS redeemed_net_yield,
	NULL AS retained_income_tax,
	NULL AS retained_iof_tax
FROM
	br__contract.soulstone__liquid_deposits ),
rdb_redemptions AS (
SELECT
	p.liquid_deposit__id AS id,
	p.liquid_deposit__portfolio_id AS portfolio_id,
	p.liquid_deposit__offer_id AS offer_id,
	r.liquid_deposit_redemption__post_date AS DATE,
	CAST(NULL AS DOUBLE) AS deposited_principal,
	r.liquid_deposit_redemption__redeemed_principal AS redeemed_principal,
	r.liquid_deposit_redemption__redeemed_net_yield AS redeemed_net_yield,
	r.liquid_deposit_redemption__retained_income_tax AS retained_income_tax,
	r.liquid_deposit_redemption__retained_iof_tax AS retained_iof_tax
FROM
	br__contract.soulstone__liquid_deposits p
LEFT JOIN br__contract.soulstone__liquid_deposit_redemptions r ON
	p.liquid_deposit__id = r.liquid_deposit__id ),
rdb_full AS (
SELECT
	portfolio_id,
	DATE,
	deposited_principal,
	redeemed_principal,
	redeemed_net_yield,
	retained_income_tax,
	retained_iof_tax
FROM
	rdb_purchases
UNION ALL
SELECT
	portfolio_id,
	DATE,
	deposited_principal,
	redeemed_principal,
	redeemed_net_yield,
	retained_income_tax,
	retained_iof_tax
FROM
	rdb_redemptions )
SELECT
	mb.money_box__customer_id,
	rdb_full.portfolio_id,
	rdb_full.date,
	rdb_full.deposited_principal,
	rdb_full.redeemed_principal,
	rdb_full.redeemed_net_yield,
	rdb_full.retained_income_tax,
	rdb_full.retained_iof_tax
FROM
	rdb_full
INNER JOIN br__contract.mario_box__money_boxes mb ON
	mb.money_box__id = rdb_full.portfolio_id
WHERE
	rdb_full.portfolio_id = '%BOXID%'
	AND rdb_full.date BETWEEN '%START%' AND '%END%'
ORDER BY
	rdb_full.date DESC;