Hi Rinika,

I have investigated the PRODUCT_GROUP_KEY and TRANSACTION_STATUS_KEY mappings with Rajat.

Based on the Design Forum guidance, both fields should contain reference/source keys rather than descriptive values.

For PRODUCT_GROUP_KEY, I have identified the existing source system reference mappings in BDP DIM_REFERENCE:

* Triumph = 10001031
* NGCB = 10001090

For TRANSACTION_STATUS_KEY, Rajat confirmed that the SmartPay reporting statuses (e.g. SUCCESS, DECLINED, DROPOUT, REPORTING_ONLY_*) should be created as new reference values rather than stored as descriptive text.

I am currently reviewing the required reference data changes and will update the implementation accordingly. Once the mappings have been finalised, I will retest the solution and provide an updated status.

Thanks,
Jibin