I validated that the sample applications exist in IF004 and ProductApp.

Based on Archana’s input, the same application uses different identifiers across the Applu and CAS domains. I also checked if110_vec_ngcbdata, but the sample ProductApp IDs (327345002, 350399302, 336649651, 342745811, 337028915) do not exist as IDs in that table either.

Therefore, the ProductApp application IDs cannot be used directly to query ACCOUNT_MAIN, and we still need to identify the correct cross-domain mapping before determining whether the corresponding accounts are actually missing downstream.



Thanks, Archana. I checked if110_vec_ngcbdata, but the ProductApp IDs (e.g. 327345002) do not appear in the id column either.

Could you please advise how to derive the CAS application ID from a ProductApp/Applu application ID, or which field should be used to join these datasets?