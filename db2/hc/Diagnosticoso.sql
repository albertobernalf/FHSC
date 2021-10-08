select * from hosvital.hcdiagn where hisckey='1023943485';  -- principal ,, hcdxcls=1   ,,  relacionado   hcdxcls=0

select * from hosvital.hcdiagn1;
select * from hosvital.maedia;
select * from hosvital.ingresos;  -- ingentdx

/*
select i.mptdoc, i.mpcedu, i.ingcsc, i.ingentdx
from hosvital.ingresos i, hosvital.capbas c, hosvita.hcdiagn h, hosvital.maedia m
where i.mptdoc = c.mptdoc and i.mpcedu0 c.mpcedu and i.mptdoc =  h.histipdoc and i.mpcedu = h.hisckey
       and i.ingfecegr>= '2919-95-01 00.00.00' and
order by  i.mptdoc, i.mpcedu, i.ingcsc

*/

SELECT INGRESOS.MPTDOC TIP_DOC, INGRESOS.MPCEDU DOCUMENTO, CAPBAS.MPNOMC PACIENTE, CAPBAS.MPTELE TELEFONO, CAPBAS.MPDIRE DIRECCION, MAEDMB.MDNOMD DEPARTAMENTO, MAEDMB1.MDNOMM LOCALIDAD, MAEEMP.MENOMB EPS, INGRESOS.INGCSC CSV_INGRESO, INGRESOS.INGFECADM FCH_INGRESO, INGRESOS.INGENTDX COD_DX_ENTRADA,
(select dmnomb
 from HOSVITAL.MAEDIA  mae
 where  mae.DMCODI = INGRESOS.INGENTDX ) as diagnostico_ingreso,
INGRESOS.INGCODPEG COD_PABELLON, MAEPAB.MPNOMP PABELLON,
(select min(mae.dmcodi||' '||mae.dmnomb)
from hosvital.hccom1 h, hosvital.hcdiagn hc, hosvital.maedia mae
where h.histipdoc=ingresos.mptdoc and h.hisckey=ingresos.mpcedu and h.hctvin1 = ingresos.ingcsc and
           h.histipdoc=hc.histipdoc and h.hisckey=hc.hisckey and h.hiscsec= hc.hiscsec and hc.hcdxcls=1 and hc.hcdxcod=mae.dmcodi) as dx_ppal,
(select max(mae.dmcodi||' '||mae.dmnomb)
from hosvital.hccom1 h, hosvital.hcdiagn hc, hosvital.maedia mae
where h.histipdoc=ingresos.mptdoc and h.hisckey=ingresos.mpcedu and h.hctvin1 = ingresos.ingcsc and
           h.histipdoc=hc.histipdoc and h.hisckey=hc.hisckey and h.hiscsec= hc.hiscsec and hc.hcdxcls=1 and hc.hcdxcod=mae.dmcodi) as dx_ppal1,


(select min(mae.dmcodi||' '||mae.dmnomb)
from hosvital.hccom1 h, hosvital.hcdiagn hc, hosvital.maedia mae
where h.histipdoc=ingresos.mptdoc and h.hisckey=ingresos.mpcedu and h.hctvin1 = ingresos.ingcsc and
           h.histipdoc=hc.histipdoc and h.hisckey=hc.hisckey and h.hiscsec= hc.hiscsec and hc.hcdxcls=0 and hc.hcdxcod=mae.dmcodi) as dx_relacionado,
(select max(mae.dmcodi||' '||mae.dmnomb)
from hosvital.hccom1 h, hosvital.hcdiagn hc, hosvital.maedia mae
where h.histipdoc=ingresos.mptdoc and h.hisckey=ingresos.mpcedu and h.hctvin1 = ingresos.ingcsc and
           h.histipdoc=hc.histipdoc and h.hisckey=hc.hisckey and h.hiscsec= hc.hiscsec and hc.hcdxcls=0 and hc.hcdxcod=mae.dmcodi) as dx_relacionado1,


INGRESOS.INGFECEGR FCH_EGRESO 
FROM HOSVITAL.INGRESOS  INGRESOS 
INNER JOIN HOSVITAL.MAEPAB  MAEPAB ON (MAEPAB.MPCODP = INGRESOS.INGCODPEG) 
INNER JOIN HOSVITAL.MAEEMP  MAEEMP ON (MAEEMP.MENNIT = INGRESOS.INGNIT) 
INNER JOIN HOSVITAL.CAPBAS  CAPBAS ON (CAPBAS.MPTDOC = INGRESOS.MPTDOC) AND (CAPBAS.MPCEDU = INGRESOS.MPCEDU) 
INNER JOIN HOSVITAL.MAEDMB  MAEDMB ON (MAEDMB.MDCODD = CAPBAS.MDCODD) 
INNER JOIN HOSVITAL.MAEDMB1  MAEDMB1 ON (MAEDMB1.MDCODM = CAPBAS.MDCODM) AND (MAEDMB1.MDCODD = MAEDMB.MDCODD) 
WHERE DATE(INGRESOS.INGFECEGR) BETWEEN '2019-06-01' AND '2019-06-30' 
 ORDER BY INGRESOS.MPCEDU, INGRESOS.INGCSC;


