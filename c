I found the root cause. The ProductApp IDs (e.g. 327345002) should not be used directly to query ACCOUNT_MAIN.applicationid.

The correct mapping is:

* ProductApp.id = application_results_sum_caseiq_main.caseid
* application_results_sum_caseiq_main.applicationid = CAS/downstream application ID
* ACCOUNT_MAIN.applicationid should be queried using this downstream application ID.

I validated the sample records and confirmed that the corresponding ACCOUNT_MAIN records do exist when using the mapped applicationid. Therefore, the issue is not missing accounts in ACCOUNT_MAIN but an ID mapping/join issue.