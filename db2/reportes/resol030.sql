select * from hosvital.docucon where docdsc like ('%RECIBO%');;  -- DRC	

select count(*) from hosvital.maeate where facfch >= '2019-01-01' and facfch <= '2019-03-31'; -- 11227	


select * from hosvital.maeemp;
select * from hosvital.maeate;
select * from hosvital.admglo11 where mpnfac = 342506;
select * from hosvital.admglo01 where aglremnr = 14127	;
select * from hosvital.adglosas ad1 where ad1.gloinddev='S' and ad1.mpnfac in (select mpnfac from hosvital.admglo11 where aglremnr = 14127) and
                     glofchrec = (select max(glofchrec) from hosvital.adglosas x where x.mpnfac = ad1.mpnfac)
order by mpnfac;


select * from hosvital.movcxc where mccfch >= '2019-01-01 00:00:00' AND mccfch <= '2019-03-31 00:00:00'  and doccod='DRC';

select * from hosvital.adglosas where gloinddev='S' and mpnfac = 342506	;

CREATE SEQUENCE hosvital.ley_3010  START WITH 1 INCREMENT BY 1  NO MAXVALUE      NO CYCLE      CACHE 24;

select NEXT VALUE FOR hosvital.ley_3010;

select  hosvital.ley_3010.currval;


select * from hosvital.movcxc where  mccnumobl = '563763' and cntvig=2019 and mccfch>= '2019-01-01 00:00:00'  and doccod='DRC'   and cast(mccnumobl as integer) in (select mpnfac from hosvital.maeate);


select *  from hosvital.maeate  where fACFCH >= '2019-01-01' AND facfch <= '2019-01-02' and mpnfac  in (select cast( mccnumobl as numeric)  from hosvital.movCxc  where cntvig=2019  and doccod='DRC'); 


select '2','1','NI',substring(m2.mecntr,1,9), m2.menomb,'NI','860007373','F','',m1.mpnfac,
case when m1.facfch<='2018-12-31' then 'A' else 'I' end,
m1.matotf,m1.facfch,a.aglfrdfac,
(select ad1.glofchrec  
from hosvital.adglosas ad1 
where m1.mpnfac = ad1.mpnfac and ad1.gloinddev='S'  and
                     ad1.glofchrec = (select max(glofchrec) from hosvital.adglosas x where x.mpnfac = ad1.mpnfac)

) as fecha_dev,

(select sum(mx.mccvlr)
from hosvital.movcxc mx 
where mx.cntvig=2019 and m1.mpnfac  = cast(mx.mccnumobl as integer) and mx.empcod= '01' and  mx.mcdpto='001' and mx.doccod = 'DRC'
) as valor_pagos_aplicados,

(select ad1.glovlrtpen
from hosvital.adglosas ad1 
where m1.mpnfac = ad1.mpnfac and ad1.gloinddev='S'  and
                     ad1.glofchrec = (select max(glofchrec) from hosvital.adglosas x where x.mpnfac = ad1.mpnfac)

) as valor_glosa_vigente,


(select case when  ad1.gloedo = '5' then 'SI'
	 when ad1.gloedo = '6' then 'SI'
	 when ad1.gloedo = '8' then 'SI'
	 when ad1.gloedo = '9' then 'SI'
	 when ad1.gloedo = '11' then 'SI'
	 when ad1.gloedo = '12' then 'SI'
	 when ad1.gloedo = '13' then 'SI'
	 ELSE  'NO' end
from hosvital.adglosas ad1 
where m1.mpnfac = ad1.mpnfac and ad1.gloinddev='S'  and
                     ad1.glofchrec = (select max(glofchrec) from hosvital.adglosas x where x.mpnfac = ad1.mpnfac)

) as vglosa_respondida,
m1.masalcxc as saldo_factura,
'NO',
0
from hosvital.maeate m1
inner join hosvital.maeemp m2 on  (m1.mpmeni=m2.mennit)
inner join hosvital.admglo11 a on (a.mpnfac = m1.mpnfac)
where m1.facfch >= '2019-01-01' and m1.facfch <= '2019-03-31' and m1.maestf not in ('1','10') ;


--------------------------------
-- acotado
---------------------------------------


select '2','1','NI',substring(m2.mecntr,1,9), m2.menomb,'NI','860007373','F','',m1.mpnfac,case when m1.facfch<='2018-12-31' then 'A' else 'I' end,m1.matotf,m1.facfch,a.aglfrdfac,
(select ad1.glofchrec  from hosvital.adglosas ad1 where m1.mpnfac = ad1.mpnfac and ad1.gloinddev='S'  and ad1.glofchrec = (select max(glofchrec) from hosvital.adglosas x where x.mpnfac = ad1.mpnfac)) as fecha_dev,
(select sum(mx.mccvlr) from hosvital.movcxc mx where mx.cntvig=2019 and m1.mpnfac  = cast(mx.mccnumobl as integer) and mx.empcod= '01' and  mx.mcdpto='001' and mx.doccod = 'DRC'
) as valor_pagos_aplicados,(select ad1.glovlrtpen from hosvital.adglosas ad1 where m1.mpnfac = ad1.mpnfac and ad1.gloinddev='S' and ad1.glofchrec = (select max(glofchrec) from hosvital.adglosas x where x.mpnfac = ad1.mpnfac)
) as valor_glosa_vigente,'si' as glosa_respondida,m1.masalcxc as saldo_factura,'NO',0 from hosvital.maeate m1 inner join hosvital.maeemp m2 on  (m1.mpmeni=m2.mennit) inner join hosvital.admglo11 a on (a.mpnfac = m1.mpnfac)
where m1.facfch >= '2019-01-01' and m1.facfch <= '2019-03-31' and m1.maestf not in ('1','10') ;

	


