We are performing NCMI reconciliation testing for BOOKED_ACCOUNTS on application decision date 2026-08-18.

I have now run the queries in PROD and obtained:

* Minimal FDP validation query = 3,504
* Enhanced FDP validation query applying deduplication, decision outcome F/Q coverage and 6-month lookback = 3,480
* Final BDP BOOKED_ACCOUNTS = 3,471

So the remaining unexplained difference is only 9 applications (3,480 vs 3,471).

Please use the actual BDP SQL/code in this repository and trace the lineage of BOOKED_ACCOUNTS backwards from BASE_SUM1 through FQ_FINAL2, FQ_FINAL, FQ_BASE, ALL_APPS, and the relevant upstream CTEs.

Do not speculate or propose generic reasons. I need the exact code-based reason for the remaining 9-record difference.

Specifically:

1. Identify every filter/transformation affecting the population counted by BOOKED_ACCOUNTS that is still missing from my Enhanced FDP query.
2. Pay particular attention to how FULL_APPLICATION_STATUS_CODE is derived. Confirm whether using CREDIT_CARD_APPLICATION_CASE.CASE_STATUS_CODE = 'COMPLETE' is exactly equivalent to the final BDP condition FULL_APPLICATION_STATUS_CODE = 'COMPLETE'.
3. Check whether FQ_BASE, FQ_FINAL, FQ_FINAL2, ALL_APPS, or any upstream CTE introduces additional filtering, joins, deduplication, record selection, or F/Q handling that could reduce 3,480 to 3,471.
4. Give me a diagnostic Snowflake SQL query that identifies the exact application identifiers present in my Enhanced FDP population but excluded from the final BDP BOOKED_ACCOUNTS population.
5. If direct application-level comparison to the final BDP aggregate table is impossible because application identifiers are no longer retained, reconstruct the final BDP eligibility logic at application level using the upstream CTE/source logic.
6. Give me the next SQL query I should run in PROD. Keep it diagnostic rather than rewriting the entire BDP query.

My goal is to explain exactly:

3504 -> 3480 -> 3471

and produce defensible NCMI testing evidence showing why FDP reconciles to the final BDP BOOKED_ACCOUNTS value.