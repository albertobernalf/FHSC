SELECT HOSVITAL.MAEPRO.PRCODI AS "CUPS", HOSVITAL.MAEPRO.PRNOMB AS "PROCEDIMIENTO", HOSVITAL.TIPPROC.TIPRCOD AS "CODIGO TIPO", HOSVITAL.TIPPROC.TIPRDES AS "TIPO", HOSVITAL.CAPBAS.MPTDOC AS "TIPO ID", HOSVITAL.CAPBAS.MPCEDU AS "ID", HOSVITAL.CAPBAS.MPFCHN AS "FECHA NACIMIENTO", HOSVITAL.CAPBAS.MPSEXO AS "GENERO", HOSVITAL.HCCOM1.HISCLPR AS "TIPO ATENCION", HOSVITAL.MAEMED1.MMNOMM AS "MEDICO ORDENA", HOSVITAL.MAEMED1.MMCODM AS "COD MEDICO ORDENA", HOSVITAL.HCCOM51.HCPRCEST AS "ESTADO PROCEDIMIENTO", HOSVITAL.HCCOM51.HCFCHRORD AS "FECHA ORDEN", HOSVITAL.HCCOM51.HCFCHRAP AS "FECHA APLICACION", HOSVITAL.HCCOM5.HISCPOBS AS OBSERVACION, HOSVITAL.HCCOM51.HCRESULT AS "DETALLE RESULTADO", HOSVITAL.HCCOM1.CNCCOD AS "CENTRO COSTO", HOSVITAL.CENCOST.CNCDSC AS "NOMBRE CENTRO",HOSVITAL.MAEEMP.MENOMB AS "CONTRATO", HOSVITAL.EMPRESS.EMPDSC AS "EMPRESA" , MM.MMCODM AS "CODIGO_FISIO" , MM.MMNOMM AS "NOMBRE_FISIO",
case when HOSVITAL.HCCOM51.HCOrdAmb='S' then 'Ambulatoria' else '' end, HOSVITAL.HCCOM51.HCObsCan as obs_cancelacion

FROM ((((HOSVITAL.HCCOM51 
INNER JOIN HOSVITAL.CAPBAS ON HOSVITAL.HCCOM51.HISCKEY = HOSVITAL.CAPBAS.MPCEDU) 
INNER JOIN HOSVITAL.MAEPRO ON HOSVITAL.HCCOM51.HCPRCCOD = HOSVITAL.MAEPRO.PRCODI) 
INNER JOIN HOSVITAL.TIPPROC ON HOSVITAL.MAEPRO.TPPRCD = HOSVITAL.TIPPROC.TIPRCOD) 
INNER JOIN HOSVITAL.HCCOM1 ON (HOSVITAL.HCCOM51.HISCKEY = HOSVITAL.HCCOM1.HISCKEY) AND (HOSVITAL.HCCOM51.HISCSEC = HOSVITAL.HCCOM1.HISCSEC)) 
INNER JOIN HOSVITAL.MAEMED1 ON HOSVITAL.HCCOM1.HISCMMED = HOSVITAL.MAEMED1.MMCODM LEFT JOIN HOSVITAL.CENCOST ON  HOSVITAL.HCCOM1.CNCCOD=HOSVITAL.CENCOST.CNCCOD 
LEFT JOIN HOSVITAL.MAEEMP ON HOSVITAL.MAEEMP.MENNIT = HOSVITAL.HCCOM1.FHCCODCTO 
INNER JOIN HOSVITAL.EMPRESS ON HOSVITAL.MAEEMP.MECNTR = HOSVITAL.EMPRESS.MECNTR  
LEFT JOIN HOSVITAL.MAEMED1 AS MM ON MM.MMUSUARIO = HOSVITAL.HCCOM51.RPRUSRRGS 
INNER JOIN HOSVITAL.HCCOM5 ON (HOSVITAL.HCCOM51.HCPRCCOD = HOSVITAL.HCCOM5.HCPRCCOD) AND (HOSVITAL.HCCOM51.HISCSEC = HOSVITAL.HCCOM5.HISCSEC) AND (HOSVITAL.HCCOM51.HISTIPDOC = HOSVITAL.HCCOM5.HISTIPDOC) AND (HOSVITAL.HCCOM51.HISCKEY = HOSVITAL.HCCOM5.HISCKEY)
WHERE  DATE(HOSVITAL.HCCOM51.HCFCHRORD)>= '2019-07-01' AND DATE(HOSVITAL.HCCOM51.HCFCHRORD)<= '2019-07-31' AND HOSVITAL.MAEPRO.TPPRCD=3 ORDER BY HOSVITAL.HCCOM51.HCFCHRORD;

