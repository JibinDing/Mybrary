Hi Rinika, yes — the query should join the NGCB application id to FDP CREDIT_CARD_APPLICATION.APPLICATION_NUMBER, then use APPLICATION_IDENTIFIER to link to CREDIT_CARD_ACCOUNT.

SELECT
    app.APPLICATION_NUMBER      AS ngcb_application_id,
    app.APPLICATION_IDENTIFIER  AS fdp_application_identifier,
    acct.ACCOUNT_NUMBER,
    acct.ACCOUNT_IDENTIFIER
FROM FDP_UK_CARDS_DB.CREDIT_CARD_APPLICATION app
LEFT JOIN FDP_UK_CARDS_DB.CREDIT_CARD_ACCOUNT acct
    ON acct.APPLICATION_IDENTIFIER = app.APPLICATION_IDENTIFIER
   AND acct.ACTIVE = '1'
WHERE app.APPLICATION_NUMBER = '<NGCB_APPLICATION_ID>';

I validated this with sample NGCB application id 705735753391626206, and it returned the linked FDP account number.

