select * from hosvital.hccom5;
select * from hosvital.hccom51;


-- Nombres y apellidos
--          Tipo de documento
--          Numero de documento
--          Fecha de nacimiento
--          Sexo
--          Etnia
--          Ocupación
--          Escolaridad
--          EPS
--          Fecha de ingreso
--          CUPS de laboratorio con la descripción
--          Fecha de orden
--          Fecha de realización


select * from hosvital.hccom51;
select * from hosvital.capbas;
select * from hosvital.tipproc;

select i.mptdoc tipodoc,i.mpcedu documento ,c.mpnomc nombres,c.mpfchn nacimiento ,c.mpsexo genero,et.MPDscEt etnia,n.NivEdDsc  as nivel_educativo, oc.MODesc ocupacion, 
mae.menomb as eps,date(i.ingfecadm) ingreso , h51.hcprccod cups , maepro.prnomb laboratorio,date(h51.hcfchrord) as fecha_orden, date(h51.hcfchrap) as fecha_aplicacion
from hosvital.ingresos i
inner join hosvital.capbas c on (c.mptdoc=i.mptdoc and c.mpcedu=i.mpcedu)
inner join hosvital.hccom51 h51 on (h51.histipdoc=c.mptdoc and h51.hisckey=c.mpcedu and h51.hctvin51 = i.ingcsc)
inner join hosvital.maeemp mae on (mae.mennit=i.ingnit)
inner join hosvital.maepro maepro on (maepro.prcodi = h51.hcprccod)
inner join hosvital.nivedu n on (n.nivedco = c.MPNivEdu)
inner join hosvital.MAEOCU oc on (oc.MOCodi=c.MOCodPri)
inner join hosvital.etnias et on (et.MPCodEt=c.MPCodEtn)
where i.ingfecadm >= '2020-08-01 00:00:00' and h51.hcprctpop=2
order by date(h51.hcfchrord),c.mpcedu,maepro.prcodi;