/*

Fecha de documento
Tipo de documento
Descripción de documento
Valor de documento
Usuario creador de documento
 
*/

select * from hosvital.movcont2;
select * from hosvital.movcont3;


select x.mvcfch fecha_documento, doccod tipo_doc ,mvcnro numero, mvccpt detalle ,mvcusucre usuario ,
(select sum(y.mvcvlr) from hosvital.movcont2 y where y.doccod= x.doccod and y.mvcnro=x.mvcnro and y.mvcnat = 'C') total
 from hosvital.movcont3 x
where x.empcod='01' and x.mvcfch >= '2020-01-01 00:00:00' and  x.mvcfch <='2020-12-31 23:59:59'
order by month(x.mvcfch), day(x.mvcfch);



