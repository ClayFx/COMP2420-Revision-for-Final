-- a)
select distinct S.name 
from Requests as R inner join Jobs as J on R.j_id = J.j_id
	 inner join Suppliers as S on R.s_id = S.s_id
where J.name = 'Console';

-- b)
select distinct S.s_id, S.name
from Requests as R inner join Jobs as J on R.j_id = J.j_id
	 inner join Suppliers as S on R.s_id = S.s_id
	 inner join Parts as P on R.p_id = P.p_id
where J.city <> S.city and J.city <> P.city and P.city <> S.city;

-- c)
select * 
from Suppliers, Parts 
where exists ( select Si.s_id, Si.p_id 
				from Supplier_inventory as Si inner join Requests as R on Si.s_id = R.s_id and Si.p_id = R.p_id 
				where Si.quantity < R.quantity ) ;


select * from 
(select s_id, p_id, sum(quantity) from requests group by s_id, p_id) as A, (select s_id, name from suppliers) as B, (select s_id, p_id, sum(quantity) 
from supplier_inventory group by s_id, p_id) as C, (select p_id, name from parts) as D 
where A.s_id = B.s_id and A.s_id = C.s_id and A.p_id = C.p_id and A.p_id = D.p_id and C.sum < A.sum;