SELECT A.HISTIPDOC AS Tipo_Doc, A.HISCKEY Documento,A.HISCSEC Folio,A.FSMMSRESO as Cod_Producto ,maesum1.msnomg as medicamento,c.dsmfch as fecha_dispensacion,c.dsmcntdes as dispensado,maepab.mpnomp as servicio_paciente,esp.menome as especialidad_medico 
from hosvital.hccom1 h 
inner join HOSVITAL.FRMSMNS A on (a.histipdoc=h.histipdoc and a.hisckey=h.hisckey and a.hiscsec=h.hiscsec)
 inner join HOSVITAL.DSPFRMC C ON (C.HISTIPDOC=A.HISTIPDOC AND C.HISCKEY=A.HISCKEY AND C.HISCSEC= A.HISCSEC AND C.MSRESO=A.FSMMSRESO)
 inner join hosvital.maemed1 mae1 on (mae1.mmcodm=h.hiscmmed) 
inner join hosvital.maesum1 maesum1 on (maesum1.msreso = A.FSMMSRESO)
 inner join hosvital.maeesp esp on (esp.mecode = h.hcesp)
 inner join hosvital.maepab maepab on (maepab.mpcodp = h.hccodpab) 
WHERE  A.FSMFHRREG >='2020-08-01 00:00:00' and A.FSMFHRREG <='2020-08-10 23:59:59' 
 ORDER BY A.FSMFHRREG,A.HISCKEY;

-- dispositivos medico
-- por pabellon
-- grupo 2  dispo medico

select * from hosvital.maesum1;
select * from HOSVITAL.DSPFRMC;

select * from hosvital.grupos; -- 02  disositivos medicos  evaluacon poblac dispo medicos

SELECT h.HISTIPDOC AS Tipo_Doc, h.HISCKEY Documento,h.HISCSEC Folio,maesum1.msreso as Cod_Producto ,maesum1.msnomg as Dispositivo,c.dsmfch as fecha_dispensacion,c.dsmcntdes as dispensado,maepab.mpnomp as servicio_paciente
from hosvital.hccom1 h 
 inner join HOSVITAL.DSPFRMC C ON (C.HISTIPDOC=h.HISTIPDOC AND C.HISCKEY=h.HISCKEY AND C.HISCSEC= h.HISCSEC)
inner join hosvital.maesum1 maesum1 on (maesum1.msreso = c.msreso  and maesum1.msgrpcod='02')
 inner join hosvital.maeesp esp on (esp.mecode = h.hcesp)
 inner join hosvital.maepab maepab on (maepab.mpcodp = h.hccodpab) 
WHERE h.hisfhorat >='2020-08-01 00:00:00' and h.hisfhorat <='2020-08-05 23:59:59' 
 ORDER BY h.hisfhorat,h.HISCKEY;



