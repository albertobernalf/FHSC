--   (  SUBSTRING ( M1.MECNTR, 1, (LOCATE('-', M1.MECNTR)-1)  ) = H.CLICOD  )

SELECT  T.TRCCOD , T.TRCRAZSOC, T.TRCAAE , M1.MENOMB, SUM( HOJTOTDEB - HOJTOTCRE)
FROM HOSVITAL.TERCEROS T
INNER JOIN HOSVITAL.HOJOBL H ON (H.CNTVIG=2019  AND   H.HOJFCHRAD = '0001-01-01 00:00:00.000000' AND H.CLICOD = T.TRCCOD)
INNER JOIN HOSVITAL.CLIENTE1 M ON (M.MENNIT=H.MENNIT)
INNER JOIN HOSVITAL.MAEEMP M1  ON (1=1)
WHERE  T.TRCAAE  like ('%GR%')  and  (  SUBSTR ( M1.MECNTR, 1, 9  ) = H.CLICOD  )
GROUP BY  T.TRCCOD , T.TRCRAZSOC, T.TRCAAE , M1.MENOMB
ORDER BY  T.TRCAAE;

--select * from hosvital.maeemp;

-- Query sin radicar

--select distinct(a.doccod),B.DOCDSC
 --from hosvital.movcxc a, hosvital.docucon b
--where a.doccod=b.doccod; --RCC, DRC





select h.clicod, t.trcrazsoc,
(
select sum(p.hojtotdeb - p.hojtotcre)
from hosvital.hojobl p, hosvital.admglo11 t
where p.cntvig=2019 and p.clicod=h.clicod   and   substring (p.cntcod,1,4) = '1301'  and t.mpnfac = cast(p.hojnumobl as numeric)
) as SinRadicar1,
(
select sum(p.hojtotdeb - p.hojtotcre)
from hosvital.hojobl p
where p.cntvig=2019 and p.clicod=h.clicod   and   substring (p.cntcod,1,4) = '1301' and p.HOJFCHRAD <> '0001-01-01 00:00:00.000000' 
) as SinRadicar2,
(
select sum(p.hojtotdeb - p.hojtotcre)
from hosvital.hojobl p
where p.cntvig=2019 and p.clicod=h.clicod  and   substring (p.cntcod,1,4) = '1302'  and p.HOJFCHRAD = '0001-01-01 00:00:00.000000' 
) as Radicados1,
(
select sum(p.hojtotdeb - p.hojtotcre)
from hosvital.hojobl p
where p.cntvig=2019 and p.clicod=h.clicod  and   substring (p.cntcod,1,4) = '1302'  and p.HOJFCHRAD <> '0001-01-01 00:00:00.000000' 
) as Radicados2,
(
select sum(p.hojtotdeb - p.hojtotcre)
from hosvital.hojobl p
inner join hosvital.cliente1 c on (c.clicod = p.clicod and  c.tippcod >= 0 and c.tippcod <= 30 )
where p.cntvig=2019 and p.clicod=h.clicod and    substring (p.cntcod,1,4) = '1302' and p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  and p.hojtotdeb <> p.hojtotcre
) as Treintadias,
(
select sum(p.hojtotdeb - p.hojtotcre)
from hosvital.hojobl p
inner join hosvital.cliente1 c on (c.clicod = p.clicod  and c.tippcod > 30 and c.tippcod <= 60 )
where p.cntvig=2019 and p.clicod=h.clicod  and   substring (p.cntcod,1,4) = '1302'  and p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  and p.hojtotdeb <> p.hojtotcre
) as Sesentadias,
(
select sum(p.hojtotdeb - p.hojtotcre)
from hosvital.hojobl p
inner join hosvital.cliente1 c on (c.clicod = p.clicod  and c.tippcod >=60 and c.tippcod <= 90 )
where p.cntvig=2019 and p.clicod=h.clicod  and   substring (p.cntcod,1,4) = '1302'  and p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  and p.hojtotdeb <> p.hojtotcre
) as noventadias,
(
select sum(p.hojtotdeb - p.hojtotcre)
from hosvital.hojobl p
inner join hosvital.cliente1 c on (c.clicod = p.clicod  and  c.tippcod >90  and c.tippcod <= 180 )
where p.cntvig=2019 and p.clicod=h.clicod  and   substring (p.cntcod,1,4) = '1302'  and p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  and p.hojtotdeb <> p.hojtotcre
) as cientoochentadias,
(
select sum(p.hojtotdeb - p.hojtotcre)
from hosvital.hojobl p
inner join hosvital.cliente1 c on (c.clicod = p.clicod and c.tippcod >180 and c.tippcod <= 360 )
where p.cntvig=2019 and p.clicod=h.clicod   and   substring (p.cntcod,1,4) = '1302'  and p.HOJFCHRAD <>  '0001-01-01 00:00:00.000000'  and p.hojtotdeb <> p.hojtotcre
) as cientoochentaatresciemntosdias,
(
select sum(p.hojtotdeb - p.hojtotcre)
from hosvital.hojobl p
inner join hosvital.cliente1 c on (c.clicod = p.clicod and c.tippcod >360)
where p.cntvig=2019 and p.clicod=h.clicod  and p.HOJFCHRAD <>  '0001-01-01 00:00:00.000000'  and p.hojtotdeb <> p.hojtotcre
) as trescientossesentaadias
from hosvital.hojobl h
inner join  hosvital.terceros t on ( t.trccod = h.clicod)
where h.cntvig=2019  and h.clicod in ( '830003564','900156264')  
       group by h.clicod,t.trcrazsoc
having sum(h.HOJTOTDEB - h.HOJTOTCRE) !=0;

select * from hosvital.hojobl where cntvig=2019 and clicod = '900156264'  order by hojnumobl  --and HOJFCHRAD = '0001-01-01 00:00:00.000000';
select * from hosvital.cliente1;  -- tippcod

SELECT * FROM HOSVITAL.TERCEROS;
select * from hosvital.cliente1 where  clicod = '900156264';

select clicod, sum(hojtotdeb - hojtotcre)
from hosvital.hojobl
where cntvig=2019 and clicod in ( '830003564','900156264') and   substring (cntcod,1,4) in ( '1302')   and HOJFCHRAD <> '0001-01-01 00:00:00.000000'
group by clicod;

select hojnumobl, cntcod,hojtotdeb, hojtotcre,hojfchrad from hosvital.hojobl where cntvig=2019 and clicod = '830003564' and   substring (cntcod,1,4) in ( '1302')    order by HOJFCHRAD;

-- Caso uno esta en la cuenta 1301  pero tiene en la hojobkl fecha de radicacion
--571046         	
--571053         	
--571056         	
-- Caso No 2 esta en la cuenta 1302 pero en la hojobl sin radiacr
--490296         	

select  * from hosvital.admglo11  where mpnfac in (571046,571053,571056,490296); --aglfrdfac