I compared ANNUAL_PERCENTAGE_RATE and APR_PERCENTAGE_APPLIED_AMOUNT in CREDIT_CARD_APPLICATION_OUTCOME.

Initial profiling shows they are not equivalent.

* ~51M records have different values
* ~47M records match
* ~35M records have both values as NULL

From sample records, there are many cases where APR_PERCENTAGE_APPLIED_AMOUNT is 0 while ANNUAL_PERCENTAGE_RATE has a valid value, suggesting they likely represent different business concepts rather than duplicate fields.

I’ll continue analysing the population (e.g. zero values and distribution) before discussing with the SME.