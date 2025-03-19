select salesman_id, Name
from salesman
where salesman_id in (select salesman_id
from customer
group by salesman_id
having count(customer_id)>1);
