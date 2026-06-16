SELECT
    pk,
    sk,
    applicationid,
    referenceid,
    pclipreference,
    quote_tracking_code,
    cd_accountnumber,
    cd_transactionrefnumber,
    productcode
FROM e_ngcb_apply_db.application_main
WHERE applicationid IN (
    '327345002',
    '350399302',
    '336649651',
    '342745811',
    '337028915'
)
OR referenceid IN (
    '327345002',
    '350399302',
    '336649651',
    '342745811',
    '337028915'
)
OR pclipreference IN (
    '327345002',
    '350399302',
    '336649651',
    '342745811',
    '337028915'
);