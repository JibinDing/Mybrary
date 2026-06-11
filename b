select
    applicationid,
    ppeaccountid,
    applicationreferencenumber,
    status
from e_ngcb_ppe_db.account_main
limit 20;

select
    count(*)
from e_ngcb_ppe_db.account_main
where ppeaccountid is not null;
