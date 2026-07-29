CASE

WHEN ACQ_SEGMENT2 IN
(
'Platinum BT Long',
'Platinum BT Mid',
'Platinum BT Short'
)
THEN 'Platinum BT'

WHEN ACQ_SEGMENT2 = 'Combo'
THEN 'Platinum Combo'

WHEN ACQ_SEGMENT2 IN
(
'Rewards',
'Amazon Winback',
'Avios',
'Avios Plus'
)
THEN 'Rewards'

WHEN ACQ_SEGMENT2 = 'Forward'
THEN 'Forward'

ELSE 'Prime'

END