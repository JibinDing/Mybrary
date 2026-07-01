SELECT
    caseid,
    applicationid,
    checkproviderrefnum,
    referenceid
FROM e_ngcb_apply_db.application_results_sum_caseiq_main
WHERE caseid IN (
    327345002,
    350399302,
    336649651,
    342745811,
    337028915
);



SELECT
    applicationid,
    accountcreateddate,
    accountopeneddate,
    agencyaccountnumber,
    agencysortcode,
    status,
    productcode
FROM e_ngcb_ppe_db.account_main
WHERE applicationid IN (
    '7057357533916262061',
    '660539676923986355',
    '354124893885243821',
    '151080945213259711',
    '454573492201325040'
);



SELECT
    m.caseid AS productapp_id,
    m.applicationid AS downstream_application_id,
    a.applicationid AS account_main_applicationid,
    a.agencyaccountnumber,
    a.accountcreateddate,
    a.accountopeneddate,
    a.status,
    a.productcode
FROM e_ngcb_apply_db.application_results_sum_caseiq_main m
LEFT JOIN e_ngcb_ppe_db.account_main a
    ON m.applicationid = a.applicationid
WHERE m.caseid IN (
    327345002,
    350399302,
    336649651,
    342745811,
    337028915
);


SELECT *
FROM e_ngcb_ppe_db.account_main
WHERE applicationid IN (
    '327345002',
    '350399302',
    '336649651',
    '342745811',
    '337028915'
);
