BUKCDOBIW2-65841

BDP | NCA MI | BDP Build - Acquisition Segments Amendment

Progress Note

Completed the implementation for the Acquisition Segment enhancements.

Acquisition Segment 2

* Updated the mapping logic based on the latest business requirements.
* Introduced Source Product Code based classification for Initial Forward, Avios and Avios Plus.
* Validated the new mapping against the previous logic and reviewed the movement across segment categories.
* Only a very small number of applications remain classified as Unknown, which are expected to be investigated further.

Acquisition Segment 1

* Implemented the revised Segment 1 derivation based on the updated Segment 2 mapping.
* Added new classifications for Platinum BT, Platinum Combo and Rewards while retaining Forward.
* Produced comparison outputs showing the movement from the previous Segment 1/2 logic to the new logic.
* Added additional reporting grouped by Old Segment 1, Old Segment 2, New Segment 1 and New Segment 2 to support business review.

Validation

* Reviewed the outputs with the team.
* Agreed to capture the remaining Unknown application IDs (including Source Product Code and legacy derivation fields) for further investigation.
* A review session with the business stakeholder (Mark) will be arranged before finalising the new Segment 1 logic for production.




BDP | NCA MI | BDP Build - Additional Attributes

Progress Note

Progress made on the additional attribute implementation.

Completed:

* Salary Band
    * Identified that the existing implementation was using Monthly Disposable Income, which is not the required business attribute.
    * Updated the implementation to use NET_MONTHLY_INCOME_AMOUNT from CREDIT_CARD_APPLICATION_DECISION_OUTCOME.
    * Implemented the Salary Band derivation using the agreed annual income bands and propagated the attribute through to the final BDP output.
    * Validated the distribution of the generated Salary Band values.
* Purchase Rate
    * Added APR_PERCENTAGE_APPLIED_AMOUNT from CREDIT_CARD_APPLICATION_DECISION_OUTCOME.
    * Propagated the attribute through all downstream CTEs into the final output.
    * Validated the resulting Purchase Rate values and distribution in the final dataset.

Outstanding:

* Origin Campaign Code implementation is still in progress and awaiting confirmation of the final attribute naming/data model alignment.
* Other remaining attributes continue to depend on upstream FDP availability.