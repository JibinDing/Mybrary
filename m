Progress Update

* Investigated the NGCB Application → FDP Credit Card Account linkage.
* Identified FDP equivalent tables:
    * FDP_UK_CARDS_DB.CREDIT_CARD_APPLICATION
    * FDP_UK_CARDS_DB.CREDIT_CARD_ACCOUNT
* Established and validated the join path:
    * NGCB applicationid → CREDIT_CARD_APPLICATION.APPLICATION_NUMBER
    * CREDIT_CARD_APPLICATION.APPLICATION_IDENTIFIER → CREDIT_CARD_ACCOUNT.APPLICATION_IDENTIFIER
* Confirmed that the linkage returns the associated Account Number from FDP.
* Validated the approach using sample application IDs and shared the SQL query with stakeholders.
* Clarified that NGCB caseid and applicationid are different identifiers; account linkage is achieved via applicationid.