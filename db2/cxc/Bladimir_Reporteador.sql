select * from hosvital.movcxc where mccnumobl ='555395';
select * from hosvital.hojobl where  hojnumobl ='555395';

select h.hojnumobl,h.clicod,h.cntcod,h.hojfchobl, h.hojvlrobl,h.hojtotdeb,h.hojtotcre, (h.hojtotdeb -  h.hojtotcre) saldo_hojobl,sum(case when m.mccnat='D' then m.mccvlr end) as deb_movcxc, sum(case when m.mccnat='C' then m.mccvlr end) as cred_movcxc ,
(sum(case when m.mccnat='D' then m.mccvlr end) - sum(case when m.mccnat='C' then m.mccvlr end)) saldo_movcxc
from hosvital.hojobl h
inner join hosvital.movcxc m on (m.empcod='01' and m.mccnumobl = h.hojnumobl  and m.clicod = h.clicod and m.cntcod=h.cntcod)
where h.empcod='01' and h.cntvig=2020 and h.clicod='800130907' and h.hjfcanobl ='0001-01-01'
group by h.hojnumobl,h.clicod,h.cntcod,h.hojfchobl, h.hojvlrobl,h.hojtotdeb,h.hojtotcre, (h.hojtotdeb -  h.hojtotcre)
having (h.hojtotdeb -  h.hojtotcre) <>  (sum(case when m.mccnat='D' then m.mccvlr end)  - sum(case when m.mccnat='C' then m.mccvlr end))
order by h.hojnumobl;

select * from hosvital.movcont2;

-- Con la movcont2

select * from hosvital.movcont2 where mvcdocrf1 ='555395';

select * from hosvital.movcxc where mccnumobl ='555395';
select * from hosvital.hojobl where  hojnumobl ='555395';


select m2.doccod,m2.mvcnro,m2.trccod,m2.cntcod,
sum(case when m.mccnat='D' then m.mccvlr end) as deb_movcxc, sum(case when m.mccnat='C' then m.mccvlr end) as cred_movcxc ,
sum(case when m2.mvcnat='D' then m2.mvcvlrlc end) as deb_movcont2, sum(case when m2.mvcnat='C' then m2.mvcvlrlc end) as cred_movcont2 ,
(sum(case when m.mccnat='D' then m.mccvlr end) - sum(case when m.mccnat='C' then m.mccvlr end)) saldo_movcxc
from hosvital.movcont2 m2
inner join hosvital.movcxc m on (m.empcod=m2.empcod  and m.cntvig= m2.cntvig and m.mccnumobl = m2.mvcdocrf1  and m.clicod = m2.trccod and m.cntcod=m2.cntcod and m.doccod=m2.doccod and m.mvcxcnro=m2.mvcnro)
where m2.empcod='01'  and m2.cntvig>=2020   and m2.trccod>='0' 
group by m2.doccod, m2.mvcnro,m2.trccod,m2.cntcod
having (   sum(case when m2.mvcnat='D' then m2.mvcvlrlc end)  - sum(case when m2.mvcnat='C' then m2.mvcvlrlc end)    ) <>  (sum(case when m.mccnat='D' then m.mccvlr end)  - sum(case when m.mccnat='C' then m.mccvlr end))
order by  m2.mvcnro;


select * from hosvital.movcont2 where doccod='DRC' AND MVCNRO=22854;

-- Detallado

select m2.doccod,m2.mvcnro,m2.mvcdocrf1 ,m2.trccod,m2.cntcod,
sum(case when m.mccnat='D' then m.mccvlr end) as deb_movcxc, sum(case when m.mccnat='C' then m.mccvlr end) as cred_movcxc ,
sum(case when m2.mvcnat='D' then m2.mvcvlrlc end) as deb_movcont2, sum(case when m2.mvcnat='C' then m2.mvcvlrlc end) as cred_movcont2 ,
(sum(case when m.mccnat='D' then m.mccvlr end) - sum(case when m.mccnat='C' then m.mccvlr end)) saldo_movcxc
from hosvital.movcont2 m2
inner join hosvital.cuentas c on (c.cntvig=m2.cntvig and c.cntcod=m2.cntcod and c.cntint ='CXC')
left join hosvital.movcxc m on (m.empcod=m2.empcod  and m.mccnumobl = m2.mvcdocrf1  and m.clicod = m2.trccod and m.cntcod=m2.cntcod and m.doccod=m2.doccod and m.mvcxcnro=m2.mvcnro)
where m2.empcod='01'  and m2.cntvig=2020   and m2.trccod ='860066942'
group by m2.doccod, m2.mvcnro,m2.mvcdocrf1 ,m2.trccod,m2.cntcod
order by  m2.mvcdocrf1;


