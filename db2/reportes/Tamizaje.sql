SELECT HOSVITAL.RESENCU.RESDOCPAC AS CEDULA, HOSVITAL.CAPBAS.MPNOMC AS PACIENTE, HOSVITAL.MAEEMP.MENOMB AS CONTRATO, HOSVITAL.MAEPAB.MPNOMP AS PABELLON, HOSVITAL.INGRESOS.MPNUMC AS CAMA, HOSVITAL.RESENCU.ENCCOD AS COD_FORMATO, HOSVITAL.ENCUES1.ENCVER AS VERSION_FOR, HOSVITAL.ENCUES1.ENCAGRDSC AS DESCRIPCION_FORMATO, HOSVITAL.RESENCU.RESFOLPAC AS FOLIO, DATE(HOSVITAL.RESENCU.RESFECHOR) AS FECHA, TIME(HOSVITAL.RESENCU.RESFECHOR) AS HORA

WHERE HOSVITAL.RESENCU.ENCCOD IN ('CONS1', 'NUT01', 'TADITR') AND DATE(HOSVITAL.RESENCU.RESFECHOR) BETWEEN '2019-04-01' AND '2019-04-30';


SELECT r.RESDOCPAC AS CEDULA, c.MPNOMC AS PACIENTE, m.MENOMB AS CONTRATO, m1.MPNOMP AS PABELLON, i.MPNUMC AS CAMA, r.ENCCOD AS COD_FORMATO, e.ENCVER AS VERSION_FOR, e.ENCAGRDSC AS DESCRIPCION_FORMATO, r.RESFOLPAC AS FOLIO, DATE(r.RESFECHOR) AS FECHA, TIME(r.RESFECHOR) AS HORA
from hosvital.resencu1 r1
inner join hosvital.resencu r on (r.empcod= r1.empcod and r.mcdpto=r1.mcdpto and r.enccod=r1.enccod and r.encver=r1.encver and r.restdopac=r1.restdopac and r.resfolpac = r1.resfolpac and r.resctvre = r1.resctvre)
inner join hosvital.capbas c on (c.mptdoc = r.restdopac and c.mpcedu =r.resdocpac)
inner join hosvital.hccom1 h on (h.histipdoc=c.mptdoc and h.hisckey =c.mpcedu  and h.hiscsec =  r.resfolpac )
inner join hosvital.maeemp m on (m.mennit = h.fhccodcto)
inner join hosvital.encues1 e on ( e.empcod = r.empcod and e.enccod=r.enccod and e.encver=r.encver )
inner join hosvital.ingresos i on (i.mptdoc= h.histipdoc and i.mpcedu = h.hisckey and i.ingcsc = h.hctvin1)
inner join hosvital.maepab m1 on (m1.mpcodp = i.mpcodp)
where r.enccod in  ('CONS1', 'NUT01', 'TADITR') AND DATE(r.RESFECHOR) BETWEEN '2019-05-01' AND '2019-05-31'
group by r.RESDOCPAC, c.MPNOMC , m.MENOMB , m1.MPNOMP , i.MPNUMC , r.ENCCOD , e.ENCVER , e.ENCAGRDSC , r.RESFOLPAC , date(r.RESFECHOR) , TIME(r.RESFECHOR) ,e.encagrord,e.enculcpr ;

select * from hosvital.resencu;
select * from hosvital.resencu1;
select * from hosvital.encues1 order by enccod,encver;
select * from hosvital.hccom1 ;

SELECT * FROM HOSVITAL.HCCOM1 WHERE HISCKEY='21047210' AND HISCSEC=34;
-- PUNTAJE CRIVAJE
SELECT * FROM HOSVITAL.MAEMED1 WHERE MMCODM='NU033';



