Development has been completed for the following new Aggregator attributes:

* SALARY_BAND – derived from NET_MONTHLY_INCOME_AMOUNT using the agreed salary-band ranges.
* PURCHASE_RATE – sourced from APR_PERCENTAGE_APPLIED_AMOUNT and propagated through to the final Aggregator output.
* ORIGIN_CODE – derived by combining MAIL_NUMBER and APPLICATION_CHANNEL_CODE in line with the agreed mapping.

All three attributes have been added through the relevant CTEs and are available in the final output. Initial validation has also been completed successfully. The updated code is ready to be committed to the NCA MI feature branch for review and further testing.