/* query mejiorado */

SELECT h.histipdoc,h.hisckey,h.hiscsec,mae.PRCODI AS "CUPS",mae.PRNOMB AS "PROCEDIMIENTO", t.TIPRCOD AS "CODIGO TIPO", t.TIPRDES AS "TIPO", c.MPTDOC AS "TIPO ID", c.MPCEDU AS "ID", c.MPFCHN AS "FECHA NACIMIENTO", c.MPSEXO AS "GENERO",h.HISCLPR AS "TIPO ATENCION", m1.MMNOMM AS "MEDICO ORDENA", m1.MMCODM AS "COD MEDICO ORDENA", h51.HCPRCEST AS "ESTADO PROCEDIMIENTO", h51.HCFCHRORD AS "FECHA ORDEN", h51.HCFCHRAP AS "FECHA APLICACION", h5.HISCPOBS AS OBSERVACION, h51.HCRESULT AS "DETALLE RESULTADO", h.CNCCOD AS "CENTRO COSTO", cent.CNCDSC AS "NOMBRE CENTRO",maeemp.MENOMB AS "CONTRATO", empress.EMPDSC AS "EMPRESA" , m2.MMCODM AS "CODIGO_FISIO" , m2.MMNOMM AS "NOMBRE_FISIO",
case when h51.HCOrdAmb='S' then 'Ambulatoria' else '' end, h51.HCObsCan as obs_cancelacion
FROM HOSVITAL.HCCOM51 h51
INNER JOIN HOSVITAL.CAPBAS c ON (c.mptdoc = h51.histipdoc  and c.mpcedu = h51.HISCKEY)
INNER JOIN HOSVITAL.MAEPRO mae ON (mae.prcodi = h51.HCPRCCOD )
INNER JOIN HOSVITAL.TIPPROC t ON (t.TIPRCOD = mae.TPPRCD) 
INNER JOIN HOSVITAL.HCCOM1 h ON (h.histipdoc = h51.histipdoc and h.hisckey = h51.hisckey and h.hiscsec= h51.hiscsec ) 
INNER JOIN HOSVITAL.MAEMED1 m1 ON (m1.mmcodm =  h.HISCMMED )
LEFT JOIN HOSVITAL.CENCOST cent ON (cent.CNCCOD = h.CNCCOD)
LEFT JOIN HOSVITAL.MAEEMP maeemp ON (maeemp.MENNIT = h.FHCCODCTO )
INNER JOIN HOSVITAL.EMPRESS empress ON (empress.mecntr =maeemp.MECNTR ) 
LEFT JOIN HOSVITAL.MAEMED1 m2 ON m2.MMUSUARIO = h51.RPRUSRRGS 
INNER JOIN HOSVITAL.HCCOM5 h5 ON  (h5.histipdoc=h51.histipdoc and h5.hisckey=h51.hisckey and h5.hiscsec=h51.hiscsec and h5.HCPRCCOD=h51.HCPRCCOD)
WHERE  DATE(h51.HCFCHRORD)>= '2019-07-01' AND DATE(h51.HCFCHRORD)<= '2019-07-31' AND mae.TPPRCD=3 
ORDER BY h51.HCFCHRORD;

select * from hosvital.hccom33 where hisckey= '41620865' and hiscsec = 1327;
select * from hosvital.hccom7 where hisckey= '41620865' and hiscsec = 1327;
select * from hosvital.hccom3des where hisckey= '41620865' and hiscsec = 1327;  --aqui hay algo

SELECT * FROM HOSVITAL