-- Global



select m2.doccod,m2.mvcnro,m2.mvcdocrf1 ,m2.trccod,m2.cntcod,
sum(case when m.mccnat='D' then m.mccvlr end) as deb_movcxc, sum(case when m.mccnat='C' then m.mccvlr end) as cred_movcxc ,
sum(case when m2.mvcnat='D' then m2.mvcvlrlc end) as deb_movcont2, sum(case when m2.mvcnat='C' then m2.mvcvlrlc end) as cred_movcont2 ,
(sum(case when m.mccnat='D' then IFNULL(m.mccvlr,0) end) - sum(case when m.mccnat='C' then IFNULL( m.mccvlr,0) end)) saldo_movcxc
from hosvital.movcont2 m2
inner join hosvital.cuentas c on (c.cntvig=m2.cntvig and c.cntcod=m2.cntcod and c.cntint ='CXC')
left join hosvital.movcxc m on (m.empcod=m2.empcod  and m.mccnumobl = m2.mvcdocrf1  and m.clicod = m2.trccod and m.cntcod=m2.cntcod and m.doccod=m2.doccod and m.mvcxcnro=m2.mvcnro)
where m2.empcod='01'  and m2.cntvig=2020   and m2.trccod ='860066942'
group by m2.doccod, m2.mvcnro,m2.mvcdocrf1 ,m2.trccod,m2.cntcod
having (   sum(case when m2.mvcnat='D' then m2.mvcvlrlc end)  - sum(case when m2.mvcnat='C' then m2.mvcvlrlc end)    ) <>  (sum(case when m.mccnat='D' then m.mccvlr end)  - sum(case when m.mccnat='C' then m.mccvlr end))
order by  m2.mvcdocrf1;


/*
having (   sum(case when m2.mvcnat='D' then m2.mvcvlrlc end)  - sum(case when m2.mvcnat='C' then m2.mvcvlrlc end)    ) <>  (sum(case when m.mccnat='D' then m.mccvlr end)  - sum(case when m.mccnat='C' then m.mccvlr end))
*/

-- Otro query

select * from hosvital.movcont2 m2
where m2.empcod='01' and m2.cntvig=2020 and m2.trccod = '860066942' and  (m2.doccod , m2.mvcnro) not in (select mcxc.doccod, mcxc.mvcxcnro from hosvital.movcxc mcxc)
order by m2.mvcdocrf1;

select * from hosvital.movcxc where doccod='RSD' AND MVCXCNRO=672;

select * from hosvital.cuentas where cntint ='CXC';

-- Query en limpio creo del Balance de Prueba

select r.rsmctncon,r.trccod,t.trcrazsoc , sum(r.rsmsalant), sum(r.rsmcre), sum(r.rsmdeb), sum(r.rsmsalact)
from hosvital.resmcue r
inner join hosvital.cuentas c on (c.empcod=r.rsmempcod and c.cntvig=2019 and c.cntcod= r.rsmctncon  and c.cntint='CXC')
inner join hosvital.terceros t on (t.trccod=r.trccod)
where  r.rsmempcod = '01' and r.mcdpto='001' and r.rsmano=2019 and r.rsmmes=1 and r.trccod='900156264'    and
(r.rsmsalant <> 0.00 or r.rsmdeb <> 0.00 or r.rsmcre <> 0.00 or  r.rsmsalact<> 0.00)
group by rsmctncon,r.trccod,t.trcrazsoc
having (sum(r.rsmsalant) <> 0.00 OR sum(r.rsmcre) <> 0.00 OR sum(r.rsmdeb) <> 0.00 OR  sum(r.rsmsalact) <> 0.00)
order by rsmctncon,t.trcrazsoc ;



-- QUERY UKLTIMO

select * from hosvital.hojobl;

-- cuenta, cod cliente, nombre cliente, n factura, fecha factura, fecha radicacion y saldo 

