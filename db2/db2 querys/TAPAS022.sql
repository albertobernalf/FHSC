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


select * from hosvital.admglo11 limit 100;
select * from hosvital.cliente1;


select t.TRCAAE,h.clicod, t.trcrazsoc,
(
select sum(p.hojtotdeb - p.hojtotcre)
from hosvital.hojobl p
where p.cntvig=2019 and p.clicod=h.clicod   and   substring (p.cntcod,1,4) = '1301' 
) as SinRadicar,
(
select sum(p.hojtotdeb - p.hojtotcre)
from hosvital.hojobl p
where p.cntvig=2019 and p.clicod=h.clicod  and   substring (p.cntcod,1,4) in ('1302','1303','1399'  ) 
) as Radicados,

(
select  sum(p.hojtotdeb -  p.hojtotcre) as total
from hosvital.hojobl p, hosvital.admglo11 t
where p.clicod = h.clicod  and p.cntvig=2019 and  substring (p.cntcod,1,4) in ('1302','1303','1399' )  and date(p.HOJFCHRAD) = t.aglfrdfac   and t.mpnfac = cast(p.hojnumobl as integer)  and (p.hojtotdeb - p.hojtotcre )<> 0  and
(days(current_date)  - days(case when p.HOJFCHRAD  =  '0001-01-01 00:00:00.000000'  then (t.aglfrdfac   )
                  	     	         when p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  then (date(p.HOJFCHRAD) )  end)
)  <= 30
)
as treintadias,
(
select  sum(p.hojtotdeb -  p.hojtotcre) as total
from hosvital.hojobl p, hosvital.admglo11 t
where p.clicod = h.clicod  and p.cntvig=2019 and  substring (p.cntcod,1,4) in ('1302','1303','1399')  and date(p.HOJFCHRAD) = t.aglfrdfac  and t.mpnfac = cast(p.hojnumobl as integer)  and (p.hojtotdeb - p.hojtotcre )<> 0  and
(days(current_date)  - days(case when p.HOJFCHRAD  =  '0001-01-01 00:00:00.000000'  then (t.aglfrdfac   )
                  	     	         when p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  then (date(p.HOJFCHRAD) )  end)
)  between 31 and 60
)
as asesentadias,
(
select  sum(p.hojtotdeb -  p.hojtotcre) as total
from hosvital.hojobl p, hosvital.admglo11 t
where p.clicod = h.clicod  and p.cntvig=2019 and  substring (p.cntcod,1,4) in ('1302','1303','1399'  ) and date(p.HOJFCHRAD) = t.aglfrdfac   and  p.hojtotdeb <> p.hojtotcre and t.mpnfac = cast(p.hojnumobl as integer)  and (p.hojtotdeb - p.hojtotcre )<> 0  and
(days(current_date)  - days(case when p.HOJFCHRAD  =  '0001-01-01 00:00:00.000000'  then (t.aglfrdfac   )
                  	     	         when p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  then (date(p.HOJFCHRAD) )  end)
)  between 61 and 90
)
as anoventadias,

