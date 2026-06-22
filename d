Hi Kirsty, I just wanted to clarify the requirement for the dropout error messages.

At the moment, the ERROR_MESSAGE_DESCRIPTION is populated from the source ERROR_DESCRIPTION field. However, I’ve noticed that many dropout records have NULL in this field, while others contain values such as "Internal server error" or "Malformed JSON request".

For the records where ERROR_DESCRIPTION is NULL, would you prefer me to:

1. Keep the source error description where available, and only replace NULL values with the corresponding TRANSACTION_STATUS_CODE (e.g. AUTHORISATION_REQUIRED, CARD_DETAILS_REQUIRED, PAYMENT_AUTHORISED), or
2. Always show the TRANSACTION_STATUS_CODE in the error message field for dropout records, regardless of whether an error description exists?

I just wanted to confirm which behaviour would be most useful for the business before making the change.