SELECT * FROM HOSVITAL.ENCUES ORDER BY ENCCOD;
SELECT * FROM HOSVITAL.ENCUES1;
SELECT * FROM HOSVITAL.ENCUES2;
SELECT * FROM HOSVITAL.ENCUES3;
SELECT * FROM HOSVITAL.ENCUES4;
SELECT * FROM HOSVITAL.RESENCU;
SELECT * FROM HOSVITAL.RESENCU1;
SELECT * FROM HOSVITAL.ENCUESP;


SELECT r.RESDOCPAC AS CEDULA,c.MPNOMC AS PACIENTE, m.MENOMB AS CONTRATO, m1.MPNOMP AS PABELLON, i.MPNUMC AS CAMA,m11.mmnomm as nombre_medico, e.ENCAGRDSC AS DESCRIPCION_FORMATO,r.RESFOLPAC AS FOLIO, DATE(r.RESFECHOR) AS FECHA,TIME(r.RESFECHOR) AS HORA,r1.resobser as puntaje_crivaje from hosvital.resencu1 r1
 inner join hosvital.resencu r on (r.empcod=r1.empcod and r.mcdpto=r1.mcdpto and r.enccod=r1.enccod and r.encver=r1.encver and r.restdopac=r1.restdopac and r.resfolpac=r1.resfolpac and r.resctvre=r1.resctvre)
 inner join hosvital.capbas c on (c.mptdoc=r.restdopac and c.mpcedu=r.resdocpac) 
inner join hosvital.hccom1 h on (h.histipdoc=c.mptdoc and h.hisckey=c.mpcedu and h.hiscsec=r.resfolpac) 
inner join hosvital.maeemp m on (m.mennit = h.fhccodcto)
 inner join hosvital.encues1 e on (e.empcod=r.empcod and e.enccod=r.enccod and e.encver=r.encver)
 inner join hosvital.ingresos i on (i.mptdoc=h.histipdoc and i.mpcedu=h.hisckey and i.ingcsc=h.hctvin1) 
inner join hosvital.maepab m1 on (m1.mpcodp=i.mpcodp) 
inner join hosvital.maemed1 m11 on (m11.mmcodm=h.hiscmmed)
 where r.enccod in  ('CONS1', 'NUT01', 'TADITR') AND DATE(r.RESFECHOR) BETWEEN '2019-10-01' AND '2019-10-31' and r1.resencctv=74 
group by r.RESDOCPAC,c.MPNOMC,m.MENOMB,m1.MPNOMP, i.MPNUMC,m11.mmnomm, e.ENCAGRDSC, r.RESFOLPAC,date(r.RESFECHOR),TIME(r.RESFECHOR),e.encagrord,e.enculcpr,r1.resobser order by r.RESDOCPAC;


---
-- Para el nuevo reporte

SELECT r.RESDOCPAC AS CEDULA,c.MPNOMC AS PACIENTE, m.MENOMB AS CONTRATO, m1.MPNOMP AS PABELLON, i.MPNUMC AS CAMA,m11.mmnomm as nombre_medico, e.ENCAGRDSC AS DESCRIPCION_FORMATO,r.RESFOLPAC AS FOLIO, DATE(r.RESFECHOR) AS FECHA,TIME(r.RESFECHOR) AS HORA ,r1.resobser as puntaje_crivaje 
from hosvital.resencu1 r1
 inner join hosvital.resencu r on (r.empcod=r1.empcod and r.mcdpto=r1.mcdpto and r.enccod=r1.enccod and r.encver=r1.encver and r.restdopac=r1.restdopac and r.resfolpac=r1.resfolpac and r.resctvre=r1.resctvre)
 inner join  hosvital.capbas c on (c.mptdoc=r.restdopac and c.mpcedu=r.resdocpac) 
inner join  hosvital.hccom1 h on (h.histipdoc=c.mptdoc and h.hisckey=c.mpcedu and h.hiscsec=r.resfolpac) 
inner join  hosvital.maeemp m on (m.mennit = h.fhccodcto)
 inner join  hosvital.encues1 e on (e.empcod=r.empcod and e.enccod=r.enccod and e.encver=r.encver)
 inner join  hosvital.ingresos i on (i.mptdoc=h.histipdoc and i.mpcedu=h.hisckey and i.ingcsc=h.hctvin1) 
inner join  hosvital.maepab m1 on (m1.mpcodp=i.mpcodp) 
inner join  hosvital.maemed1 m11 on (m11.mmcodm=h.hiscmmed)
 where r.enccod in  ('TNPACR') AND DATE(r.RESFECHOR) BETWEEN '2019-10-01' AND '2019-12-30' --and r1.resencctv IN (8)
group by r.RESDOCPAC,c.MPNOMC,m.MENOMB,m1.MPNOMP, i.MPNUMC,m11.mmnomm, e.ENCAGRDSC, r.RESFOLPAC,date(r.RESFECHOR),TIME(r.RESFECHOR),e.encagrord,e.enculcpr,r1.resobser
 order by r.RESDOCPAC;