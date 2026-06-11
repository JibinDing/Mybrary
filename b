select
    brandcode,
    count(*)
from e_casmart_db.if110_vec_productapp
group by brandcode;