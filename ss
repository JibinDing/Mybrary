Overall Summary

This stored procedure builds the BDP Cards Aggregator Multiquote table by transforming FDP credit card application, quote, case, eligibility, customer and product data into a reporting-ready summary dataset.

The logic focuses on the end-to-end credit card application journey, including quote records, full application records, linked applications, second eligibility checks, multiquote product options, customer detail changes, and first-vs-second quote comparisons. The procedure applies ranking and deduplication rules to retain the latest relevant records, prioritises full application records over quote records where both exist, enriches the journey with customer and financial attributes, and finally aggregates the data for reporting.

Phase 1: Extract Latest Application and Quote Outcome Data

The first phase extracts recent full application and quote outcome records from the FDP application outcome table. Full application records and quote records are processed separately based on quote status code. Ranking logic is applied within each application identifier to identify the latest relevant pass using SDS counter and audit information. The latest full application records and latest quote records are then combined into a single outcome dataset for downstream processing.

Main CTEs:
APP_DATA, QUOTE_DATA, IHQ_SDS_SORT

Phase 2: Enrich Base Application Data

The second phase enriches the outcome dataset with additional application, case and eligibility information. This includes joining back to application outcome details, bringing in application case information such as case creation and case identifiers, and adding eligibility-related attributes such as monthly disposable income. This creates a more complete application-level base dataset for later journey and comparison logic.

Main CTEs:
STG_1, STG_2, IHQ_BASE1

Phase 3: Pivot Multiquote Product Data

This phase handles multiquote product information. The source product data is stored in a vertical format, where one application may have multiple requested or offered product rows. The logic assigns a sequence number to products per application and pivots the data into a horizontal format, producing numbered product columns such as requested product 1 to 15 and offered product 1 to 15. This allows multiple product options to be represented on a single application-level record.

Main CTE:
pivoted_products

Phase 4: Identify and Deduplicate Linked Applications

This phase identifies applications that are linked to earlier quote or application records through linked application identifiers. This is mainly used to support second eligibility check and linked application journey analysis. The logic deduplicates linked application groups and retains the most relevant or latest linked application record, so that downstream comparisons are performed against a clean linked application dataset.

Main CTEs:
DeduplicatedData, DeduplicatedData2, IHQ_SAMP

Phase 5: Prioritise Full Applications Over Quote Records

This phase removes duplicate quote records where a corresponding full application record exists for the same application identifier. A flag is created to identify whether an application has any full application record. If both quote and full application records exist, the quote record is removed and the full application record is retained. If only a quote record exists, it is preserved. This avoids double-counting the same application journey while still retaining quote-only journeys.

Main CTEs:
FILTERED_DATA, IHQ_SAMP1, IHQ_COMB

Phase 6: Build the Main Application Universe

This phase separates quote records and direct or full application records from the combined dataset, then brings them back together into a unified application dataset. This creates the main application universe used by the later comparison and aggregation logic. At this stage, the data has been cleaned, enriched, linked, and filtered to represent the relevant quote and full application journeys.

Main CTEs:
IHQ_Q, IHQ_D, ALL_APPS

Phase 7: Compare Customer Details Across the Journey

This phase compares customer demographic and address details between the current application and the linked or original application. The purpose is to identify whether customer information changed between the initial quote or eligibility check and the later application stage. This supports tracking of changes such as name, date of birth, address, employment-related information, or other customer attributes during the journey.

Main CTEs:
BASE_RC3, BASE_1, BASE_2, BASE_F, IHQ_DET

Phase 8: Compare First and Second Quote / Application Metrics

This phase creates first-versus-second quote and application comparison data. It links the current application to the original linked application and extracts key metrics from both points in the journey. These metrics may include credit limit, APR, balance transfer amount, monthly disposable income, expenditure, product, and decision-related information. The purpose is to understand how the customer’s quote or application outcome changed between the first and second eligibility/application events.

Main CTEs:
APP_2, APP_3, FQ_BASE1, MDI_2, MDI_3, FQ_BASE2, FQ_BASE3, FQ_BASE

Phase 9: Final Reporting Aggregation

The final phase applies the reporting-level business logic and aggregates the enriched application journey data into the target BDP table. This includes final classifications, decision categorisation, channel logic, product segmentation, customer change indicators, and KPI calculations. The output is inserted into the BDP Cards Aggregator Multiquote table and is intended for reporting and analysis of credit card quote, application, multiquote, and linked journey behaviour.

Main CTE:
BASE_SUM1

Key Business Rules

Full application records are prioritised over quote records when both exist for the same application identifier.

Linked application identifiers are used to connect later applications or second eligibility checks back to earlier quote or application records.

Ranking logic is used to retain the latest relevant pass for both quote and full application records.

Multiquote product records are pivoted from multiple product rows into numbered product columns at application level.

Customer details and financial metrics are compared across first and second application or quote events to support journey change analysis.

The final output is a reporting-ready aggregated dataset rather than a simple one-to-one copy of FDP source records.

Points to Validate

Confirm the business meaning of quote status codes F and Q.

Confirm the final output grain of BASE_SUM1 and the target table.

Confirm whether ranking logic can produce ties and whether this is expected.

Confirm whether product ordering in the pivoted product logic is deterministic.

Confirm that linked application identifiers reliably represent the intended first-to-second quote or application journey.