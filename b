I reviewed a sample of applications where:

* Application Status = COMPLETE
* Account Identifier is NULL in MI Aura

The following findings were observed:

1. The applications exist in IF004_VECTUS and are marked as COMPLETE.
2. However, ACCNO in IF004_VECTUS is populated as 0 rather than a valid account number.
3. The same applications exist in IF110_VEC_PRODUCTAPP, confirming that the application journey completed successfully.
4. Product application records contain valid business identifiers such as AGGREFNO and BAECMNO.
5. However, the account-related reference fields are not populated:
    * APPXREFNO = NULL
    * TRIUMPHREFNO_STG_ID = NULL
    * TRIUMPHREFNO2_STG_ID = NULL
6. No matching records were found in E_NGCB_PPE_DB.ACCOUNT_MAIN using the sampled Application IDs.

Conclusion

Based on the sample review, the missing Account Identifier does not currently appear to be caused by an FTP Account Mapping issue.

The evidence suggests that these applications completed the application journey but did not result in a corresponding account being available in the downstream account source. As a result:

* IF004_VECTUS receives ACCNO = 0
* FTP Credit Card Account cannot derive a valid Account Identifier
* MI Aura therefore displays a NULL Account Identifier

Further confirmation is required from the NGCB/business teams on whether this population is expected behaviour (for example, a specific product/customer journey) or whether an upstream account creation gap exists.