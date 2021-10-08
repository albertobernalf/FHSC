/*
Buenas tardes, solicito de manera atenta el movimiento en excel  de la cuenta 15 
PROPIEDADES, PLANTA Y EQUIPO
Durante el año 2020 así:

cuenta- nombre cuenta - nit-tercero-fecha-concepto- valor -

Muchas gracias.
*/

select * from hosvital.movcont2;
select * from hosvital.cuentas;



select m2.doccod documento , m2.mvcnro umero,m2.cntcod cuenta,cta.cntdsc as descripcion,m2.trccod cod_tercero, ter.trcrazsoc tercero,m2.mvccfch fecha,m2.mvcdet detalle, m2.mvcvlr
from hosvital.movcont2 m2
inner join hosvital.terceros ter on (ter.trccod= m2.trccod)
inner join hosvital.cuentas cta on (cta.empcod=m2.empcod and cta.cntcod=m2.cntcod  and cta.cntvig = m2.cntvig)
where m2.empcod='01' and  year(m2.mvccfch) = 2020 and substring(m2.cntcod,1,2)='15'
order by m2.mvcmes;