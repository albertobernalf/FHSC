/*
Por medio de la presente, solicito amablemente su colaboración para generar un informe por Hosvital Report, En el que se detalle la siguiente información de Devoluciones de productos Farmacéuticos:

1 Fecha  y hora de la devolución por el personal asistencial.
2 Código y producto a devolver
3 Usuario de la persona asistencial  que realiza la devolución

4 Fecha y hora en la que en farmacia le confirman la devolución
5 Usuario de la persona de farmacia que realiza la devolución 

*/
select * from hosvital.frmsmns1;
select * from hosvital.frmsmns;
select * from hosvital.dspfrmc1 where hisckey='21107098' and hiscsec = 2548;
select * from hosvital.hccom1;
select * from hosvital.maemed1;


SELECT  A.HISTIPDOC AS Tipo_Doc, A.HISCKEY Documento,A.HISCSEC Folio,
A.FSMMSRESO as Cod_Producto ,h.hisfhorat as fecha_asistencial_dev,mae1.mmnomm nombre_asistencial,
c1.dsmfhrmov as fecha_movimiento_dev, c1.dsmusrmov as usu_dev,C.DSmCntDev q_DEVUELTA,c1.dsmtpotRn
from  hosvital.hccom1 h
inner join HOSVITAL.FRMSMNS A on (a.histipdoc = h.histipdoc and a.hisckey=h.hisckey and a.hiscsec=h.hiscsec)
inner join  HOSVITAL.DSPFRMC C ON (C.HISTIPDOC=A.HISTIPDOC AND C.HISCKEY=A.HISCKEY AND C.HISCSEC= A.HISCSEC AND  C.MSRESO = A.FSMMSRESO)
left join hosvital.dspfrmc1 c1  ON (C1.HISTIPDOC=A.HISTIPDOC  AND  C1.HISCKEY=A.HISCKEY AND C1.HISCSEC=A.HISCSEC AND C1.MSRESO = A.FSMMSRESO)
inner join hosvital.maemed1 mae1 on (mae1.mmcodm=h.hiscmmed)
WHERE A.FSMMSRESO= '0280J01C' AND A.HISCKEY  = '21107098' AND A.FSMFHRREG >= '2019-04-13 00:00:00'  and c1.dsmtpotrn='DV'
ORDER BY A.FSMFHRREG ;



SELECT  A.HISTIPDOC AS Tipo_Doc, A.HISCKEY Documento,A.HISCSEC Folio,
A.FSMMSRESO as Cod_Producto ,maesum1.msnomg as medicamento,h.hisfhorat as fecha_asistencial_dev, A.  FSMCNTSOL Cantidad_Enfermeria,                     mae1.mmnomm nombre_asistencial,
c1.dsmfhrmov as fecha_dev_Farmacia, C.DSmCntDev q_DEVUELTA,               c1.dsmusrmov as usu_dev
from  hosvital.hccom1 h
inner join HOSVITAL.FRMSMNS A on (a.histipdoc = h.histipdoc and a.hisckey=h.hisckey and a.hiscsec=h.hiscsec)
inner join  HOSVITAL.DSPFRMC C ON (C.HISTIPDOC=A.HISTIPDOC AND C.HISCKEY=A.HISCKEY AND C.HISCSEC= A.HISCSEC AND  C.MSRESO = A.FSMMSRESO)
left join hosvital.dspfrmc1 c1  ON (C1.HISTIPDOC=A.HISTIPDOC  AND  C1.HISCKEY=A.HISCKEY AND C1.HISCSEC=A.HISCSEC AND C1.MSRESO = A.FSMMSRESO)
inner join hosvital.maemed1 mae1 on (mae1.mmcodm=h.hiscmmed)
inner join hosvital.maesum1 maesum1 on (maesum1.msreso = A.FSMMSRESO)
WHERE  A.FSMFHRREG >= '2020-08-01 00:00:00'  and A.FSMFHRREG <= '2020-08-02 00:00:00' and c1.dsmtpotrn='DV'
ORDER BY A.FSMFHRREG ;




select * from hosvital.frmsmns1 where hisckey='41741595' and hiscsec = 355 and mscodi='J01C' AND MSPRAC='R01';
select * from hosvital.frmsmns  where hisckey='41741595' and hiscsec = 355  and  FSMMSRESO = 'U150J01C'; --  fsmcntdia, FSMCNTSOL, 
select * from hosvital.dspfrmc  where hisckey='41741595' and hiscsec = 355 and  MSRESO = 'U150J01C';
select * from hosvital.dspfrmc1  where hisckey='41741595' and hiscsec = 355 and  MSRESO = 'U150J01C';
select * from hosvital.maeesp;
select * from hosvital.maepab;

select * from hosvital.hccom1 where hisckey= '41741595' and hiscsec =355   ;

-- Query EVALUACION POBLACIONAL
/*
1 Fecha Dispensación
2 Nombre Paciente
3 código producto
4 Nombre producto
5 Cantidad producto dispensado
6 Servicio hospitalización o UCI  del paciente al que se le dispensó ( se requiere discriminado por servicio ejemplo Hospitalizacion 6 norte, Hospitalizacion 6 Sur/ Uci 3 Piso)
7 Especialidad Médica que prescribió el producto (ejemplo: Medicina General/ Medicina Interna / Cardiologia)

*/

SELECT  A.HISTIPDOC AS Tipo_Doc, A.HISCKEY Documento,A.HISCSEC Folio,
A.FSMMSRESO as Cod_Producto ,maesum1.msnomg as medicamento,c.dsmfch as fecha_dispensacion,c.dsmcntdes as dispensado,maepab.mpnomp as servicio_paciente,esp.menome as especialidad_medico
from  hosvital.hccom1 h
inner join HOSVITAL.FRMSMNS A on (a.histipdoc = h.histipdoc and a.hisckey=h.hisckey and a.hiscsec=h.hiscsec)
inner join  HOSVITAL.DSPFRMC C ON (C.HISTIPDOC=A.HISTIPDOC AND C.HISCKEY=A.HISCKEY AND C.HISCSEC= A.HISCSEC AND  C.MSRESO = A.FSMMSRESO)
inner join hosvital.maemed1 mae1 on (mae1.mmcodm=h.hiscmmed)
inner join hosvital.maesum1 maesum1 on (maesum1.msreso = A.FSMMSRESO)
inner join hosvital.maeesp esp on (esp.mecode = h.hcesp)
inner join hosvital.maepab maepab on (maepab.mpcodp = h.hccodpab)
WHERE  A.FSMFHRREG >= '2020-08-01 00:00:00'  and A.FSMFHRREG <= '2020-08-02 00:00:00' 
ORDER BY A.FSMFHRREG ;




