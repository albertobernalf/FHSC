/*

TIPO DOC	DOCUMENTO	NOMBRES PACIENTE	TIPO ATENCIÓN	PABELLÓN 	FECHA DE INGRESO	FECHA DE SALIDA	FECHA DE FOLIO	No de folio	EVOLUCIÓN
SUBJETIVO	EVOLUCIÓN
OBJETIVO	EVOLUCION
ANALISIS	EVOLUCION
PLAN	NOMBRE MÉDICO	ESPECIALIDAD



SELECT * FROM HOSVITAL.HCCOM1DES;  --  HISDESATR='EVODESA'   / EVODESP   	/	

SELECT DISTINCT   HISDESATR FROM HOSVITAL.HCCOM1DES;
EVODESO   	
EVODESS   	

*/
SELECT count(*) FROM HOSVITAL.HCCOM1DES;  
SELECT count(*) FROM HOSVITAL.HCCOM1;  

SELECT * FROM HOSVITAL.HCCOM1 WHERE HISFHORAT>= '2021-05-12 00:00:00';
select * from hosvital.maepab;

-- Query 1

SELECT c.mptdoc tipo_doc, c.mpcedu documento,c.mpnomc paciente,  pab.mpnomp pabellon, i.ingfecadm ingreso, i.ingfecegr  egreso,h1.hisfhorat fecha_atencion, h1.hiscsec folio,
H1.HISCMMED  AS cod_med, mae.mmnomm medico,  esp.menome especialidad,
(select hdes.hisdesdet
from  hosvital.hccom1des hdes
where hdes.histipdoc=h1.histipdoc and hdes.hisckey = h1.hisckey and hdes.hiscsec = h1.hiscsec and hdes.hisdesatr='EVODESS')  SUBJETIVO,
(select  hdes.hisdesdet from hosvital.hccom1des hdes where hdes.histipdoc=h1.histipdoc  and hdes.hisckey = h1.hisckey and hdes.hiscsec = h1.hiscsec and hdes.hisdesatr='EVODESO')  OBJETIVO
FROM hosvital.ingresos i 
inner join hosvital.hccom1 h1 on (h1.histipdoc=i.mptdoc and h1.hisckey = i.mpcedu AND H1.HCTVIN1 = I.INGCSC)
INNER JOIN hosvital.capbas c on (c.mptdoc = i.mptdoc and c.mpcedu=i.mpcedu)
inner join hosvital.maemed1 mae on (mae.mmcodm=h1.hiscmmed)
inner join hosvital.maeesp esp on (esp.mecode=h1.hcesp)
inner join hosvital.maepab pab on (pab.mpcodp = i.mpcodp)
WHERE i.ingfecadm>= '2021-01-01 00:00:00' and   i.ingfecadm  <= '2021-01-10 00:00:00' and (h1.histipdoc,h1.hisckey,h1.hiscsec) in (select  des2.histipdoc, des2.hisckey, des2.hiscsec from hosvital.hccom1des des2 where des2.histipdoc=h1.histipdoc and des2.hisckey=h1.hisckey and des2.hiscsec=h1.hiscsec);

-- Query2

SELECT c.mptdoc tipo_doc, c.mpcedu documento,c.mpnomc paciente,  pab.mpnomp pabellon, i.ingfecadm ingreso, i.ingfecegr  egreso,h1.hisfhorat fecha_atencion, h1.hiscsec folio,
H1.HISCMMED  AS cod_med, mae.mmnomm medico, esp.menome especialidad,
(select  hdes.hisdesdet  from hosvital.hccom1des hdes where hdes.histipdoc=h1.histipdoc and hdes.hisckey = h1.hisckey and hdes.hiscsec = h1.hiscsec and hdes.hisdesatr='EVODESA')  ANALISIS,
(select  hdes.hisdesdet from hosvital.hccom1des hdes where hdes.histipdoc=h1.histipdoc and hdes.hisckey = h1.hisckey and hdes.hiscsec = h1.hiscsec and hdes.hisdesatr='EVODESP')  PLAN
FROM hosvital.ingresos i 
inner join hosvital.hccom1 h1 on (h1.histipdoc=i.mptdoc and h1.hisckey = i.mpcedu AND H1.HCTVIN1 = I.INGCSC)
INNER JOIN hosvital.capbas c on (c.mptdoc = i.mptdoc and c.mpcedu=i.mpcedu)
inner join hosvital.maemed1 mae on (mae.mmcodm=h1.hiscmmed)
inner join hosvital.maeesp esp on (esp.mecode=h1.hcesp)
inner join hosvital.maepab pab on (pab.mpcodp = i.mpcodp)
WHERE i.ingfecadm>= '2021-01-01 00:00:00' and   i.ingfecadm  <= '2021-01-10 00:00:00'   and (h1.histipdoc,h1.hisckey,h1.hiscsec) in (select  des2.histipdoc, des2.hisckey, des2.hiscsec from hosvital.hccom1des des2 where des2.histipdoc=h1.histipdoc and des2.hisckey=h1.hisckey and des2.hiscsec=h1.hiscsec);  ;
