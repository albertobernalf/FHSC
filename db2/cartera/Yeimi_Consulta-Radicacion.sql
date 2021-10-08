select m.mpnfac as factura,m.facfch as fecha,
(select max(adm11.aglfrdfac)
from hosvital.admglo11 adm11 
inner join hosvital.admglo01 adm01 on (adm01.aglremnr=adm11.aglremnr)
where adm11.mpnfac = m.mpnfac  --   and adm11.aglfacdev <> 'D'
) as fecha_radicacion,
mae.menomb as contrato, m.matotf as total, m.mavals as subsidiadio,
(select sum (mov.mccvlr ) from hosvital.movcxc mov where  mov.mccnumobl=cast(m.mpnfac as varchar(6)) and mov.doccod in ('DRC') and mov.mccnat='C') as Pagos_Aplicados,
(select sum(mov.mccvlr) from hosvital.movcxc mov where mov.mccnumobl=cast(m.mpnfac as varchar(6)) and mov.doccod in ('AC','ACF', 'NC','NCF', 'NCP', 'NCR','NGR') and mov.mccnat='C') as Notas_Credito,
 (m.mavals-(select ifnull(sum(mov.mccvlr ),0) from hosvital.movcxc mov where mov.mccnumobl=cast(m.mpnfac as varchar(6)) and mov.doccod in ('DRC') and mov.mccnat='C' )-(select ifnull(sum(mov.mccvlr ),0) from hosvital.movcxc mov where  mov.mccnumobl=cast(m.mpnfac as varchar (6)) and mov.doccod in ('AC','ACF', 'NC','NCF', 'NCP', 'NCR','NGR') and mov.mccnat='C')) as Saldo
 from hosvital.maeate m inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni and substring(mae.mecntr,1,9)='900156264') 
where m.matipdoc='2' and m.facfch>='2014-12-01' and m.facfch<='2019-09-23'   -- and m.mpnfac = 307255 
and m.maestf not in ('1','10') order by m.facfch;

select * from hosvital.maeemp where menomb like('%NUEVA%');

SELECT * FROM HOSVITAL.ADMGLO11 where mpnfac =307255 ;
SELECT * FROM HOSVITAL.ADMGLO01;