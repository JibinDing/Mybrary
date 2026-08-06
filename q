Hi Sneha,

We recreated the CREDIT_CARD_APPLICATION_DECISION_OUTCOME external table in the Dev environment and reviewed the available columns.

At present, we are only able to find RISK_EVALUATION_SCORECARD_NAME. The following three attributes are not currently available in the Dev table:

* GEN_16_BANK_RISK_SCORE
* NODE_FRAMEWORK_RISK_SEGMENT_CODE
* NODE_FRAMEWORK_RISK_SEGMENT_KEY

Could you please confirm when these three attributes will be available in Dev? We need them in Dev to complete and syntactically test the BDP build.

Also, could you please confirm the expected values for RISK_EVALUATION_SCORECARD_NAME, so that we can validate that the FDP derivation aligns with the agreed business mapping?

Thanks,
Jibin