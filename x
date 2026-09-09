SELECT
    accno_var,
    acc_no,
    appinc,
    baccno,
    decdate,
    decclass
FROM E_CASMART_BASE.IF004_VECTUS
WHERE decdate = '2026-08-18'
  AND decclass = 'COMPLETE'
LIMIT 20;


SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT accno_var) AS distinct_accno_var,
    COUNT(DISTINCT acc_no) AS distinct_acc_no,
    COUNT(DISTINCT appinc) AS distinct_appinc,
    COUNT(DISTINCT baccno) AS distinct_baccno
FROM E_CASMART_BASE.IF004_VECTUS
WHERE decdate = '2026-08-18'
  AND decclass = 'COMPLETE';