select h.cntcod cuenta , h.clicod cliente , t.trcrazsoc nombre_cliente , h.hojnumobl factura,h.hojfchobl fecha_obligacion , h.hojvlrobl valor ,h.hojtotdeb debitow ,h.hojtotcre creditos, h.hojfchrad fecha_radicacion, (h.hojtotdeb -  h.hojtotcre) saldo
from hosvital.hojobl h
left  join hosvital.terceros t on (t.trccod=h.clicod)
where h.empcod='01' and h.cntvig=2019 and h.clicod='900156264' and (h.hojtotdeb - h.hojtotcre) <> 0  and h.hojfchobl <='2019-01-31 23:59:59'
order by  h.cntcod ,h.hojnumobl ;

-- Super Query mixto


select r.rsmctncon,r.trccod,t.trcrazsoc , sum(r.rsmsalant), sum(r.rsmcre), sum(r.rsmdeb), sum(r.rsmsalact), h.hojnumobl,h.hojfchobl fecha_obligacion , h.hojvlrobl valor ,h.hojtotdeb debitos ,h.hojtotcre creditos, h.hojfchrad fecha_radicacion, (h.hojtotdeb -  h.hojtotcre) saldo
from hosvital.resmcue r
inner join hosvital.cuentas c on (c.empcod=r.rsmempcod and c.cntvig=2020 and c.cntcod= r.rsmctncon  and c.cntint='CXC')
inner join hosvital.terceros t on (t.trccod=r.trccod)
inner join hosvital.hojobl h on (h.empcod=r.rsmempcod and h.cntvig=r.rsmano and h.clicod = r.trccod and h.cntcod=r.rsmctncon and h.hojfchobl <='2020-08-31 23:59:59' )
where  r.rsmempcod = '01' and r.mcdpto='001' and r.rsmano=2020 and r.rsmmes=8 and r.trccod='900156264'     and (h.hojtotdeb - h.hojtotcre) <> 0 and r.rsmctncon='13010501' and
(r.rsmsalant <> 0.00 or r.rsmdeb <> 0.00 or r.rsmcre <> 0.00 or  r.rsmsalact<> 0.00)
group by rsmctncon,r.trccod,t.trcrazsoc,h.hojnumobl,h.hojfchobl  , h.hojvlrobl  ,h.hojtotdeb ,h.hojtotcre , h.hojfchrad , (h.hojtotdeb -  h.hojtotcre) 
having (sum(r.rsmsalant) <> 0.00 OR sum(r.rsmcre) <> 0.00 OR sum(r.rsmdeb) <> 0.00 OR  sum(r.rsmsalact) <> 0.00)
--order by rsmctncon,t.trcrazsoc
order by r.rsmctncon,r.trccod,h.hojnumobl;


--  QUery hasta Enero del 2019


select r.rsmctncon,r.trccod,t.trcrazsoc , sum(r.rsmsalant), sum(r.rsmcre), sum(r.rsmdeb), sum(r.rsmsalact), h.hojnumobl,h.hojfchobl fecha_obligacion , h.hojvlrobl valor ,h.hojtotdeb debitos ,h.hojtotcre creditos, h.hojfchrad fecha_radicacion, (h.hojtotdeb -  h.hojtotcre) saldo
from hosvital.resmcue r
inner join hosvital.cuentas c on (c.empcod=r.rsmempcod and c.cntvig=2019 and c.cntcod= r.rsmctncon  and c.cntint='CXC')
inner join hosvital.terceros t on (t.trccod=r.trccod)
inner join hosvital.hojobl h on (h.empcod=r.rsmempcod and h.cntvig=r.rsmano and h.clicod = r.trccod and h.cntcod=r.rsmctncon  and h.hojfchobl <='2019-01-31 23:59:59')
where  r.rsmempcod = '01' and r.mcdpto='001' and r.rsmano=2019 and r.rsmmes=1 and r.trccod='900156264'     and (h.hojtotdeb - h.hojtotcre) <> 0 and
(r.rsmsalant <> 0.00 or r.rsmdeb <> 0.00 or r.rsmcre <> 0.00 or  r.rsmsalact<> 0.00)
group by rsmctncon,r.trccod,t.trcrazsoc,h.hojnumobl,h.hojfchobl  , h.hojvlrobl  ,h.hojtotdeb ,h.hojtotcre , h.hojfchrad , (h.hojtotdeb -  h.hojtotcre) 
having (sum(r.rsmsalant) <> 0.00 OR sum(r.rsmcre) <> 0.00 OR sum(r.rsmdeb) <> 0.00 OR  sum(r.rsmsalact) <> 0.00)
--order by rsmctncon,t.trcrazsoc
order by r.rsmctncon,r.trccod,h.hojnumobl;

