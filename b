我会这样总结：

Findings

1. Missing Account Identifier applications are present in IF004_VECTUS and marked COMPLETE.
2. ACCNO in IF004_VECTUS is populated as 0.
3. No matching records found in NGCB ACCOUNT_MAIN using Application ID.
4. Applications are present in IF110_VEC_PRODUCTAPP.
5. ProductApp records contain AGGREFNO and BAECMNO, indicating the application journey completed successfully.
6. However APPXREFNO, TRIUMPHREFNO_STG_ID and TRIUMPHREFNO2_STG_ID are all NULL.
7. All sampled records belong to BRANDCODE=‘B’.

Initial Conclusion

The evidence suggests the issue is unlikely to be an FTP Account Mapping defect.

These applications appear to complete the application journey but do not result in a Triumph account being created.

This aligns with the earlier observation that the population is primarily Amazon Card customers.