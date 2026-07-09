Description

Support the production implementation of the SmartPay Aggregators BDP changes once the FDP dependency is completed. Activities include deployment preparation, UAT validation, production readiness checks and post-deployment verification.

Current implementation is blocked by the FDP source data availability and cannot be fully validated in UAT until the upstream delivery is completed.

Scope

* Validate SmartPay BDP implementation in UAT.
* Verify source data availability from FDP.
* Prepare deployment scripts.
* Support Production implementation.
* Perform post deployment validation.

Acceptance Criteria

* SmartPay solution successfully validated in UAT.
* All deployment scripts prepared.
* Production deployment completed successfully.
* Data validation completed after deployment.
* No production issues identified.




Description

Align the SmartPay BDP implementation with the standard GitLab development and deployment pipeline adopted by the Cards DPP team.

The objective is to migrate the existing implementation into the standard Git workflow and ensure compatibility with automated deployment pipelines.

Scope

* Review GitLab onboarding documentation.
* Configure feature branch.
* Align code structure with Cards DPP standards.
* Separate DDL and DML deployment scripts.
* Validate Dev pipeline execution.
* Work with Sandeep / Rajat for pipeline setup if required.

Acceptance Criteria

* Feature branch created.
* Code follows Cards DPP Git standards.
* DDL and DML scripts separated.
* Dev pipeline successfully executed.
* Code ready for Release pipeline.




Description

Support the data model design activities for the New Customer Acquisition MI (MI Aura).

Review business metrics, validate existing Aggregators BDP mappings, identify missing attributes, document mapping gaps and provide input into the new BDP model.

Scope

* Review MI Aura business metrics.
* Analyse FTP attribute availability.
* Validate Aggregators BDP mappings.
* Identify missing dimensions/measures.
* Support business mapping discussions.
* Document transformation logic.

Acceptance Criteria

* Business metrics reviewed.
* Required mappings documented.
* Missing fields identified.
* Data model gaps documented.
* Inputs provided to data model design.




Description

Investigate and implement the mapping logic required to link NGCB Applications to the corresponding Credit Card Account.

Current analysis identified that NGCB Application IDs from Aggregators BDP cannot be directly joined to the FDP Credit Card Account table. Additional mapping through FDP Credit Card Application is required to establish the relationship between NGCB Application and Account Number.

The solution will also support the new Booked Accounts measure required by the New Customer Acquisition MI.

Scope

* Analyse NGCB Application ID format.
* Validate mapping between NGCB Application ID and FDP Application Number.
* Map Application Number to FDP Application Identifier.
* Join Application Identifier to Credit Card Account.
* Validate linked Account Number.
* Document mapping logic.
* Identify data model inconsistencies.
* Raise findings with Cards Data Architecture team if required.

Acceptance Criteria

* End-to-end mapping from NGCB Application to Account Number documented.
* Mapping validated using sample NGCB applications.
* Account Number successfully retrieved through FDP joins.
* Mapping logic documented for reuse.
* Data model inconsistencies identified and communicated.