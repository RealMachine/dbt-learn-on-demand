--refunds have a negative amount, so total amount should always be >=0
-- therefore retunr records where this isn't true to make the test fail

select orderid,
    sum(amount) as total_amount
from {{ ref('stg_payments')}}
group by 1
having not(total_amount>=0)