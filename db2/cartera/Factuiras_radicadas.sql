select * from hosvital.maeate where facfch >= '2019-01-01'  and mpmeni='90' ORDER BY FACFCH;
select SUM(MATOTF) from hosvital.maeate where facfch >= '2019-01-01'  and mpmeni='90' ;   --ORDER BY FACFCH;
--    150530235
--    151684271



select * from hosvital.admglo01 WHERE aglremnr =  22407	;
 ;

select * from hosvital.admglo11;
select count(*) from hosvital.maeate where facfch >= '2019-01-01'  and mpmeni='90' ;   --ORDER BY FACFCH;  --1148


select  m.MPNFAC, m.MAESTF, facfch as fech_factura, aglfrdfac as fecha_radicacion, adm.aglremnr
 from hosvital.maeate  m, hosvital.admglo11 adm
where m.facfch >= '2019-01-01'  and m.maestf not in ('0','10') and mpmeni='90'  and
   m.mpnfac = adm.mpnfac
order by m.mpnfac