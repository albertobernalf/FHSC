select * from hosvital.ingresos;

-- 1a Consulta

select c.mptdoc as tipo_doc,c.mpcedu as doc, c.mpnomc as nombre ,m1.menomb as empresa,i.ingfecadm as ingreso,i.ingfecegr as egreso,m.mpnfac as factura,m.facfch as fecha_factura,
 m.matotf as total_factura, a1.aglremfc as fecha_remision,a1.aglremnr as remision_no, a1.aglradfc as fecha_radicacion
from hosvital.capbas c inner join hosvital.ingresos i on (c.mptdoc=i.mptdoc and c.mpcedu=i.mpcedu)
 inner join hosvital.maeate m on (m.matipdoc='2' and m.mptdoc = i.mptdoc and m.mpcedu = i.mpcedu and m.mactving = i.ingcsc)
 inner join hosvital.maeemp m1 on (m1.mennit=m.mpmeni)
 left join hosvital.admglo11 a on (a.mpnfac=m.mpnfac and a.aglfacdev<>'S')
 left  join hosvital.admglo01 a1 on (a1.aglremnr=a.aglremnr) 
where i.ingfecegr>='2019-06-01 00:00:00' and i.ingfecegr <= '2019-06-30 23:59:59'
order by  m.facfch;

-- 2a Consulta totales radicados

select * from hosvital.admglo11;
select * from hosvital.admglo01 where aglremnr=23397 ;
select * from hosvital.admglo11 where aglremnr=23397 ;


-- Este va siendo el Query

