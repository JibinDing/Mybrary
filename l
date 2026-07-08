Hi Rinika, I think your point is correct. The application number visible in the Aggregators BDP code appears to be the short case/application identifier, e.g. 327345002, rather than the long NGCB applicationid used for FDP account linking.

I validated that 327345002 maps to applicationid 705735753391626206 in application_results_sum_caseIg_main.

The account join then works using the long applicationid:

application_results_sum_caseIg_main.caseid
→ application_results_sum_caseIg_main.applicationid
→ CREDIT_CARD_APPLICATION.APPLICATION_NUMBER
→ CREDIT_CARD_APPLICATION.APPLICATION_IDENTIFIER
→ CREDIT_CARD_ACCOUNT.APPLICATION_IDENTIFIER
→ ACCOUNT_NUMBER

So the query needs to include the short-to-long id mapping step before joining to FDP Credit Card Account.