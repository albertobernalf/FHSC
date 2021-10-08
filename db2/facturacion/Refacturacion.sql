select * from hosvital.refact where refacfch >= '2020-07-01';

select * from hosvital.refact1 where refatnum  = 552176	 ;
select * from hosvital.refact1 where refatnum  = 555036		 ;  -- 565735	2019-01-30	


select *  from hosvital.refact1 

order by refatnum;

select m.mptdoc, m.mpcedu, c.mpnomc,m.mpnfac,m.facfch  as fecha_factura,r1.mpnfac, r.refacfch as fecha_refactura
from hosvital.maeate m, hosvital.refact r, hosvital.refact1 r1, hosvital.capbas c
where m.facfch >= '2019-04-01' and m.mpnfac = r.refatnum and r.refatnum =   r1.refatnum and
        m.mptdoc = c.mptdoc and m.mpcedu= c.mpcedu
order by m.mptdoc, m.mpcedu, c.mpnomc;
           
-- Que se refacturo antes de radicar y despues de radicar


-- Sdo Query

select m.mptdoc, m.mpcedu, c.mpnomc,m.mpnfac,m.facfch  as fecha_factura,mae.menomb,m.matotf as valor,r1.mpnfac, r.refacfch as fecha_refactura,
(select r11.mpnfac
 from hosvital.refact1 r11
 where  r11.refatmat =  r1.refatmat and  r11.refatnum = r1.mpnfac
) as re_refacturada,
(select r3.refacfch
 from hosvital.refact1 r2, hosvital.refact r3
 where r2.refatmat = r1.refatmat and  r2.refatnum = r1.mpnfac and r2.refatmat= r3.refatmat and  r2.refatnum = r3.refatnum
) as fecha_re_re_refacturada
from hosvital.maeate m
inner join hosvital.refact r on (r.refatmat= m.matipdoc and r.refatnum=m.mpnfac)
inner join hosvital.refact1 r1 on (r1.refatmat= r.refatmat and r1.refatnum = r.refatnum)
inner join hosvital.capbas c on (c.mptdoc = m.mptdoc and c.mpcedu=m.mpcedu)
inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni)
where m.matipdoc in ('2','5') and  m.facfch = '2020-01-13'  and m.mpnfac  in (618066			)
order by m.mptdoc, m.mpcedu, c.mpnomc;

select * from hosvital.maeate where facfch ='2020-01-13' and maestf in ('1','10');
select * from hosvital.refact  where refatnum in (618029,618058	,618064	,618066	,618079	,618081  );


select * from hosvital.refact  where refatnum  in (618066); -- 622124
select * from hosvital.refact1   where refatnum in (618066); -- 622124


-- tercer query


select m.mptdoc, m.mpcedu, c.mpnomc,m.mpnfac,m.facfch  as fecha_factura,mae.menomb,m.matotf as valor,r1.mpnfac, r.refacfch as fecha_refactura ,

(select r11.mpnfac
 from hosvital.refact1 r11
 where  r11.refatmat =  r1.refatmat and  r11.refatnum = r1.refatnum
) as re_refacturada 

,
(select rr.refacfch
 from hosvital.refact1 r111, hosvital.refact rr
 -- where r111.refatmat = r1.refatmat and  r111.refatnum = r1.mpnfac and r111.refatmat= rr.refatmat and  r111.refatnum = rr.refatnum
 where r111.refatmat = r1.refatmat and  r111.refatnum = r1.refatnum and r111.refatmat= rr.refatmat and  r111.refatnum = rr.refatnum
) as fecha_re_re_refacturada

from hosvital.maeate m
inner join hosvital.refact r on (r.refatmat= m.matipdoc and r.refatnum=m.mpnfac)
inner join hosvital.refact1 r1 on (r1.refatmat= r.refatmat and r1.refatnum = r.refatnum)
inner join hosvital.capbas c on (c.mptdoc = m.mptdoc and c.mpcedu=m.mpcedu)
inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni)
where m.matipdoc in ('2','5') and  m.facfch = '2020-01-13'  and m.mpnfac  in (618066			)
order by m.mptdoc, m.mpcedu, c.mpnomc;


-- Cuarto Query

select * from hosvital.refact  where refatnum  in (634173	); -- 622124
select * from hosvital.refact1   where refatnum in (634173); -- 622124


select m.mptdoc as tipo_doc, m.mpcedu as documento, c.mpnomc as paciente ,m.mpnfac factura,m.facfch  as fecha_factura,mae.menomb contrato,m.matotf as valor,r1.mpnfac refactura, r.refacfch as fecha_refactura 
from hosvital.maeate m inner join hosvital.refact r on (r.refatmat= m.matipdoc and r.refatnum=m.mpnfac) inner join hosvital.refact1 r1 on (r1.refatmat= r.refatmat and r1.refatnum = r.refatnum)
inner join hosvital.capbas c on (c.mptdoc = m.mptdoc and c.mpcedu=m.mpcedu) inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni)
where m.matipdoc in ('2','5') and  m.facfch >= '2020-01-01'  and m.facfch <= '2020-08-31' order by m.mptdoc, m.mpcedu, c.mpnomc;


-- Query, Refacturadas Antes de Radicar

select mpnfac, aglfrdfac  from hosvital.admglo11 where mpnfac =617416	 ; -- 2020-02-07	
select mpnfac, facfch  from hosvital.maeate where mpnfac =617416	 ; -- 2020-01-05	
select * from hosvital.refact where refatnum=617416; -- 2020-06-05	

select m.mptdoc as tipo_doc, m.mpcedu as documento, c.mpnomc as paciente ,m.mpnfac factura,m.facfch  as fecha_factura,mae.menomb contrato,m.matotf as valor,r1.mpnfac refactura, r.refacfch as fecha_refactura 
from hosvital.maeate m
 inner join hosvital.refact r on (r.refatmat= m.matipdoc and r.refatnum=m.mpnfac) 
inner join hosvital.refact1 r1 on (r1.refatmat= r.refatmat and r1.refatnum = r.refatnum)
inner join hosvital.capbas c on (c.mptdoc = m.mptdoc and c.mpcedu=m.mpcedu) 
inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni) and r.refacfch < (select adm.aglfrdfac from hosvital.admglo11 adm  where  adm.mpnfac = m.mpnfac)
where m.matipdoc in ('2','5') and  m.facfch >= '2020-01-01'  and m.facfch <= '2020-08-31' and m.mpnfac =617416  
  order by m.facfch,m.mptdoc, m.mpcedu;
