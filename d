=IF(COUNTIF($B:$B,A2)>0,"Match","Missing in FDP")

=IF(COUNTIF($A:$A,B2)>0,"Match","Missing in ECAS")

=COUNTIF(C:C,"Missing in FDP")

=COUNTIF(D:D,"Missing in ECAS")