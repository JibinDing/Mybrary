I checked the SmartPay BDP output.

1. The difference between COUNT(transaction_status_key) and SUM(measure_volume) is expected because COUNT(transaction_status_key) counts output rows, while measure_volume represents COUNT(DISTINCT transaction_identifier) from the procedure logic.

2. For DROPOUT, error_message_description is already populated for some records. Current breakdown by SUM(measure_volume):
- NULL: 3845
- dce: 431
- Success: 10
- Malformed JSON request: 1
- Internal server error: 1
- Transaction reference must be 36 chars: 1
- Missing mandatory header: 1
- Fraud, The RMS service is unavailable: 1

However, most DROPOUT volume still has NULL error_message_description, so we may need to check whether source error_description is missing for those records or whether the logic needs to populate a default value.