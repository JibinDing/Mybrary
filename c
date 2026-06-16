SELECT
    pk,
    sk,
    check_provider_ref_num,
    applicationid,
    offerid,
    productofferid,
    productoffercode,
    origin1,
    origin2
FROM e_ngcb_apply_db.application_main
WHERE check_provider_ref_num IN (
    '327345002',
    '350399302',
    '336649651',
    '342745811',
    '337028915'
)
OR pk IN (
    '327345002',
    '350399302',
    '336649651',
    '342745811',
    '337028915'
)
OR sk IN (
    '327345002',
    '350399302',
    '336649651',
    '342745811',
    '337028915'
);