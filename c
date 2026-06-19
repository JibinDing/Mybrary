Hi Steve,

I investigated the reported missing NGCB accounts and found that the issue is related to the application-to-account mapping rather than missing data in ACCOUNT_MAIN.

The ProductApp application ID (e.g. 327345002) cannot be used directly to query ACCOUNT_MAIN.applicationid.

I found that the correct mapping is:

* ProductApp.id → application_results_sum_caseIq_main.caseid
* application_results_sum_caseIq_main.applicationid → downstream/CAS application ID
* ACCOUNT_MAIN.applicationid should be joined using this downstream application ID.

I validated several sample records and confirmed that the corresponding accounts do exist in ACCOUNT_MAIN when using the mapped application ID.

Therefore, this appears to be an FDP application-to-account mapping (join key) issue rather than missing downstream account data.






* Investigated multiple NGCB applications reported as missing from ACCOUNT_MAIN.
* Verified that the sample applications exist in ProductApp.
* Confirmed that ProductApp.id is not the same identifier as ACCOUNT_MAIN.applicationid.
* Identified the correct mapping path:
    * ProductApp.id = application_results_sum_caseIq_main.caseid
    * application_results_sum_caseIq_main.applicationid = downstream/CAS application ID
    * ACCOUNT_MAIN.applicationid should be matched using this downstream application ID.
* Validated the mapping using multiple sample records and confirmed that corresponding records exist in ACCOUNT_MAIN when queried with the mapped downstream application ID.
* Conclusion: The reported issue is caused by an application-to-account mapping/join key mismatch in FDP rather than missing account data in ACCOUNT_MAIN.