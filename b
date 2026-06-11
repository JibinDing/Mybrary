select
    brandcode,
    count(*)
from e_casmart_db.if110_vec_productapp
where id in (
327345002,
350399302,
336649651,
342745811,
337028915
)
group by brandcode;