(
select  sum(p.hojtotdeb -  p.hojtotcre) as total
from hosvital.hojobl p, hosvital.admglo11 t
where p.clicod = h.clicod  and p.cntvig=2019 and  substring (p.cntcod,1,4) in ('1302','1303','1399'  )  and date(p.HOJFCHRAD) = t.aglfrdfac  and  p.hojtotdeb <> p.hojtotcre and t.mpnfac = cast(p.hojnumobl as integer)  and (p.hojtotdeb - p.hojtotcre )<> 0  and
(days(current_date)  - days(case when p.HOJFCHRAD  =  '0001-01-01 00:00:00.000000'  then (t.aglfrdfac   )
                  	     	         when p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  then (date(p.HOJFCHRAD) )  end)
)  between 91 and 120
)
as acientooveinte,
(
select  sum(p.hojtotdeb -  p.hojtotcre) as total
from hosvital.hojobl p, hosvital.admglo11 t
where p.clicod = h.clicod  and p.cntvig=2019 and  substring (p.cntcod,1,4) in ('1302','1303','1399'  )  and date(p.HOJFCHRAD) = t.aglfrdfac  and  p.hojtotdeb <> p.hojtotcre and t.mpnfac = cast(p.hojnumobl as integer)  and (p.hojtotdeb - p.hojtotcre )<> 0  and
(days(current_date)  - days(case when p.HOJFCHRAD  =  '0001-01-01 00:00:00.000000'  then (t.aglfrdfac   )
                  	     	         when p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  then (date(p.HOJFCHRAD) )  end)
)  between 121 and 180
)
as decientoventyunoaacientoochentadias,
(
select  sum(p.hojtotdeb -  p.hojtotcre) as total
from hosvital.hojobl p, hosvital.admglo11 t
where p.clicod = h.clicod  and p.cntvig=2019 and  substring (p.cntcod,1,4) in ('1302','1303','1399'  )  and date(p.HOJFCHRAD) = t.aglfrdfac  and  p.hojtotdeb <> p.hojtotcre and t.mpnfac = cast(p.hojnumobl as integer)  and (p.hojtotdeb - p.hojtotcre )<> 0  and
(days(current_date)  - days(case when p.HOJFCHRAD  =  '0001-01-01 00:00:00.000000'  then (t.aglfrdfac   )
                  	     	         when p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  then (date(p.HOJFCHRAD) )  end)
)  between 181 and 360
)
as atrescientossesentadias,
(
select  sum(p.hojtotdeb -  p.hojtotcre) as total
from hosvital.hojobl p, hosvital.admglo11 t
where p.clicod = h.clicod  and p.cntvig=2019 and  substring (p.cntcod,1,4)  in ('1302','1303','1399'  )  and date(p.HOJFCHRAD) = t.aglfrdfac and  p.hojtotdeb <> p.hojtotcre and t.mpnfac = cast(p.hojnumobl as integer)  and (p.hojtotdeb - p.hojtotcre )<> 0  and
(days(current_date)  - days(case when p.HOJFCHRAD  =  '0001-01-01 00:00:00.000000'  then (t.aglfrdfac   )
                  	     	         when p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  then (date(p.HOJFCHRAD) )  end)
) > 360
)
as masdetrescientossesentadias,
(
select  sum(p.hojtotdeb -  p.hojtotcre) as total
from hosvital.hojobl p, hosvital.admglo11 t
where p.clicod = h.clicod  and p.cntvig=2019 and  substring (p.cntcod,1,4)  in ('1302','1303','1399'  )   and date(p.HOJFCHRAD) = t.aglfrdfac and  p.hojtotdeb <> p.hojtotcre and t.mpnfac = cast(p.hojnumobl as integer)  and (p.hojtotdeb - p.hojtotcre )<> 0  and
(days(current_date)  - days(case when p.HOJFCHRAD  =  '0001-01-01 00:00:00.000000'  then (t.aglfrdfac   )
                  	     	         when p.HOJFCHRAD <> '0001-01-01 00:00:00.000000'  then (date(p.HOJFCHRAD) )  end)
) >= 0
)
as TotalCarteraPorEdades,
(
select  SUM(mvbvlr)
from hosvital.movban m
where h.clicod = m.trccod and m.doccod IN ('RNA')   and m.mcdpto = '001' and m.MVBDET IN ('R','N') and m.PRCTESCOD='R'  and m.mvbvlr <>0  AND m.MVBACT= 'R'
) as PagosPendientesXAplicarSINRegis,

(
select  SUM(m.mvbvlr) 
from hosvital.movban  m
where h.clicod = m.trccod  and m.doccod IN ('RNA')   and m.mcdpto = '001 'and m.MVBDET IN ('S') and m.PRCTESCOD='R'  and m.mvbvlr <>0  
) as PagosPendientesXAplicarRegis,

(
select sum(p.hojtotdeb - p.hojtotcre)
from hosvital.hojobl p
where p.cntvig=2019 and p.clicod=h.clicod   and   substring (p.cntcod,1,4) = '1399'   
) as Provisionado,
(
select sum(a.glovlrtglo)
from hosvital.adglosas a
inner join  hosvital.maeate b on (b.mpnfac = a.mpnfac)
inner join hosvital.maeemp m on (m.mennit =b.mpmeni)
inner join hosvital.terceros t1  on ( t1.trccod = substr(m.mecntr,1,9) )
inner join hosvital.hojobl h3 on (h3.cntvig = 2019 and h3.empcod='01' and h3.clicod = substr(m.mecntr,1,9) and cast(h3.hojnumobl as integer) = cast(a.mpnfac as integer) )
where t1.trccod = h.clicod 
) as totalglosas,
(select sum(m.matotf)
from hosvital.admglo01 a 
INNER JOIN hosvital.admglo11 b  ON ( b.aglremnr = a.aglremnr)
INNER JOIN  hosvital.terceros t1 ON ( t1.trcnit = a.emprnit )
INNER JOIN  hosvital.maeate m ON (m.mpnfac = b.mpnfac and m.maestf not in (1,10))
inner join hosvital.hojobl h3 on (h3.cntvig = 2019 and h3.empcod='01' and h3.clicod =t1.trccod and cast(h3.hojnumobl as integer) = cast(m.mpnfac as integer) )
where  h3.clicod = h.clicod   AND a.AGLRADFC = '0001-01-01'

) as remisionesNoRadicadas
from hosvital.hojobl h
inner join  hosvital.terceros t on ( t.trccod = h.clicod)
where h.cntvig=2019  and t.TRCAAE  like ('%GR%') AND
      HOJFCHRAD <='2019-03-31 23:59:59'
  -- and t.trccod in ('900298372','830003564','900156264')
group by  t.TRCAAE,h.clicod,t.trcrazsoc
order by t.TRCAAE,t.trcrazsoc;


SELECT * FROM HOSVITAL.HOJOBL LIMIT 100;