SELECT r.RESDOCPAC AS CEDULA, c.MPNOMC AS PACIENTE, m.MENOMB AS CONTRATO, m1.MPNOMP AS PABELLON, i.MPNUMC AS CAMA,m11.mmnomm as nombre_medico, e.ENCAGRDSC AS DESCRIPCION_FORMATO, r.RESFOLPAC AS FOLIO, DATE(r.RESFECHOR) AS FECHA, TIME(r.RESFECHOR) AS HORA, r1.resobser as puntaje_crivaje
from hosvital.resencu1 r1
inner join hosvital.resencu r on (r.empcod= r1.empcod and r.mcdpto=r1.mcdpto and r.enccod=r1.enccod and r.encver=r1.encver and r.restdopac=r1.restdopac and r.resfolpac = r1.resfolpac and r.resctvre = r1.resctvre)
inner join hosvital.capbas c on (c.mptdoc = r.restdopac and c.mpcedu =r.resdocpac)
inner join hosvital.hccom1 h on (h.histipdoc=c.mptdoc and h.hisckey =c.mpcedu  and h.hiscsec =  r.resfolpac )
inner join hosvital.maeemp m on (m.mennit = h.fhccodcto)
inner join hosvital.encues1 e on ( e.empcod = r.empcod and e.enccod=r.enccod and e.encver=r.encver )
inner join hosvital.ingresos i on (i.mptdoc= h.histipdoc and i.mpcedu = h.hisckey and i.ingcsc = h.hctvin1)
inner join hosvital.maepab m1 on (m1.mpcodp = i.mpcodp)
inner join hosvital.maemed1 m11 on (m11.mmcodm = h.hiscmmed)
where r.enccod in  ('CONS1', 'NUT01', 'TADITR') AND DATE(r.RESFECHOR) BETWEEN '2019-01-01' AND '2019-12-31' and r1.resencctv= 74
group by r.RESDOCPAC, c.MPNOMC , m.MENOMB , m1.MPNOMP , i.MPNUMC ,m11.mmnomm, e.ENCAGRDSC , r.RESFOLPAC , date(r.RESFECHOR) , TIME(r.RESFECHOR) ,e.encagrord,e.enculcpr , r1.resobser 
order by  r.RESDOCPAC;


select * from hosvital.maemed1;
select * from  hosvital.encues1; -- enccod='CONS1', encver=1, encagrpr=1
select * from  hosvital.resencu where resdocpac='21047210' and resfolpac in (34,3267,3835,1582,1980);

select * from  hosvital.resencu1 where resdocpac='21047210' and resfolpac in (34,3267,3835,1582,1980) and resencctv= 74;;

/*****************************/


--acotado
/*******************************/



SELECT r.RESDOCPAC AS CEDULA, c.MPNOMC AS PACIENTE, m.MENOMB AS CONTRATO, m1.MPNOMP AS PABELLON, i.MPNUMC AS CAMA,m11.mmnomm as nombre_medico, e.ENCAGRDSC AS DESCRIPCION_FORMATO, r.RESFOLPAC AS FOLIO, DATE(r.RESFECHOR) AS FECHA, TIME(r.RESFECHOR) AS HORA, r1.resobser as puntaje_crivaje from hosvital.resencu1 r1 inner join hosvital.resencu r on (r.empcod= r1.empcod and r.mcdpto=r1.mcdpto and r.enccod=r1.enccod and r.encver=r1.encver and r.restdopac=r1.restdopac and r.resfolpac = r1.resfolpac and r.resctvre = r1.resctvre) inner join hosvital.capbas c on (c.mptdoc = r.restdopac and c.mpcedu =r.resdocpac)
inner join hosvital.hccom1 h on (h.histipdoc=c.mptdoc and h.hisckey =c.mpcedu  and h.hiscsec =  r.resfolpac ) inner join hosvital.maeemp m on (m.mennit = h.fhccodcto)
inner join hosvital.encues1 e on ( e.empcod = r.empcod and e.enccod=r.enccod and e.encver=r.encver ) inner join hosvital.ingresos i on (i.mptdoc= h.histipdoc and i.mpcedu = h.hisckey and i.ingcsc = h.hctvin1)
inner join hosvital.maepab m1 on (m1.mpcodp = i.mpcodp) inner join hosvital.maemed1 m11 on (m11.mmcodm = h.hiscmmed) where r.enccod in  ('CONS1', 'NUT01', 'TADITR') AND DATE(r.RESFECHOR) BETWEEN '2019-01-01' AND '2019-12-31' and r1.resencctv= 74 group by r.RESDOCPAC, c.MPNOMC , m.MENOMB , m1.MPNOMP , i.MPNUMC ,m11.mmnomm, e.ENCAGRDSC , r.RESFOLPAC , date(r.RESFECHOR) , TIME(r.RESFECHOR) ,e.encagrord,e.enculcpr , r1.resobser 
order by  r.RESDOCPAC;

