Acceptance Criteria

* A solution is implemented to map NGCB application IDs from the BDP Aggregator to the corresponding Credit Card Account in FDP.
* The mapping supports the conversion from the short NGCB application ID to the corresponding FDP application identifier where required.
* The solution successfully returns the linked Account Number for applications with a final status of Accepted or Complete.
* Any unmatched records are identified and quantified for further investigation as potential FDP data gaps.
* The mapping logic is validated using sample NGCB application IDs and produces the expected linked Account Numbers.
* SQL/query logic is documented and shared with the team for future reference and reuse.