Find the SELECT/CTE where ACQ_SEGMENT2 is created.

Then find every later place where ACQ_SEGMENT2 is selected or passed to another CTE.

Return only:
1. The name of the CTE where ACQ_SEGMENT2 is created
2. Each later CTE name
3. The exact line containing ACQ_SEGMENT2 in each CTE
4. Whether any of those CTEs uses SELECT *

Keep the answer short. No explanation.