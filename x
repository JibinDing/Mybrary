Hi Simon, quick question on the pre-August Barclays customer logic.

For the Gen16 Bank check, we understand that the Gen16 score needs to be populated, but when looking at the source data we may also see values such as -99 / -9999.

Could you please confirm what should be treated as a valid Gen16 score for this logic? For example, should we simply exclude negative/default values and use scores greater than 0, or is there a specific valid score range we should apply?

This is for the pre-August Barclays Customer Indicator logic using the FDP equivalent of SCORE_DK_707.