select r.rsmctncon,r.trccod,t.trcrazsoc , sum(r.rsmsalant), sum(r.rsmcre), sum(r.rsmdeb), sum(r.rsmsalact) , sum (h.hojtotdeb -  h.hojtotcre) saldo
from hosvital.resmcue r
inner join hosvital.cuentas c on (c.empcod=r.rsmempcod and c.cntvig=2019 and c.cntcod= r.rsmctncon  and c.cntint='CXC')
inner join hosvital.terceros t on (t.trccod=r.trccod)
inner join hosvital.hojobl h on (h.empcod=r.rsmempcod and h.cntvig=r.rsmano and h.clicod = r.trccod and h.cntcod=r.rsmctncon  and h.hojfchobl <='2019-01-31 23:59:59')
where  r.rsmempcod = '01' and r.mcdpto='001' and r.rsmano=2019 and r.rsmmes=1 and r.trccod='900156264'     and (h.hojtotdeb - h.hojtotcre) <> 0 and  r.rsmctncon= '13010501'

group by rsmctncon,r.trccod,t.trcrazsoc
order by r.rsmctncon,r.trccod;

-- Demostracion de la mayorizacion -- Super Query

select rsmano,rsmmes , count(*) 
from hosvital.resmcue 
where trccod= '900156264'  
group by rsmano,rsmmes order by rsmano,rsmmes;

select * from  hosvital.resmcue 
where trccod= '900156264'  and rsmano >= 2008  and rsmctncon = '13010501' order by rsmano,rsmmes;

select r.rsmctncon,r.rsmano,r.rsmmes,r.trccod,r.rsmsalant,r.rsmdeb,r.rsmcre,r.rsmsalact,
(select r1.rsmsalant
from hosvital.resmcue r1
where  r1.rsmempcod  = r.rsmempcod  and   r1.trccod= r.trccod  and r1.rsmctncon = r.rsmctncon and r1.rsmano= case when r.rsmmes= 13 then (r.rsmano +1 )     when r.rsmmes< 13 then (r.rsmano ) end
	and  r1.rsmmes =    case when r.rsmmes < 13 then   (r.rsmmes + 1)     when r.rsmmes = 13 then     1 end           
) anterior_siguiente,
( r.rsmsalact - 
(select r1.rsmsalant
from hosvital.resmcue r1
where  r1.rsmempcod  = r.rsmempcod  and r1.trccod= r.trccod  and r1.rsmctncon = r.rsmctncon and r1.rsmano= case when r.rsmmes= 13 then (r.rsmano +1 )     when r.rsmmes< 13 then (r.rsmano ) end
	and  r1.rsmmes =    case when r.rsmmes < 13 then   (r.rsmmes + 1)     when r.rsmmes = 13 then     1 end           
)
) diferencia_cambio_mes_saldo,
(r.rsmsalant +r.rsmdeb - r.rsmcre) saldo_actual_debe_ser,
(r.rsmsalact -  r.rsmsalant - r.rsmdeb  + r.rsmcre   )  diferencia_calculo_saldo_actual,
(
select SUM(case when m2.mvcnat ='D' THEN m2.MVCVLR END  )
FROM  hosvital.movcont2 m2
 where  m2.empcod =   r.rsmempcod and    m2.mvcanio= r.rsmano and m2.mvcmes = r.rsmmes and m2.trccod=r.trccod  and m2.cntcod = r.rsmctncon and (m2.empcod,m2.doccod,m2.mvcnro) not in (select m3.empcod,m3.doccod,m3.mvcnro from hosvital.movcont3 m3 where m3.empcod=m2.empcod and m3.doccod=m2.doccod and m3.mvcnro = m2.mvcnro and   m3.mvcest ='A')
) debitos_movcont2,
(
select SUM(case when m2.mvcnat ='C' THEN m2.MVCVLR END  )
FROM  hosvital.movcont2 m2
 where  m2.empcod =   r.rsmempcod and m2.mvcanio= r.rsmano and m2.mvcmes = r.rsmmes and m2.trccod=r.trccod  and m2.cntcod = r.rsmctncon and (m2.empcod,m2.doccod,m2.mvcnro) not in (select m3.empcod,m3.doccod,m3.mvcnro from hosvital.movcont3 m3 where m3.empcod=m2.empcod and m3.doccod=m2.doccod and m3.mvcnro = m2.mvcnro and   m3.mvcest ='A')
) creditos_movcont2
 from  hosvital.resmcue  r
