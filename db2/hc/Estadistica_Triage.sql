select * from hosvital.hccom1 where hisfhorat>='2019-10-01 00:00:00';

select current_date, current_time, hisfhorat, day(hisfhorat), hour(hisfhorat), minute(hisfhorat) from hosvital.hccom1 where hisfhorat>='2019-10-15 00:00:00';


select h.histipdoc,h.hisckey,h.hiscsec,,h.FHCINDESP,h.hiscltr,h.hisfhorat as fecha_triage,
(select h1.hisfhorat
 from hosvital.hccom1 h1
 where h1.histipdoc= h.histipdoc and h1.hisckey=h.hisckey and h1.hctvin1 = h.hctvin1 and h1.hisfhorat  = (select min(h2.hisfhorat) from hosvital.hccom1 h2 where h2.histipdoc= h1.histipdoc and h2.hisckey=h1.hisckey and h2.hctvin1 = h1.hctvin1 								and h2.FHCINDESP='GN')
) as fecha_atencion,

(select ((day(h1.hisfhorat)  * 1140 +  hour(h1.hisfhorat) * 60 + minute(h1.hisfhorat))        -   ( day(h.hisfhorat) * 1140 + hour(h.hisfhorat) * 60 + minute(h.hisfhorat)   ) )
 from hosvital.hccom1 h1
 where h1.histipdoc= h.histipdoc and h1.hisckey=h.hisckey and h1.hctvin1 = h.hctvin1 and h1.hisfhorat  = (select min(h2.hisfhorat) from hosvital.hccom1 h2 where h2.histipdoc= h1.histipdoc and h2.hisckey=h1.hisckey and h2.hctvin1 = h1.hctvin1 							and h2.FHCINDESP='GN'))  as Minutos
from hosvital.hccom1  h
where h. hisfhorat>='2019-10-01 00:00:00' and h. hisfhorat<='2019-10-31 00:00:00' and h.FHCINDESP ='TR'
order by h.hisfhorat;

-- veamos a ver asi podemos sacar elpromedio

-------------------------
-------------------------

select distinct  h.hiscltr,
sum((select SUM(       (day(h111.hisfhorat)  * 1140 +  hour(h111.hisfhorat) * 60 + minute(h111.hisfhorat)) +  ( - day(h1.hisfhorat) * 1140 -  hour(h1.hisfhorat) * 60  -  minute(h1.hisfhorat))   ) 
 from hosvital.hccom1 h1
          INNER join hosvital.hccom1 h111 on (h111.histipdoc= h1.histipdoc and h111.hisckey =h1.hisckey and h111.hctvin1=h1.hctvin1  )
           where h1. hisfhorat>='2019-10-01 00:00:00' and h1. hisfhorat<='2019-10-31 00:00:00' and h1.FHCINDESP ='TR'  and h1.FHCINDESP=h.FHCINDESP  and  h1.hiscltr = h.hiscltr and  h111.FHCINDESP ='GN' AND
            h111.hisfhorat  = (select min(h2.hisfhorat) from hosvital.hccom1 h2 where h2.histipdoc= h111.histipdoc and h2.hisckey=h111.hisckey and h2.hctvin1 = h111.hctvin1 							and h2.FHCINDESP='GN' AND H2.FHCINDESP= H111.FHCINDESP)))  as Minutos,  count(*) total,
sum((select sum( ((day(h111.hisfhorat)  * 1140 +  hour(h111.hisfhorat) * 60 + minute(h111.hisfhorat))        -   ( day(h1.hisfhorat) * 1140 + hour(h1.hisfhorat) * 60 + minute(h1.hisfhorat)   ) ))
 from hosvital.hccom1 h1
          INNER join hosvital.hccom1 h111 on (h111.histipdoc= h1.histipdoc and h111.hisckey =h1.hisckey and h111.hctvin1=h1.hctvin1  )
           where h1. hisfhorat>='2019-10-01 00:00:00' and h1. hisfhorat<='2019-10-31 00:00:00' and h1.FHCINDESP ='TR' and  h1.hiscltr = h.hiscltr and
            h111.hisfhorat  = (select min(h2.hisfhorat) from hosvital.hccom1 h2 where h2.histipdoc= h1.histipdoc and h2.hisckey=h1.hisckey and h2.hctvin1 = h1.hctvin1 							and h2.FHCINDESP='GN')))/count(*) Promedio
from hosvital.hccom1  h
where h. hisfhorat>='2019-10-01 00:00:00' and h. hisfhorat<='2019-10-31 00:00:00' and h.FHCINDESP ='TR' and h.hisckey='41617119'
group by h.hiscltr,2
order by h.hiscltr;


select   hiscltr, COUNT(*)
 From hosvital.hccom1 where hisfhorat>='2019-10-01 00:00:00' and FHCINDESP ='TR'
GROUP BY  hiscltr ;


select hisckey,hctvin1,hisfhorat,HISCLTR from hosvital.hccom1 where hisfhorat>='2019-10-01 00:00:00' and hiscltr = 1 and FHCINDESP ='TR' and hisckey='41617119';  -- 2019-10-04 13:49:44.000000	
select hisckey,hctvin1,hisfhorat,HISCLTR from hosvital.hccom1 where hisfhorat>='2019-10-01 00:00:00'  and FHCINDESP ='GN' and hisckey='41617119';  -- 2019-10-04 14:06:47.000000	


select SUM(       (day(h111.hisfhorat)  * 1140 +  hour(h111.hisfhorat) * 60 + minute(h111.hisfhorat)) +  ( - day(h1.hisfhorat) * 1140 -  hour(h1.hisfhorat) * 60  -  minute(h1.hisfhorat))   ) 
 from hosvital.hccom1 h1
          INNER join hosvital.hccom1 h111 on (h111.histipdoc= h1.histipdoc and h111.hisckey =h1.hisckey and h111.hctvin1=h1.hctvin1  )
           where h1. hisfhorat>='2019-10-01 00:00:00' and h1. hisfhorat<='2019-10-31 00:00:00' and h1.FHCINDESP ='TR'  and  h111.FHCINDESP ='GN' AND h1.hisckey= '41617119'   and
            h111.hisfhorat  = (select min(h2.hisfhorat) from hosvital.hccom1 h2 where h2.histipdoc= h111.histipdoc and h2.hisckey=h111.hisckey and h2.hctvin1 = h111.hctvin1 							and h2.FHCINDESP='GN' AND H2.FHCINDESP= H111.FHCINDESP)

