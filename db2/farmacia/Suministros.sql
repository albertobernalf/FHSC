select * from hosvital.maesum1 ;  w-- here msreso = '0050MQ11';
select * from hosvital.maesum1 ;

select * from hosvital.undmedi;


select msreso, msnomg,m2.unmddes ,mscodi||' '||msprac||' '||cnccd||' '||msform, MSREGINV
from hosvital.maesum1 m1, hosvital.undmedi m2
where m1.msundmct = m2.unmdcod and m1.mstipo='O';