,CAST(
    CASE
        WHEN COALESCE(
                 A.REQUESTED_PRODUCT_CLASS_CODE,
                 B.REQUESTED_PRODUCT_CLASS_CODE
             ) = 'U'
            THEN 'Amazon'

        WHEN COALESCE(
                 A.REQUESTED_PRODUCT_CLASS_CODE,
                 B.REQUESTED_PRODUCT_CLASS_CODE
             ) = 'V'
            THEN 'Amazon Winback'

        WHEN COALESCE(
                 A.PRODUCT_CODE,
                 B.PRODUCT_CODE
             ) IN ('26', '86')
            THEN 'Forward'

        WHEN COALESCE(
                 A.REQUESTED_PRODUCT_CLASS_CODE,
                 B.REQUESTED_PRODUCT_CLASS_CODE
             ) = 'P'
            THEN 'Combo'

        WHEN COALESCE(
                 A.REQUESTED_PRODUCT_CLASS_CODE,
                 B.REQUESTED_PRODUCT_CLASS_CODE
             ) = 'X'
            THEN 'Rewards'

        WHEN COALESCE(
                 A.PRODUCT_CODE,
                 B.PRODUCT_CODE
             ) = '33'
         AND COALESCE(
                 A.REQUESTED_PRODUCT_CLASS_CODE,
                 B.REQUESTED_PRODUCT_CLASS_CODE
             ) = 'L'
            THEN 'Platinum BT Long'

        WHEN COALESCE(
                 A.PRODUCT_CODE,
                 B.PRODUCT_CODE
             ) = '33'
         AND COALESCE(
                 A.REQUESTED_PRODUCT_CLASS_CODE,
                 B.REQUESTED_PRODUCT_CLASS_CODE
             ) = 'M'
            THEN 'Platinum BT Mid'

        WHEN COALESCE(
                 A.PRODUCT_CODE,
                 B.PRODUCT_CODE
             ) = '33'
         AND COALESCE(
                 A.REQUESTED_PRODUCT_CLASS_CODE,
                 B.REQUESTED_PRODUCT_CLASS_CODE
             ) = 'T'
            THEN 'Platinum BT Short'

        WHEN COALESCE(
                 A.PRODUCT_CODE,
                 B.PRODUCT_CODE
             ) = '91'
            THEN 'Avios'

        WHEN COALESCE(
                 A.PRODUCT_CODE,
                 B.PRODUCT_CODE
             ) = '92'
            THEN 'Avios Plus'

        /* Temporarily retained from the current logic */
        WHEN COALESCE(
                 A.REQUESTED_PRODUCT_CLASS_CODE,
                 B.REQUESTED_PRODUCT_CLASS_CODE
             ) IN ('B', 'E')
            THEN 'Better Together'

        WHEN COALESCE(
                 A.REQUESTED_PRODUCT_CLASS_CODE,
                 B.REQUESTED_PRODUCT_CLASS_CODE
             ) = 'K'
            THEN 'New to Prime'

        ELSE 'Unknown'
    END
    AS VARCHAR(20)
) AS NEW_ACQ_SEGMENT2