select * from hosvital.maedia;

select hctvin1 from hosvital.hccom1 where hisckey='1023943485' and hiscsec in (2,70);

/***  acotado   **/



SELECT INGRESOS.MPTDOC TIP_DOC, INGRESOS.MPCEDU DOCUMENTO, CAPBAS.MPNOMC PACIENTE, CAPBAS.MPTELE TELEFONO, CAPBAS.MPDIRE DIRECCION, MAEDMB.MDNOMD DEPARTAMENTO, MAEDMB1.MDNOMM LOCALIDAD, MAEEMP.MENOMB EPS, INGRESOS.INGCSC CSV_INGRESO, INGRESOS.INGFECADM FCH_INGRESO, INGRESOS.INGENTDX COD_DX_ENTRADA,(select dmnomb
 from HOSVITAL.MAEDIA  mae  where  mae.DMCODI = INGRESOS.INGENTDX ) as diagnostico_ingreso, INGRESOS.INGCODPEG COD_PABELLON, MAEPAB.MPNOMP PABELLON, (select min(mae.dmcodi||' '||mae.dmnomb)
from hosvital.hccom1 h, hosvital.hcdiagn hc, hosvital.maedia mae where h.histipdoc=ingresos.mptdoc and h.hisckey=ingresos.mpcedu and h.hctvin1 = ingresos.ingcsc and h.histipdoc=hc.histipdoc and h.hisckey=hc.hisckey and h.hiscsec= hc.hiscsec and hc.hcdxcls=1 and hc.hcdxcod=mae.dmcodi) as dx_ppal, (select max(mae.dmcodi||' '||mae.dmnomb) from hosvital.hccom1 h, hosvital.hcdiagn hc, hosvital.maedia mae where h.histipdoc=ingresos.mptdoc and h.hisckey=ingresos.mpcedu and h.hctvin1 = ingresos.ingcsc and  h.histipdoc=hc.histipdoc and h.hisckey=hc.hisckey and h.hiscsec= hc.hiscsec and hc.hcdxcls=1 and hc.hcdxcod=mae.dmcodi) as dx_ppal1, 
(select min(mae.dmcodi||' '||mae.dmnomb) from hosvital.hccom1 h, hosvital.hcdiagn hc, hosvital.maedia mae where h.histipdoc=ingresos.mptdoc and h.hisckey=ingresos.mpcedu and h.hctvin1 = ingresos.ingcsc and
 h.histipdoc=hc.histipdoc and h.hisckey=hc.hisckey and h.hiscsec= hc.hiscsec and hc.hcdxcls=0 and hc.hcdxcod=mae.dmcodi) as dx_relacionado, (select max(mae.dmcodi||' '||mae.dmnomb)
from hosvital.hccom1 h, hosvital.hcdiagn hc, hosvital.maedia mae where h.histipdoc=ingresos.mptdoc and h.hisckey=ingresos.mpcedu and h.hctvin1 = ingresos.ingcsc and h.histipdoc=hc.histipdoc and h.hisckey=hc.hisckey and h.hiscsec= hc.hiscsec and hc.hcdxcls=0 and hc.hcdxcod=mae.dmcodi) as dx_relacionado1, INGRESOS.INGFECEGR FCH_EGRESO  FROM HOSVITAL.INGRESOS  INGRESOS 
INNER JOIN HOSVITAL.MAEPAB  MAEPAB ON (MAEPAB.MPCODP = INGRESOS.INGCODPEG)  INNER JOIN HOSVITAL.MAEEMP  MAEEMP ON (MAEEMP.MENNIT = INGRESOS.INGNIT) 
INNER JOIN HOSVITAL.CAPBAS  CAPBAS ON (CAPBAS.MPTDOC = INGRESOS.MPTDOC) AND (CAPBAS.MPCEDU = INGRESOS.MPCEDU)  INNER JOIN HOSVITAL.MAEDMB  MAEDMB ON (MAEDMB.MDCODD = CAPBAS.MDCODD) 
INNER JOIN HOSVITAL.MAEDMB1  MAEDMB1 ON (MAEDMB1.MDCODM = CAPBAS.MDCODM) AND (MAEDMB1.MDCODD = MAEDMB.MDCODD)  WHERE DATE(INGRESOS.INGFECEGR) BETWEEN '2019-06-01' AND '2019-06-30' 
 ORDER BY INGRESOS.MPCEDU, INGRESOS.INGCSC;

