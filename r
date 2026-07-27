Search the full SQL for every occurrence of BASE_SUM_FINAL.

Also find every INSERT, INSERT OVERWRITE, MERGE, or CREATE TABLE statement after BASE_SUM_FINAL is defined.

Return only:
1. Every BASE_SUM_FINAL occurrence with 10 lines around it
2. Any target table written after its definition
3. Whether SELECT * FROM BASE_SUM_FINAL is only returned or inserted into a table

Keep it short. No explanation.