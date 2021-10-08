
select '2','1','NI',substring(m2.mecntr,1,9), m2.menomb as empresa,'NI','860007373','F','',m1.mpnfac as factura,
case when m1.facfch<='2018-12-31' then 'A' else 'I' end,
m1.matotf as total_factura, char(m1.facfch, ISO)  as fecha_factura ,char(a.aglfrdfac,ISO) as fecha_radicacion,
(select char(ad1.glofchrec ,ISO) 
from hosvital.adglosas ad1 
where m1.mpnfac = ad1.mpnfac and ad1.gloinddev='S'  and  ad1.glofchrec = (select max(glofchrec) from hosvital.adglosas x where x.mpnfac = ad1.mpnfac)
) as fecha_dev,
(select sum(mx.mccvlr)
from hosvital.movcxc mx 
where  mx.cntvig <= 2019 and h.hojnumobl  = mx.mccnumobl  and mx.empcod= '01' and  mx.mcdpto='001' and mx.doccod = 'DRC' and mx.mennit = h.mennit
) as valor_pagos_aplicados,

(select max(case  when ad1.glovlrtpen=0 then ad1.glovlrtsop else ad1.glovlrtpen end)
from hosvital.adglosas ad1 
where m1.mpnfac = ad1.mpnfac and -- ad1.gloinddev='S' 
  ad1.glofchrec = (select max(glofchrec) from hosvital.adglosas x where x.mpnfac = ad1.mpnfac)
) as valor_glosa_vigente,
(select max(case when  ad1.gloedo = '5' then 'SI'  when ad1.gloedo = '6' then 'SI'  when ad1.gloedo = '8' then 'SI'  when ad1.gloedo = '9' then 'SI'  when ad1.gloedo = '11' then 'SI'  when ad1.gloedo = '12' then 'SI'
	 when ad1.gloedo = '13' then 'SI'  ELSE  'NO' end)
from hosvital.adglosas ad1 
where m1.mpnfac = ad1.mpnfac and -- ad1.gloinddev='S'  
 ad1.glofchrec = (select max(glofchrec) from hosvital.adglosas x where x.mpnfac = ad1.mpnfac)
) as vglosa_respondida,
(h.hojtotdeb-h.hojtotcre)  as saldo_factura,
'NO',
0
from hosvital.maeate m1
inner  join hosvital.hojobl h on (h.empcod='01' and h.mcdpto='001' and  h.cntvig=2019 and (h.hojtotdeb-h.hojtotcre) >0 and rtrim(h.hojnumobl) = cast(m1.mpnfac as character(6)  ) and h.mennit=m1.mpmeni)

inner join hosvital.maeemp m2 on  (m1.mpmeni=m2.mennit)
inner join hosvital.admglo11 a on (a.mpnfac = m1.mpnfac)
where m1.matipdoc = '2' and m1.facfch >= '2019-01-04' and m1.facfch <= '2019-01-04' and m1.maestf not in ('1','10')    ;

--- acotado
------------------


select '2','1','NI',substring(m2.mecntr,1,9), m2.menomb,'NI','860007373','F','',m1.mpnfac,case when m1.facfch<='2018-12-31' then 'A' else 'I' end,m1.matotf,m1.facfch,a.aglfrdfac,(select ad1.glofchrec from hosvital.adglosas ad1 
where m1.mpnfac = ad1.mpnfac and ad1.gloinddev='S' and ad1.glofchrec = (select max(glofchrec) from hosvital.adglosas x where x.mpnfac = ad1.mpnfac)) as fecha_dev,(select sum(mx.mccvlr) from hosvital.movcxc mx 
where m1.mpnfac  = cast(mx.mccnumobl as integer) and mx.empcod= '01' and  mx.mcdpto='001' and mx.doccod = 'DRC' ) as valor_pagos_aplicados,(select ad1.glovlrtpen from hosvital.adglosas ad1 
where m1.mpnfac = ad1.mpnfac and ad1.gloinddev='S' and ad1.glofchrec = (select max(glofchrec) from hosvital.adglosas x where x.mpnfac = ad1.mpnfac)) as valor_glosa_vigente,
(select case when  ad1.gloedo = '5' then 'SI' when ad1.gloedo = '6' then 'SI' when ad1.gloedo = '8' then 'SI' when ad1.gloedo = '9' then 'SI' when ad1.gloedo = '11' then 'SI' when ad1.gloedo = '12' then 'SI' when ad1.gloedo = '13' then 'SI'
ELSE 'NO' end from hosvital.adglosas ad1 where m1.mpnfac = ad1.mpnfac and ad1.gloinddev='S' and ad1.glofchrec = (select max(glofchrec) from hosvital.adglosas x where x.mpnfac = ad1.mpnfac)) as vglosa_respondida,
m1.masalcxc as saldo_factura,'NO',0 from hosvital.maeate m1 inner join hosvital.hojobl h on (h.empcod='01' and h.mcdpto='001' and  h.cntvig=2019 and (h.hojtotdeb-h.hojtotcre) >0 and rtrim(h.hojnumobl) = cast(m1.mpnfac as character(6)  ) and  h.mennit=m1.mpmeni) inner join hosvital.maeemp m2 on (m1.mpmeni=m2.mennit) inner join hosvital.admglo11 a on (a.mpnfac = m1.mpnfac) where m1.matipdoc = '2' and m1.facfch >= '2019-01-01' and m1.facfch <= '2019-03-31' and m1.maestf  not in ('1','10') 