where r.rsmempcod = '01' and r.mcdpto='001' and   r.trccod= '900156264' and r.rsmctncon = '13010501'
order by r.rsmctncon, r.rsmano,r.rsmmes;

-- query de mayorizacion como seria:
select distinct mvcest from hosvital.movcont3;

select * from hosvital.movcont2; -- where mvcanio=2014 and mvcmes=1 and trccod='900156264' and cntcod='13010501';

select mvcanio,mvcmes,cntcod,SUM(case when mvcnat ='D' THEN MVCVLR END  ) DEBITOS,SUM(case when mvcnat ='C' THEN MVCVLR END  ) CREDITOS
FROM  hosvital.movcont2
 where  trccod='900156264' and cntcod='13010501'
GROUP BY  mvcanio,mvcmes,CNTCOD
order by mvcanio,mvcmes,cntcod;


-----------------------------------------
-- Super query Con la tabla Auxiliares
-----------------------------------------

select * from hosvital.rsmaux;


select r.rsmctncon,r.rsmano,r.rsmmes,r.rsaxsant,r.rsaxdeb,r.rsaxcre, r.rsaxsact,
(select r1.rsaxsant
from hosvital.rsmaux r1
where  r1.rsmempcod  = r.rsmempcod  and r1.rsmctncon = r.rsmctncon and r1.rsmano= case when r.rsmmes= 13 then (r.rsmano +1 )     when r.rsmmes< 13 then (r.rsmano ) end
	and  r1.rsmmes =    case when r.rsmmes < 13 then   (r.rsmmes + 1)     when r.rsmmes = 13 then     1 end           
) anterior_siguiente,
(  r.rsaxsact - 
(select r1.rsaxsant
from hosvital.rsmaux r1
where  r1.rsmempcod  = r.rsmempcod    and r1.rsmctncon = r.rsmctncon and r1.rsmano= case when r.rsmmes= 13 then (r.rsmano +1 )     when r.rsmmes< 13 then (r.rsmano ) end
	and  r1.rsmmes =    case when r.rsmmes < 13 then   (r.rsmmes + 1)     when r.rsmmes = 13 then     1 end           
)
) diferencia_cambio_mes_saldo,
(r.rsaxsant +r.rsaxdeb - r.rsaxcre) saldo_actual_debe_ser,
(r.rsaxsact -  r.rsaxsant - r.rsaxdeb  + r.rsaxcre   )  diferencia_calculo_saldo_actual,
(
select SUM(case when m2.mvcnat ='D' THEN m2.MVCVLR END  )
FROM  hosvital.movcont2 m2
 where  m2.empcod =   r.rsmempcod and    m2.mvcanio= r.rsmano and m2.mvcmes = r.rsmmes  and m2.cntcod = r.rsmctncon and (m2.empcod,m2.doccod,m2.mvcnro) not in (select m3.empcod,m3.doccod,m3.mvcnro from hosvital.movcont3 m3 where m3.empcod=m2.empcod and m3.doccod=m2.doccod and m3.mvcnro = m2.mvcnro and   m3.mvcest ='A')
) debitos_movcont2,
(
select SUM(case when m2.mvcnat ='C' THEN m2.MVCVLR END  )
FROM  hosvital.movcont2 m2
 where  m2.empcod =   r.rsmempcod and m2.mvcanio= r.rsmano and m2.mvcmes = r.rsmmes and  m2.cntcod = r.rsmctncon and (m2.empcod,m2.doccod,m2.mvcnro) not in (select m3.empcod,m3.doccod,m3.mvcnro from hosvital.movcont3 m3 where m3.empcod=m2.empcod and m3.doccod=m2.doccod and m3.mvcnro = m2.mvcnro and   m3.mvcest ='A')
) creditos_movcont2
 from  hosvital.rsmaux  r
where r.rsmempcod = '01' and r.rsmctncon = '13010501'
order by r.rsmctncon, r.rsmano,r.rsmmes;