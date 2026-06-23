We noticed that Snowflake Iceberg tables do not support VARCHAR length restrictions such as VARCHAR(20) or VARCHAR(100). Only VARCHAR without a defined length is accepted.

Could Arun please confirm whether the SmartPay data model should be updated accordingly, or if we should continue using open VARCHAR fields for implementation?