select  a.aglremnr as remision , e.empdsc as empresa,
(select sum(m.matotf - m.mavapu) as valor from hosvital.maeate m, hosvital.admglo11 ad where ad.aglremnr=a.aglremnr and m.matipdoc='2' and ad.mpnfac=m.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D') as valor_radicado, 
b.mpnfac as factura, b.facfch as fecha_factura ,mae.menomb as contrato, (b.matotf - b.mavapu) as total_factura, b.mavapu as abono
from  hosvital.maeate b
left join hosvital.admglo11 a on (b.mpnfac = a.mpnfac  and a.aglfacdev <> 'D' )
left join  hosvital.admglo01 c on (c.aglremnr = a.aglremnr)
left join hosvital.empress e on (e.mecntr=c.emprnit)
inner join hosvital.maeemp mae on (mae.mennit=b.mpmeni)
where b.matipdoc='2' and b.facfch >='2019-06-01' and  b.facfch <='2019-06-30'  and b.maestf  not in ('1','10')  and a.aglremnr=23403
group by a.aglremnr,e.empdsc , b.mpnfac,b.facfch,mae.menomb,(b.matotf - b.mavapu) ,b.mavapu
order by  a.aglremnr ;



select * from hosvital.admglo11 a , hosvital.maeate m
where aglremnr=22962 and a.mpnfac = m.mpnfac ;

select * from hosvital.maeemp;


select * from hosvital.admglo01 where aglremnr=22962;
select * from hosvital.maeemp where mecntr='800251440-6';
select * from hosvital.admglo11 where aglremnr=23053;
select * from hosvital.maeate where mpnfac in ('576164',	
'576213'	,
'579356'	,
'580040'	,
'581040'	
);

select * from hosvital.empress  where mecntr='800251440-6';

select a.aglremnr as remision,e.empdsc as empresa,(select sum(m.matotf-m.mavapu) as valor from hosvital.maeate m, hosvital.admglo11 ad where ad.aglremnr=a.aglremnr and m.matipdoc='2' and ad.mpnfac=m.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev<>'D') as valor_radicado,b.mpnfac as factura, b.facfch as fecha_factura ,mae.menomb as contrato,(b.matotf-b.mavapu) as total_factura,b.mavapu as abono from hosvital.maeate b left join hosvital.admglo11 a on (b.mpnfac=a.mpnfac and a.aglfacdev<>'D') left join hosvital.admglo01 c on (c.aglremnr=a.aglremnr) left join hosvital.empress e on (e.mecntr=c.emprnit) inner join hosvital.maeemp mae on (mae.mennit=b.mpmeni) where b.matipdoc='2' and b.facfch>='2019-06-01' and b.facfch<='2019-06-30' and b.maestf not in ('1','10')  group by a.aglremnr,e.empdsc,b.mpnfac,b.facfch,mae.menomb,(b.matotf - b.mavapu) ,b.mavapu order by a.aglremnr;

-- Segunda consulta de Jefe Adriana
select * from hosvital.empress;
select * from hosvital.maeemp;
select * from hosvital.maeate;
select * from hosvital.admglo11;

select   e.empdsc as empresa,mae.menomb as contrato,
(select sum(m.matotf ) as valor 
from hosvital.maeate m 
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 1 and m.mpmeni=mae.mennit
) as facturado_Enero,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad 
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 1 and m.mpmeni=mae.mennit
) as radicado_Enero,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 1 and m.mpmeni=mae.mennit and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) > 1))
) as Pendiente_x_radicar_Enero,
(select sum(m.matotf ) as valor 
from hosvital.maeate m 
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 2 and m.mpmeni=mae.mennit
) as facturado_Febrero,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad 
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 2 and m.mpmeni=mae.mennit
) as radicado_Febrero,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 2 and m.mpmeni=mae.mennit and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) > 2))
) as Pendiente_x_radicar_Febrero,
(select sum(m.matotf ) as valor 
from hosvital.maeate m 
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 3 and m.mpmeni=mae.mennit
) as facturado_Marzo,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad 
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) =3 and m.mpmeni=mae.mennit
) as radicado_Marzo,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 3 and m.mpmeni=mae.mennit and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) >3))
) as Pendiente_x_radicar_Marzo,
(select sum(m.matotf ) as valor 
from hosvital.maeate m 
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 4 and m.mpmeni=mae.mennit
) as facturado_Abril,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad 
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 4 and m.mpmeni=mae.mennit
) as radicado_Abril,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 4 and m.mpmeni=mae.mennit and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) > 4))
) as Pendiente_x_radicar_Abril,
(select sum(m.matotf ) as valor 
from hosvital.maeate m 
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 5 and m.mpmeni=mae.mennit
) as facturado_Mayo,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad 
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 5 and m.mpmeni=mae.mennit
) as radicado_Mayo,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 5 and m.mpmeni=mae.mennit and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) > 5))
) as Pendiente_x_radicar_Mayo,
(select sum(m.matotf ) as valor 
from hosvital.maeate m 
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 6 and m.mpmeni=mae.mennit
) as facturado_Junio,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad 
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 6 and m.mpmeni=mae.mennit
) as radicado_Junio,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 6 and m.mpmeni=mae.mennit and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) > 6))
) as Pendiente_x_radicar_Junio,
(select sum(m.matotf ) as valor 
from hosvital.maeate m 
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) =7 and m.mpmeni=mae.mennit
) as facturado_Julio,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad 
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 7 and m.mpmeni=mae.mennit
) as radicado_Julio,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 7 and m.mpmeni=mae.mennit and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) > 7))
) as Pendiente_x_radicar_Julio,
(select sum(m.matotf ) as valor 
from hosvital.maeate m 
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 8 and m.mpmeni=mae.mennit
) as facturado_Agosto,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad 
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 8 and m.mpmeni=mae.mennit
) as radicado_Agosto,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 8 and m.mpmeni=mae.mennit and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) > 8))
) as Pendiente_x_radicar_Agosto,
(select sum(m.matotf ) as valor 
from hosvital.maeate m 
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 9 and m.mpmeni=mae.mennit
) as facturado_septiembre,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad 
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) =9 and m.mpmeni=mae.mennit
) as radicado_Septiembre,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 9 and m.mpmeni=mae.mennit and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) >9))
) as Pendiente_x_radicar_Septiembre,
(select sum(m.matotf ) as valor 
from hosvital.maeate m 
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 10 and m.mpmeni=mae.mennit
) as facturado_Octubrel,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad 
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 10 and m.mpmeni=mae.mennit
) as radicado_Octubre,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 10 and m.mpmeni=mae.mennit and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) > 10))
) as Pendiente_x_radicar_Octubre,
(select sum(m.matotf) as valor 
from hosvital.maeate m 
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 11 and m.mpmeni=mae.mennit
) as facturado_Noviembre,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad 
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 11 and m.mpmeni=mae.mennit
) as radicado_Noviembre,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 11 and m.mpmeni=mae.mennit and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) > 11))
) as Pendiente_x_radicar_Noviembre,
(select sum(m.matotf ) as valor 
from hosvital.maeate m 
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 12 and m.mpmeni=mae.mennit
) as facturado_Diciembre,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad 
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 12 and m.mpmeni=mae.mennit
) as radicado_Diciembre,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 12 and m.mpmeni=mae.mennit and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2020 and month(x.aglfrdfac) >= 1))
) as Pendiente_x_radicar_Diciembre,


(select sum(m.matotf ) as valor 
from hosvital.maeate m 
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019  and m.mpmeni=mae.mennit and
 month(m.facfch)<= (select  (max(month(x.facfch)) - 1) from hosvital.maeate x where year(x.facfch)=2019)
) as facturado_Total,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad 
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac) = 2019  and m.mpmeni=mae.mennit and
 month(ad.aglfrdfac) <= (select  (max(month(x.facfch)) - 1) from hosvital.maeate x where year(x.facfch)=2019)
) as radicado_Total,

(select sum(m.matotf )/6  as valor 
from hosvital.maeate m 
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019  and m.mpmeni=mae.mennit and
 month(m.facfch)<= (select  (max(month(x.facfch)) - 1) from hosvital.maeate x where year(x.facfch)=2019)
) as facturado_promedio,
(select sum(m.matotf - m.mavapu)/6 as valor 
from hosvital.maeate m, hosvital.admglo11 ad 
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac) = 2019  and m.mpmeni=mae.mennit and
month(ad.aglfrdfac) <= (select  (max(month(x.facfch)) - 1) from hosvital.maeate x where year(x.facfch)=2019)
) as radicado_Promedio
from  hosvital.maeemp mae
inner join hosvital.empress e on (e.mecntr  = mae.mecntr)
order by e.empdsc, mae.menomb








