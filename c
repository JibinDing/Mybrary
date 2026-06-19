SELECT
    applicationid,
    caseid,
    checkproviderrefnum,
    referenceid
FROM e_ngcb_apply_db.application_results_sum_caseiq_main
WHERE applicationid IN (
    '327345002',
    '350399302',
    '336649651',
    '342745811',
    '337028915'
)
OR caseid IN (
    '327345002',
    '350399302',
    '336649651',
    '342745811',
    '337028915'
)
OR checkproviderrefnum IN (
    '327345002',
    '350399302',
    '336649651',
    '342745811',
    '337028915'
);