----------------
------- sdo query con cartera atras

----------------------------------------


select '2','1','NI',substring(m2.mecntr,1,9), m2.menomb,'NI','860007373','F','',m1.mpnfac,
case when m1.facfch <= '2018-12-31'  then 'A' else 'I' end,  m1.matotf as total_factura,  m1.facfch as fecha_factura    ,  a.aglfrdfac as radicacion,
(select ad1.glofchrec 
from hosvital.adglosas ad1 
where m1.mpnfac = ad1.mpnfac and ad1.gloinddev='S'  and
                     ad1.glofchrec = (select max(glofchrec) from hosvital.adglosas x where x.mpnfac = ad1.mpnfac)
) as fecha_dev,
(select sum(mx.mccvlr)
from hosvital.movcxc mx 
where  m1.mpnfac  = cast(mx.mccnumobl as integer) and mx.empcod= '01' and  mx.mcdpto='001' and mx.doccod = 'DRC'
) as valor_pagos_aplicados,
(select ad1.glovlrtpen
from hosvital.adglosas ad1 
where m1.mpnfac = ad1.mpnfac and ad1.gloinddev='S'  and
                     ad1.glofchrec = (select max(glofchrec) from hosvital.adglosas x where x.mpnfac = ad1.mpnfac)

) as valor_glosa_vigente,
(select case when  ad1.gloedo = '5' then 'SI'  when ad1.gloedo = '6' then 'SI' when ad1.gloedo = '8' then 'SI'  when ad1.gloedo = '9' then 'SI'
	 when ad1.gloedo = '11' then 'SI' 	 when ad1.gloedo = '12' then 'SI' 	 when ad1.gloedo = '13' then 'SI' 	 ELSE  'NO' end
from hosvital.adglosas ad1 where m1.mpnfac = ad1.mpnfac and ad1.gloinddev='S'  and    ad1.glofchrec = (select max(glofchrec) from hosvital.adglosas x where x.mpnfac = ad1.mpnfac)

) as vglosa_respondida,
m1.masalcxc as saldo_factura,
'NO',
0
from hosvital.maeate m1
inner join hosvital.maeemp m2 on  (m2.mennit  =  m1.mpmeni)
left join hosvital.admglo11 a on (a.mpnfac = m1.mpnfac)
where  --  h.cntvig=2019 and
 m1.matipdoc='2' and m1.facfch >= date('2019-01-01') and m1.facfch<= date('2019-03-31') and m1.maestf not in ('1','10') ;


-- inner  join hosvital.hojobl h on (1=1)

-- and h.empcod='01' and h.mcdpto='001'   and (h.hojtotdeb-h.hojtotcre) >0 
	-- and rtrim(h.hojnumobl ) =  '566164'  and cast(rtrim(h.hojnumobl) as integer)= 566164  and h.mennit= m2.mennit;


select * from hosvital.hojobl where empcod = '01' and mcdpto= '001' and hojfchobl >= '2019-01-01 00:00:00' and (hojtotdeb-hojtotcre) >0 and cntvig=2019   and rtrim(hojnumobl ) =  '566164'  and cast(rtrim(hojnumobl) as integer)= 566164;

select * from hosvital.hojobl where  hojnumobl = '566164' and  hojfchobl >= '2019-01-01 00:00:00' and (hojtotdeb-hojtotcre) >0 and cntvig=2019  ;
select * from hosvital.maeate where mpnfac = 566164;

select *
from hosvital.maeate m1
inner  join hosvital.hojobl h on (1=1  )
inner join hosvital.maeemp m2 on  (m1.mpmeni=m2.mennit)
left join hosvital.admglo11 a on (a.mpnfac = m1.mpnfac)
where  m1.matipdoc='2' and m1.facfch >= '2019-01-01' and m1.facfch<= '2019-03-31' and m1.maestf not in ('1','10') and  rtrim(h.hojnumobl ) =  '566164' and
	h.empcod='01' and h.mcdpto='001' and  h.cntvig=2019 and (h.hojtotdeb-h.hojtotcre) >0  and cast(rtrim(h.hojnumobl) as integer)=  m1.mpnfac ;


--ojo esta factura tiene saldo 8355156.00	  // 8303452.00	
debe tener un abono
448638	A	6832654.00	2017-03-10	2017-03-21	null	1994.00	null	null	6811854.00	




