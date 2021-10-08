select h1.histipdoc tipo_doc, h1.hisckey documento, h1.hiscsec folio,h1.hisfhorat  ATENCION, maemed1.mmnomm medico,esp.menome especialidad,h2.hisdesdet as evolucion, case when h1.hisclpr ='1' then 'Ambulatorio' when h1.hisclpr='2' then 'Hospitalizado' when h1.hisclpr='3' then 'Urgencias' else 'Otro evicio' end servicio from hosvital.hccom1 h1 inner join hosvital.hccom1des h2 on (h2.histipdoc=h1.histipdoc and h2.hisckey = h1.hisckey and h2.hiscsec=h1.hiscsec) inner join hosvital.capbas cap on (cap.mptdoc=h1.histipdoc and cap.mpcedu = h1.hisckey) inner join hosvital.maeesp esp on (esp.mecode= 450 and esp.mecode=h1.hcesp) inner join hosvital.maemed1 maemed1 on (maemed1.mmcodm=h1.hiscmmed) where h1.hisfhorat>= '2021-05-01 00:00:00' and h1.hisfhorat<= '2021-05-05 23:59:59'
 order by maemed1.mmnomm,h1.hisfhorat;

SELECT * FROM hosvital.hccom1des WHERE HISCKEY='31031216' AND HISCSEC = 313;

select h1.histipdoc tipo_doc, h1.hisckey documento, h1.hiscsec folio,h1.hisfhorat  ATENCION, maemed1.mmnomm medico,esp.menome especialidad,
MAX((SELECT  H22.hisdesdet  FROM hosvital.hccom1des H22 WHERE H22.HISTIPDOC = H2.HISTIPDOC AND H22.HISCKEY=H2.HISCKEY AND H22.HISCSEC=H2.HISCSEC AND H22.hisdesatr='EVODESS')) SUBJETIVO,
MAX((SELECT  h22.hisdesdet  FROM hosvital.hccom1des H22 WHERE H22.HISTIPDOC = H2.HISTIPDOC AND H22.HISCKEY=H2.HISCKEY AND H22.HISCSEC=H2.HISCSEC AND H22.hisdesatr='EVODESO')) OBJETIVO,
case when h1.hisclpr ='1' then 'Ambulatorio' when h1.hisclpr='2' then 'Hospitalizado' when h1.hisclpr='3' then 'Urgencias' else 'Otro evicio' end servicio
 from hosvital.hccom1 h1 
inner join hosvital.hccom1des h2 on (h2.histipdoc=h1.histipdoc and h2.hisckey = h1.hisckey and h2.hiscsec=h1.hiscsec)
 inner join hosvital.capbas cap on (cap.mptdoc=h1.histipdoc and cap.mpcedu = h1.hisckey)
 inner join hosvital.maeesp esp on (esp.mecode= 450 and esp.mecode=h1.hcesp) 
inner join hosvital.maemed1 maemed1 on (maemed1.mmcodm=h1.hiscmmed) 
where h1.hisfhorat>= '2021-05-01 00:00:00' and h1.hisfhorat<= '2021-05-05 23:59:59'  AND   H1.HISCKEY='31031216' 
GROUP BY  h1.histipdoc , h1.hisckey , h1.hiscsec ,h1.hisfhorat  , maemed1.mmnomm,esp.menome ,7, 8,  H1.HISCLPR
 order by maemed1.mmnomm,h1.hisfhorat;

select h1.histipdoc tipo_doc, h1.hisckey documento, h1.hiscsec folio,h1.hisfhorat  ATENCION, maemed1.mmnomm medico,esp.menome especialidad,
MAX((SELECT  H22.hisdesdet  FROM hosvital.hccom1des H22 WHERE H22.HISTIPDOC = H2.HISTIPDOC AND H22.HISCKEY=H2.HISCKEY AND H22.HISCSEC=H2.HISCSEC AND H22.hisdesatr='EVODESA')) ANALISIS,
MAX((SELECT  h22.hisdesdet  FROM hosvital.hccom1des H22 WHERE H22.HISTIPDOC = H2.HISTIPDOC AND H22.HISCKEY=H2.HISCKEY AND H22.HISCSEC=H2.HISCSEC AND H22.hisdesatr='EVODESP')) PAN,
case when h1.hisclpr ='1' then 'Ambulatorio' when h1.hisclpr='2' then 'Hospitalizado' when h1.hisclpr='3' then 'Urgencias' else 'Otro evicio' end servicio
 from hosvital.hccom1 h1 
inner join hosvital.hccom1des h2 on (h2.histipdoc=h1.histipdoc and h2.hisckey = h1.hisckey and h2.hiscsec=h1.hiscsec)
 inner join hosvital.capbas cap on (cap.mptdoc=h1.histipdoc and cap.mpcedu = h1.hisckey)
 inner join hosvital.maeesp esp on (esp.mecode= 450 and esp.mecode=h1.hcesp) 
inner join hosvital.maemed1 maemed1 on (maemed1.mmcodm=h1.hiscmmed) 
where h1.hisfhorat>= '2021-05-01 00:00:00' and h1.hisfhorat<= '2021-05-05 23:59:59'  AND   H1.HISCKEY='31031216' 
GROUP BY  h1.histipdoc , h1.hisckey , h1.hiscsec ,h1.hisfhorat  , maemed1.mmnomm,esp.menome ,7, 8,  H1.HISCLPR
 order by maemed1.mmnomm,h1.hisfhorat;


