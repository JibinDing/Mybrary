I am preparing NCMI testing evidence and need to reconcile the BDP Accepted Accounts measure back to the FDP source.

Please inspect the current Aggregator/NCMI codebase and trace the full lineage of the final output field:

BOOKED_ACCOUNTS

Do NOT modify any code.

Please answer the following:

1. Find where BOOKED_ACCOUNTS is created/calculated in the SQL.
2. Show me the exact SQL logic that produces BOOKED_ACCOUNTS.
3. Trace it backwards through all relevant CTEs until you reach the original FDP source table(s).
4. Identify the exact source table name(s) and source column(s) used to determine:
   - application ID
   - application decision date
   - whether the record is a full application (F vs Q, if applicable)
   - whether the application is accepted/booked
   - any other filters or conditions that affect BOOKED_ACCOUNTS
5. Explain in simple terms what conditions must be true for one application to contribute 1 to BOOKED_ACCOUNTS.
6. Check whether BOOKED_ACCOUNTS is counting rows, distinct application IDs, or is derived in another way.
7. Check whether any deduplication, joins, filters, aggregator/direct logic, or other transformations upstream could change the population before BOOKED_ACCOUNTS is calculated.

Finally, based ONLY on the actual logic found in the repository, write a simple standalone Snowflake validation query against the FDP source table(s) to calculate Accepted Accounts for:

APPLICATION_DECISION_DATE = '2026-08-18'

The purpose is to independently validate the BDP result of 3,471 Accepted Accounts.

Important:
- Do not guess any table names, column names, status values, or F/Q logic.
- Use only what you can verify from the current codebase.
- Keep the validation query as close to the FDP source as possible rather than querying the final BDP aggregated table.
- Clearly distinguish verified facts from anything you are uncertain about.