select * from hosvital.hojobl where hojnumobl='';
select * from hosvital.movcxc where mccnumobl='518740';
select * from hosvital.movcont3 where doccod='FAR' and mvcnro = ;
select * from hosvital.movcont2 where doccod='FAR' and mvcnro = ;


select * from hosvital.movcxc where mccnumobl='518740';

select * from hosvital.movcxc where doccod='NGR' and mvcxcnro=31565;
select * from hosvital.movcont3 where doccod='NGR' and mvcnro=31565;
select * from hosvital.movcont2 where doccod='NGR' and mvcnro=31565;

select * from hosvital.hojobl where hojnumobl ='496278' and cntvig=2019;
select * from hosvital.movcxc where mccnumobl='518740';

select * from hosvital.hojobl where hojnumobl ='518455' and cntvig=2019;
select * from hosvital.movcxc where mccnumobl='518455'; -- ngr 31565

-- update hosvital.movcxc set mccvlr = 0 where 
select * from hosvital.movcont2 where doccod='NGR' and mvcnro=31565 and  mvcdocrf1='518455';


select * from hosvital.hojobl where hojnumobl ='518455' and cntvig=2019;


select * from hosvital.movcxc where mccnumobl='518455'; -- ngr 31565

select sum(mccvlr)
from hosvital.movcxc
 where mccnumobl='518455' and mccnat='C' and doccod<>'FAD'; -- 1962589.80	 // 961836.00	--contab credito= 168643.80	



-- estaba 518455         	901127521      	2019	13021001            	


select * from hosvital.hojobl where hojnumobl ='518455' and cntvig=2019;

update hosvital.hojobl set  hojtotcre=1000753.8 
where  hojnumobl ='518455' and cntvig=2019;






select sum(mccvlr)
from hosvital.movcxc
 where mccnumobl='518455' and mccnat='D' and doccod<>'FAD';  -- 1923672.00	 //  961836.00	-- contabdebito = 961836.00	

select * from hosvital.movcont2;

select *
from hosvital.movcont2
where mvcdocrf1='518455' and cntcod like ('%13');

select sum(mvcvlr)
from hosvital.movcont2
where mvcdocrf1='518455' and cntcod like ('%13') and   mvcnat='D';

select sum(mvcvlr)
from hosvital.movcont2
where mvcdocrf1='518455' and cntcod like ('%13') and   mvcnat='C';


select * from hosvital.hojobl where hojnumobl ='518455' and cntvig=2019;


select * from hosvital.movcxc where mccnumobl='518455'; 



select h.hojnumobl,h.cntcod, h.hojtotcre as creditos_actuales,
(select sum(m.mccvlr)
from hosvital.movcxc m
where m.mccnumobl=h.hojnumobl and m.cntcod=h.cntcod and m.doccod!='FAD' and m.mccnat='C'

) as creditos_correctos
from hosvital .hojobl h
where h.hojnumobl='518455' and h.cntcod= '13021001' and h.cntvig=2019;

select * from hosvital.maeemp where menomb like ('%FAMISANA%');

-- Veamos descuadres

select h.hojnumobl,h.cntcod, h.hojtotcre as creditos_actuales,
(select sum(m.mccvlr)
from hosvital.movcxc m
where m.clicod=h.clicod and m.mccnumobl=h.hojnumobl and m.cntcod=h.cntcod and m.doccod!='FAD' and mccnat='C'
) as creditos_correctos, (h.hojtotdeb-h.hojtotcre) as saldo_actual,
(select h.hojtotdeb - sum(m.mccvlr)
from hosvital.movcxc m
where m.clicod=h.clicod and m.mccnumobl=h.hojnumobl and m.cntcod=h.cntcod and m.doccod!='FAD' and mccnat='C'
) as deberia_saldo_correcto
from hosvital .hojobl h
where   h.cntvig=2019 and   h.clicod= '891180008' and
  h.hojtotcre <> (select sum(m1.mccvlr)
from hosvital.movcxc m1
where m1.mccnumobl=h.hojnumobl and m1.cntcod=h.cntcod and m1.doccod!='FAD' and m1.mccnat='C')
order by (h.hojtotdeb-h.hojtotcre);

-- update x Contrato-empresa


select * from hosvital.movcxc where mccnumobl = '551410' ;

select * from hosvital.hojobl where hojnumobl = '551410' and cntvig='2019';
select * from hosvital.hojobl where hojnumobl = '496290' and cntvig='2019';
select * from hosvital.hojobl where hojnumobl in ( '496290','502212') and cntvig='2019';

--factura nO  496290 tenia fecha de cancelacion de factura  2018-11-23	
select  hojnumobl, hjfcanobl  from hosvital.hojobl where hojnumobl in ( '496290','496298') and cntvig='2019';

update hosvital.hojobl set hjfcanobl='0001-01-01' where hojnumobl in ( '496290') and cntvig=2019;

-- este es el UPDATE GENERAL

update hosvital.hojobl h
set h.hojtotcre = (select sum(m.mccvlr)
	from hosvital.movcxc m
	where m.mccnumobl=h.hojnumobl and m.cntcod=h.cntcod and m.doccod != 'FAD' and mccnat='C')
where  clicod= '901127521' and h.cntvig=2019 and 
	h.hojnumobl in   ('523566','523630','524475','520955','547026')  and h.cntcod= '13021001' and    h.hojtotcre <> (select sum(m1.mccvlr)
					                         from hosvital.movcxc m1
					                          where m1.clicod= h.clicod and m1.mccnumobl=h.hojnumobl and m1.cntcod=h.cntcod and m1.doccod!='FAD' and m1.mccnat='C');


-- Consulta con fechas de cancelacion

select  hojnumobl, hjfcanobl,(hojtotdeb-hojtotcre)  from hosvital.hojobl 
where cntcod= '13021001' and cntvig=2019 and clicod= '901127521' and hjfcanobl='2018-11-23'
order by hojnumobl;

select  hojnumobl, hjfcanobl  from hosvital.hojobl where hojnumobl in ( '496290','496298','502212') and cntvig='2019';


select  hojnumobl, hjfcanobl,(hojtotdeb-hojtotcre)  from hosvital.hojobl 
where cntcod= '13021001' and cntvig=2019 and clicod= '901127521' and hjfcanobl<>'2018-11-23'
order by hojnumobl;

 -- estas cuentas tenian fecha de cancelacion del  2018-11-23

update  hosvital.hojobl 
set  hjfcanobl='0001-01-01' 
where cntcod= '13021001' and cntvig=2019 and clicod= '901127521' and hjfcanobl='2018-11-23';


select * from hosvital.movcxc where mccnumobl ='484067';

select * from hosvital.hojobl where hojnumobl ='484067' and cntvig=2019;

update hosvital.hojobl   -- estaba 2019-07-05	
set  hjfcanobl='0001-01-01' 
where hojnumobl ='484067' and cntvig=2019;
