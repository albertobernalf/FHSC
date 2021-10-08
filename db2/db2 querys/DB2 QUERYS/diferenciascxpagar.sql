select * from hosvital.movcxp limit 10;

select x.mvcxpnuob, sum(x.mvcxpval) as cxp , a.hoptotcre as total
from hosvital.movcxp x,  hosvital.hojoblprv a
where x.cntvig='2019' and x.mvcxpnat='C' and a.cntvig='2019' and a.hopnoobl = x.mvcxpnuob and x.cntvig=a.cntvig and a.hopnoobl='FE 1096'
group by x.mvcxpnuob,a.hoptotcre having sum(x.mvcxpval)!=  a.hoptotcre;

-- select * from hosvital.hojoblprv where hopnoobl='FE 1096';



