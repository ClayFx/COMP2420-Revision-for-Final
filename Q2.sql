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
from Suppliers, Parts ,( select Si.s_id, Si.p_id from Supplier_inventory as Si inner join Requests as R on Si.s_id = R.s_id and Si.p_id = R.p_id
						where Si.quantity < R.quantity ) as A
where Suppliers.s_id = A.s_id and Parts.p_id = A.p_id;
