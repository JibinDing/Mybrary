Hi Archana,

I am looking into a few applications reported as missing from NGCB Account Main.

Sample IDs:

327345002, 350399302, 336649651, 342745811, 337028915

These exist in IF004 and ProductApp, but I cannot find them in e_ngcb_ppe_db.account_main.

One thing I noticed is that ProductApp IDs are 9 digits, while account_main.applicationid seems to contain 17–18 digit values.

Do you know what business key populates account_main.applicationid, and what the correct join key is between ProductApp/IF004 and Account Main?