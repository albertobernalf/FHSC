/*
Buenos dias, solicito de su amable colaboración con la generación de un informe con las siguientes características:

Del usuario:jperez solamente del mes de mayo de 2021 de los módulos de cuentas por cobrar, cuentas por pagar, tesorería y contabilidad de las empresas FHSC, FAN Y CSC de Hosvital financiero así:

fecha-documento-número de documento-valor transacción.


*/
SELECT DISTINCT MVCUSUCRE  FROM hosvital.movcont3 ORDER BY MVCUSUCRE;
SELECT DISTINCT TRANAPL  FROM hosvital.movcont3 ORDER BY TRANAPL;

select * from hosvital.movcont3 where mvcfch >= '2021-05-01 00:00:00' AND mvcfch <= '2021-05-31 23:59:59'  and MVCUSUCRE='JULYPER' AND TRANAPL IN('TESORERIA','CXC','CXP','CONTABILIDAD') ;
select * from hosvital.movcont2;

select m3.empcod as empresa,m3.doccod as tipo_doc,m3.mvcnro as documento ,m3.mvcfch as fecha,m2.cntcod as cuenta,m2.mvcnat as tipo,m2.mvcdet as detalle,m2.mvcvlr as valor
from hosvital.movcont3 m3
inner join hosvital.movcont2 m2 on (m2.empcod=m3.empcod and m2.doccod=m3.doccod and m2.mvcnro=m3.mvcnro)
where m3.mvcfch >= '2021-05-01 00:00:00' AND m3.mvcfch <= '2021-05-31 23:59:59'  and m3.MVCUSUCRE='JULYPER' AND m3.TRANAPL IN('TESORERIA','CXC','CXP','CONTABILIDAD')
order by m3.empcod,m3.doccod,m3.mvcnro , m2. mvccsc;


select m3.empcod as empresa,m3.doccod as tipo_doc,m3.mvcnro as documento ,m3.mvcfch as fecha,M2.TRCCOD,m2.cntcod as cuenta,m2.mvcnat as tipo,m2.mvcdet as detalle,m2.mvcvlr as valor
from hosvital.movcont3 m3
inner join hosvital.movcont2 m2 on (m2.empcod=m3.empcod and m2.doccod=m3.doccod and m2.mvcnro=m3.mvcnro)
where m3.mvcfch >= '2021-05-01 00:00:00' AND m3.mvcfch <= '2021-05-30 23:59:59'  and m3.MVCUSUCRE='JULYPER' AND m3.TRANAPL IN('TESORERIA','CXC','CXP','CONTABILIDAD') --and m2.mvcdet like ('%DESPI%JUSTA%CAUSA%')
order by m3.empcod,m3.doccod,m3.mvcnro , m2. mvccsc;


