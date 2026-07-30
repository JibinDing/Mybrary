SELECT
    SALARY_BAND,
    COUNT(*) AS RECORD_COUNT
FROM BASE_SUM_FINAL
GROUP BY SALARY_BAND
ORDER BY
    CASE SALARY_BAND
        WHEN 'Under £10k' THEN 1
        WHEN '£10k-£15k' THEN 2
        WHEN '£15k-£22.5k' THEN 3
        WHEN '£22.5k-£30k' THEN 4
        WHEN '£30k-£50k' THEN 5
        WHEN '£50k-£75k' THEN 6
        WHEN '£75k-£150k' THEN 7
        WHEN '£150k-£250k' THEN 8
        WHEN '£250k-£500k' THEN 9
        WHEN '£500k+' THEN 10
        ELSE 11
    END;