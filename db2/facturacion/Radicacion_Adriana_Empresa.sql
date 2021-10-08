
select   e.empdsc as empresa,
(select sum(m.matotf )  as valor
from hosvital.maeate m , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 1 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr  
) as facturado_Enero,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad  , hosvital.maeemp mae
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 1 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as radicado_Enero,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 1 and m.mpmeni=mae.mennit and    mae.mecntr = e.mecntr and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) > 1))
) as Pendiente_x_radicar_Enero,
(select sum(m.matotf ) as valor 
from hosvital.maeate m  , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 2 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as facturado_Febrero,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad  , hosvital.maeemp mae
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 2 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as radicado_Febrero,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 2 and m.mpmeni=mae.mennit and    mae.mecntr = e.mecntr and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) > 2))
) as Pendiente_x_radicar_Febrero,
(select sum(m.matotf ) as valor 
from hosvital.maeate m  , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 3 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as facturado_Marzo,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad  , hosvital.maeemp mae
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) =3 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as radicado_Marzo,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 3 and m.mpmeni=mae.mennit and    mae.mecntr = e.mecntr  and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) >3))
) as Pendiente_x_radicar_Marzo,
(select sum(m.matotf ) as valor 
from hosvital.maeate m  , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 4 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as facturado_Abril,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad  , hosvital.maeemp mae
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 4 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as radicado_Abril,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 4 and m.mpmeni=mae.mennit and    mae.mecntr = e.mecntr  and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) > 4))
) as Pendiente_x_radicar_Abril,
(select sum(m.matotf ) as valor 
from hosvital.maeate m  , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 5 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as facturado_Mayo,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad  , hosvital.maeemp mae
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 5 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as radicado_Mayo,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 5 and m.mpmeni=mae.mennit and    mae.mecntr = e.mecntr  and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) > 5))
) as Pendiente_x_radicar_Mayo,
(select sum(m.matotf ) as valor 
from hosvital.maeate m  , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 6 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as facturado_Junio,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad  , hosvital.maeemp mae 
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 6 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as radicado_Junio,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 6 and m.mpmeni=mae.mennit and    mae.mecntr = e.mecntr  and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) > 6))
) as Pendiente_x_radicar_Junio,
(select sum(m.matotf ) as valor 
from hosvital.maeate m  , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) =7 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as facturado_Julio,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad  , hosvital.maeemp mae
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 7 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as radicado_Julio,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 7 and m.mpmeni=mae.mennit and    mae.mecntr = e.mecntr  and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) > 7))
) as Pendiente_x_radicar_Julio,
(select sum(m.matotf ) as valor 
from hosvital.maeate m  , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 8 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as facturado_Agosto,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad  , hosvital.maeemp mae
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 8 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as radicado_Agosto,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 8 and m.mpmeni=mae.mennit and    mae.mecntr = e.mecntr  and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) > 8))
) as Pendiente_x_radicar_Agosto,
(select sum(m.matotf ) as valor 
from hosvital.maeate m  , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 9 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as facturado_septiembre,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad  , hosvital.maeemp mae
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) =9 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as radicado_Septiembre,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 9 and m.mpmeni=mae.mennit and    mae.mecntr = e.mecntr  and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) >9))
) as Pendiente_x_radicar_Septiembre,
(select sum(m.matotf ) as valor 
from hosvital.maeate m  , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 10 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as facturado_Octubrel,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad  , hosvital.maeemp mae
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 10 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as radicado_Octubre,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 10 and m.mpmeni=mae.mennit and    mae.mecntr = e.mecntr  and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) > 10))
) as Pendiente_x_radicar_Octubre,
(select sum(m.matotf) as valor 
from hosvital.maeate m  , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 11 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as facturado_Noviembre,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad  , hosvital.maeemp mae
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 11 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as radicado_Noviembre,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 11 and m.mpmeni=mae.mennit and    mae.mecntr = e.mecntr  and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2019 and month(x.aglfrdfac) > 11))
) as Pendiente_x_radicar_Noviembre,
(select sum(m.matotf ) as valor 
from hosvital.maeate m  , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019 and month(m.facfch) = 12 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as facturado_Diciembre,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad  , hosvital.maeemp mae
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac)= 2019 and month(ad.aglfrdfac) = 12 and m.mpmeni=mae.mennit  and  mae.mecntr = e.mecntr 
) as radicado_Diciembre,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10') and year(m.facfch)= 2019 and month(m.facfch) = 12 and m.mpmeni=mae.mennit and    mae.mecntr = e.mecntr  and
       ( m.mpnfac not in (select x.mpnfac from hosvital.admglo11 x)  or 
        m.mpnfac in (select x.mpnfac from hosvital.admglo11 x where year(x.aglfrdfac)= 2020 and month(x.aglfrdfac) >= 1))
) as Pendiente_x_radicar_Diciembre,


(select sum(m.matotf ) as valor 
from hosvital.maeate m  , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019  and m.mpmeni=mae.mennit and    mae.mecntr = e.mecntr  and
 month(m.facfch)<= (select  (max(month(x.facfch)) - 1) from hosvital.maeate x where year(x.facfch)=2019)
) as facturado_Total,
(select sum(m.matotf - m.mavapu) as valor 
from hosvital.maeate m, hosvital.admglo11 ad  , hosvital.maeemp mae
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac) = 2019  and m.mpmeni=mae.mennit   and  mae.mecntr = e.mecntr  and
 month(ad.aglfrdfac) <= (select  (max(month(x.facfch)) - 1) from hosvital.maeate x where year(x.facfch)=2019)
) as radicado_Total,

(select sum(m.matotf )/6  as valor 
from hosvital.maeate m  , hosvital.maeemp mae
where m.matipdoc='2' and m.maestf not in ('1','10')  and year(m.facfch) = 2019  and m.mpmeni=mae.mennit and    mae.mecntr = e.mecntr  and
 month(m.facfch)<= (select  (max(month(x.facfch)) - 1) from hosvital.maeate x where year(x.facfch)=2019)
) as facturado_promedio,
(select sum(m.matotf - m.mavapu)/6 as valor 
from hosvital.maeate m, hosvital.admglo11 ad  , hosvital.maeemp mae
where m.matipdoc='2' and m.mpnfac=ad.mpnfac and m.maestf not in ('1','10') and ad.aglfacdev <> 'D' and year(ad.aglfrdfac) = 2019  and m.mpmeni=mae.mennit and   mae.mecntr = e.mecntr  and
month(ad.aglfrdfac) <= (select  (max(month(x.facfch)) - 1) from hosvital.maeate x where year(x.facfch)=2019)
) as radicado_Promedio
from  hosvital.empress e 
order by  e.empdsc