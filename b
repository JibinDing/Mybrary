Hi Rinika,

Sample applications reviewed:

327345002
350399302
336649651
342745811
337028915

Checks performed:

• IF004_VECTUS – applications exist and are marked COMPLETE, but ACCNO is populated as 0.

• E_NGCB_PPE_DB.ACCOUNT_MAIN – no matching records found for the sampled Application IDs.

• IF110_VEC_PRODUCTAPP – applications exist, however APPXREFNO, TRIUMPHREFNO_STG_ID and TRIUMPHREFNO2_STG_ID are all NULL. BAECMNO and AGGREFNO are populated.

Based on the sample review, it appears the applications completed the application journey but no corresponding account is available downstream, which is why ACCNO is 0 and Account Identifier is NULL in MI Aura.

Happy to walk through the queries if useful.


SELECT THEKEY, ACCNO
FROM IF004_VECTUS
WHERE THEKEY IN (
'327345002',
'350399302',
'336649651',
'342745811',
'337028915'
);


SELECT *
FROM E_NGCB_PPE_DB.ACCOUNT_MAIN
WHERE APPLICATIONID IN (
'327345002',
'350399302',
'336649651',
'342745811',
'337028915'
);

SELECT
ID,
APPXREFNO,
TRIUMPHREFNO_STG_ID,
TRIUMPHREFNO2_STG_ID,
BAECMNO,
AGGREFNO
FROM E_CASMART_DB.IF110_VEC_PRODUCTAPP
WHERE ID IN (
327345002,
350399302,
336649651,
342745811,
337028915
);