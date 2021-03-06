SELECT HOSVITAL.CTRLCITAS.CITFCHHRA AS FECHA_HORA_ASIG,  HOSVITAL.MAEPRO.PRCODI AS COD_PROCEDIMIENTO, HOSVITAL.MAEPRO.PRNOMB AS PROCEDIMIENTO, HOSVITAL.CTRLCITAS.CITNUM AS NUM_CITA, HOSVITAL.CAPBAS.MPTDOC AS TIPO_DOC, HOSVITAL.CITMED1.CITCED AS IDENTIFICACION, HOSVITAL.CAPBAS.MPNOM1 AS NOMBRE_1, HOSVITAL.CAPBAS.MPNOM2 AS NOMBRE_2, HOSVITAL.CAPBAS.MPAPE1 AS APELLIDO_1, HOSVITAL.CAPBAS.MPAPE2 AS APELLIDO_2, HOSVITAL.CAPBAS.MPTELE AS TELEFONO,HOSVITAL.MAEESP.MENOME AS ESPECIALIDAD,DATE (HOSVITAL.CTRLCITAS.CITFCHHRA) AS FECHA_ASIG, HOSVITAL.CITMED1.CITFECSOL AS FECHA_SOL_PACIENTE, HOSVITAL.CITMED.CITFEC AS FECHA_CITA,HOSVITAL.CAPBAS.MPFCHN AS FECHA_NACIMIENTO,(YEAR(HOSVITAL.CITMED.CITFEC) - YEAR(HOSVITAL.CAPBAS.MPFCHN )) AS EDAD, HOSVITAL.CAPBAS.MPSEXO AS SEXO, HOSVITAL.CAPBAS.MDCODM AS MUNICIPIO, HOSVITAL.MAEMED1.MMNOMM AS MEDICO,  CASE  HOSVITAL.CITMED.CITESTP WHEN 'A' THEN 'ATENDIDA' WHEN 'C' THEN 'CONFIRMADA' WHEN 'F' THEN 'FACTURADA' WHEN 'R' THEN 'RESERVADA' WHEN 'N' THEN 'CANCELADA' WHEN 'I' THEN 'INCUMPLIDA' END AS ESTADO_CITA,  HOSVITAL.CONSUL.CONSDET AS CONSULTORIO, HOSVITAL.CITMED.CITTIEMPO AS TIEMPO_CITA, HOSVITAL.EMPRESS.MECNTR AS NIT, HOSVITAL.EMPRESS.EMPDSC AS CONTRATO, HOSVITAL.CITMED1.CITFOLIO AS FOLIO, HOSVITAL.CTRLCITAS.CITCMBDTO AS FILTRO , HOSVITAL.CTRLCITAS.CITOBS AS OBSERVACIONES, HOSVITAL.CTRLCITAS.CITUSRCIT AS PROGRAMADOR, HOSVITAL.CTRLCITAS.CITMTV AS MOTIVO_CANC  FROM (((((((((HOSVITAL.CTRLCITAS INNER JOIN HOSVITAL.CITMED ON (HOSVITAL.CTRLCITAS.CITNUM = HOSVITAL.CITMED.CITNUM) AND (HOSVITAL.CTRLCITAS.CITSED = HOSVITAL.CITMED.CITSED) AND (HOSVITAL.CTRLCITAS.CITEMP = HOSVITAL.CITMED.CITEMP)) INNER JOIN HOSVITAL.CITMED1 ON HOSVITAL.CITMED.CITNUM = HOSVITAL.CITMED1.CITNUM) INNER JOIN HOSVITAL.CAPBAS ON HOSVITAL.CITMED1.CITCED = HOSVITAL.CAPBAS.MPCEDU) INNER JOIN HOSVITAL.CITMED2 ON (HOSVITAL.CITMED.CITNUM = HOSVITAL.CITMED2.CITNUM) AND(HOSVITAL.CITMED.CITSED = HOSVITAL.CITMED2.CITSED) AND (HOSVITAL.CITMED.CITEMP = HOSVITAL.CITMED2.CITEMP)) INNER JOIN HOSVITAL.MAEMED1 ON HOSVITAL.CITMED2.MMCODM = HOSVITAL.MAEMED1.MMCODM) INNER JOIN HOSVITAL.MAEESP ON HOSVITAL.CITMED2.MECODE = HOSVITAL.MAEESP.MECODE) INNER JOIN HOSVITAL.CONSUL ON HOSVITAL.CITMED.CITCONS = HOSVITAL.CONSUL.CONSCOD) INNER JOIN HOSVITAL.MAEEMP ON HOSVITAL.CITMED1.CITNROCTO = HOSVITAL.MAEEMP.MENNIT) INNER JOIN HOSVITAL.EMPRESS ON HOSVITAL.MAEEMP.MECNTR = HOSVITAL.EMPRESS.MECNTR) INNER JOIN HOSVITAL.MAEPRO ON HOSVITAL.CITMED.CITPRO = HOSVITAL.MAEPRO.PRCODI 
WHERE DATE(CITFEC)>='2020-10-01' AND DATE(CITFEC)<='2020-10-31';


-- Query Nuevo  Detalle

SELECT ctrl.CITFCHHRA AS FECHA_LLAMADA,  maepro.PRCODI AS COD_PROCEDIMIENTO, maepro.PRNOMB AS PROCEDIMIENTO, ctrl.CITNUM AS NUM_CITA, cap.MPTDOC AS TIPO_DOC, c1.CITCED AS IDENTIFICACION, cap.MPNOM1 AS NOMBRE_1, cap.MPNOM2 AS NOMBRE_2, cap.MPAPE1 AS APELLIDO_1, cap.MPAPE2 AS APELLIDO_2, cap.MPTELE AS TELEFONO,maeesp.MENOME AS ESPECIALIDAD,DATE (ctrl.CITFCHHRA) AS FECHA_ASIG, c1.CITFECSOL AS FECHA_SOL_PACIENTE, c.CITFEC AS FECHA_CITA, 
cap.MPFCHN AS FECHA_NACIMIENTO,(YEAR(c.CITFEC) - YEAR(cap.MPFCHN )) AS EDAD, cap.MPSEXO AS SEXO, cap.MDCODM AS MUNICIPIO, maemed1.MMNOMM AS MEDICO,  CASE  c.CITESTP WHEN 'A' THEN 'ATENDIDA' WHEN 'C' THEN 'CONFIRMADA' WHEN 'F' THEN 'FACTURADA' WHEN 'R' THEN 'RESERVADA' WHEN 'N' THEN 'CANCELADA' WHEN 'I' THEN 'INCUMPLIDA' END AS ESTADO_FINAL_CITA,  consul.CONSDET AS CONSULTORIO, c.CITTIEMPO AS TIEMPO_CITA, e.MECNTR AS NIT, e.EMPDSC AS CONTRATO, c1.CITFOLIO AS FOLIO, ctrl.CITCMBDTO AS FILTRO , ctrl.CITOBS AS OBSERVACIONES, ctrl.CITUSRCIT AS PROGRAMADOR, 
(SELECT ctrl2.CITMTV  from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and ctrl2.citcmbdto='CANCELADA') AS MOTIVO_CANC 
FROM HOSVITAL.CTRLCITAS ctrl
INNER JOIN HOSVITAL.CITMED  c ON (c.citnum = ctrl.citnum and c.citsed=ctrl.citsed and c.citemp=ctrl.citemp)
INNER JOIN HOSVITAL.CITMED1 c1 ON (c1.citnum=c.citnum)
INNER JOIN HOSVITAL.CAPBAS cap ON (cap.mptdoc=c1.cittipdoc and cap.mpcedu=c1.citced)
INNER JOIN HOSVITAL.CITMED2 c2 ON (c2.citnum= c1.citnum and c2.citsed = c1.citsed and c2.citemp=c1.citemp) 
INNER JOIN HOSVITAL.MAEMED1 maemed1 ON (maemed1.mmcodm = c2.mmcodm )
 INNER JOIN HOSVITAL.MAEESP maeesp ON (maeesp.mecode=c2.mecode)
INNER JOIN HOSVITAL.CONSUL consul ON (consul.conscod= c.citcons) 
INNER JOIN HOSVITAL.MAEEMP  maeemp ON (maeemp.mennit = c1.citnrocto)
INNER JOIN HOSVITAL.EMPRESS e ON (e.mecntr = maeemp.mecntr)
INNER JOIN HOSVITAL.MAEPRO maepro ON (maepro.prcodi = c.citpro)  
WHERE DATE(c.citfec)>='2020-10-01' AND DATE(c.citfec)<='2020-10-31' and  ctrl.citcmbdto='RESERVADA'   ; -- and c1.citced='1033794096'	;

-- El consolidado Especialidad


SELECT maeesp.MENOME AS ESPECIALIDAD,  CASE  c.CITESTP WHEN 'A' THEN 'ATENDIDA' WHEN 'C' THEN 'CONFIRMADA' WHEN 'F' THEN 'FACTURADA' WHEN 'R' THEN 'RESERVADA' WHEN 'N' THEN 'CANCELADA' WHEN 'I' THEN 'INCUMPLIDA' END AS ESTADO_FINAL_CITA,
COUNT(*)
FROM HOSVITAL.CTRLCITAS ctrl
INNER JOIN HOSVITAL.CITMED  c ON (c.citnum = ctrl.citnum and c.citsed=ctrl.citsed and c.citemp=ctrl.citemp)
INNER JOIN HOSVITAL.CITMED1 c1 ON (c1.citnum=c.citnum)
INNER JOIN HOSVITAL.CAPBAS cap ON (cap.mptdoc=c1.cittipdoc and cap.mpcedu=c1.citced)
INNER JOIN HOSVITAL.CITMED2 c2 ON (c2.citnum= c1.citnum and c2.citsed = c1.citsed and c2.citemp=c1.citemp) 
INNER JOIN HOSVITAL.MAEMED1 maemed1 ON (maemed1.mmcodm = c2.mmcodm )
 INNER JOIN HOSVITAL.MAEESP maeesp ON (maeesp.mecode=c2.mecode)
INNER JOIN HOSVITAL.CONSUL consul ON (consul.conscod= c.citcons) 
INNER JOIN HOSVITAL.MAEEMP  maeemp ON (maeemp.mennit = c1.citnrocto)
INNER JOIN HOSVITAL.EMPRESS e ON (e.mecntr = maeemp.mecntr)
INNER JOIN HOSVITAL.MAEPRO maepro ON (maepro.prcodi = c.citpro)  
WHERE DATE(c.citfec)>='2020-10-01' AND DATE(c.citfec)<='2020-10-31' and  ctrl.citcmbdto='RESERVADA' -- and c1.citced='1033794096'	
GROUP BY  maeesp.MENOME,c.CITESTP; 



-- El consolidado Empresa


SELECT e.EMPDSC AS CONTRATO,  CASE  c.CITESTP WHEN 'A' THEN 'ATENDIDA' WHEN 'C' THEN 'CONFIRMADA' WHEN 'F' THEN 'FACTURADA' WHEN 'R' THEN 'RESERVADA' WHEN 'N' THEN 'CANCELADA' WHEN 'I' THEN 'INCUMPLIDA' END AS ESTADO_FINAL_CITA,
COUNT(*)
FROM HOSVITAL.CTRLCITAS ctrl
INNER JOIN HOSVITAL.CITMED  c ON (c.citnum = ctrl.citnum and c.citsed=ctrl.citsed and c.citemp=ctrl.citemp)
INNER JOIN HOSVITAL.CITMED1 c1 ON (c1.citnum=c.citnum)
INNER JOIN HOSVITAL.CAPBAS cap ON (cap.mptdoc=c1.cittipdoc and cap.mpcedu=c1.citced)
INNER JOIN HOSVITAL.CITMED2 c2 ON (c2.citnum= c1.citnum and c2.citsed = c1.citsed and c2.citemp=c1.citemp) 
INNER JOIN HOSVITAL.MAEMED1 maemed1 ON (maemed1.mmcodm = c2.mmcodm )
 INNER JOIN HOSVITAL.MAEESP maeesp ON (maeesp.mecode=c2.mecode)
INNER JOIN HOSVITAL.CONSUL consul ON (consul.conscod= c.citcons) 
INNER JOIN HOSVITAL.MAEEMP  maeemp ON (maeemp.mennit = c1.citnrocto)
INNER JOIN HOSVITAL.EMPRESS e ON (e.mecntr = maeemp.mecntr)
INNER JOIN HOSVITAL.MAEPRO maepro ON (maepro.prcodi = c.citpro)  
WHERE DATE(c.citfec)>='2020-10-01' AND DATE(c.citfec)<='2020-10-31' and  ctrl.citcmbdto='RESERVADA' -- and c1.citced='1033794096'	
GROUP BY  e.EMPDSC ,c.CITESTP; 


-- Cancelacion de Citas No lo pude hacer


SELECT ctrl.citmvt, (SELECT ctrl2.CITMTV  from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and ctrl2.citcmbdto='CANCELADA') AS MOTIVO_CANC ,COUNT(*)
FROM HOSVITAL.CTRLCITAS ctrl
INNER JOIN HOSVITAL.CITMED  c ON (c.citnum = ctrl.citnum and c.citsed=ctrl.citsed and c.citemp=ctrl.citemp)
INNER JOIN HOSVITAL.CITMED1 c1 ON (c1.citnum=c.citnum)
INNER JOIN HOSVITAL.CAPBAS cap ON (cap.mptdoc=c1.cittipdoc and cap.mpcedu=c1.citced)
INNER JOIN HOSVITAL.CITMED2 c2 ON (c2.citnum= c1.citnum and c2.citsed = c1.citsed and c2.citemp=c1.citemp) 
INNER JOIN HOSVITAL.MAEMED1 maemed1 ON (maemed1.mmcodm = c2.mmcodm )
 INNER JOIN HOSVITAL.MAEESP maeesp ON (maeesp.mecode=c2.mecode)
INNER JOIN HOSVITAL.CONSUL consul ON (consul.conscod= c.citcons) 
INNER JOIN HOSVITAL.MAEEMP  maeemp ON (maeemp.mennit = c1.citnrocto)
INNER JOIN HOSVITAL.EMPRESS e ON (e.mecntr = maeemp.mecntr)
INNER JOIN HOSVITAL.MAEPRO maepro ON (maepro.prcodi = c.citpro)  
WHERE DATE(c.citfec)>='2020-10-01' AND DATE(c.citfec)<='2020-10-31' and  ctrl.citcmbdto='RESERVADA' -- and c1.citced='1033794096'	
GROUP BY  ctrl.citmvt; 

-- Oportunidad Asignacion de citas


SELECT maeesp.MENOME AS ESPECIALIDAD, sum(c.citfec - DATE (ctrl.CITFCHHRA) ) DIAS ,
COUNT(*) total_citas , sum(c.citfec - DATE (ctrl.CITFCHHRA) )/COUNT(*) Oportunidad
FROM HOSVITAL.CTRLCITAS ctrl
INNER JOIN HOSVITAL.CITMED  c ON (c.citnum = ctrl.citnum and c.citsed=ctrl.citsed and c.citemp=ctrl.citemp)
INNER JOIN HOSVITAL.CITMED1 c1 ON (c1.citnum=c.citnum)
INNER JOIN HOSVITAL.CAPBAS cap ON (cap.mptdoc=c1.cittipdoc and cap.mpcedu=c1.citced)
INNER JOIN HOSVITAL.CITMED2 c2 ON (c2.citnum= c1.citnum and c2.citsed = c1.citsed and c2.citemp=c1.citemp) 
INNER JOIN HOSVITAL.MAEMED1 maemed1 ON (maemed1.mmcodm = c2.mmcodm )
 INNER JOIN HOSVITAL.MAEESP maeesp ON (maeesp.mecode=c2.mecode)
INNER JOIN HOSVITAL.CONSUL consul ON (consul.conscod= c.citcons) 
INNER JOIN HOSVITAL.MAEEMP  maeemp ON (maeemp.mennit = c1.citnrocto)
INNER JOIN HOSVITAL.EMPRESS e ON (e.mecntr = maeemp.mecntr)
INNER JOIN HOSVITAL.MAEPRO maepro ON (maepro.prcodi = c.citpro)  
WHERE DATE(c.citfec)>='2020-10-01' AND DATE(c.citfec)<='2020-10-31' and  ctrl.citcmbdto='RESERVADA' and c.CITESTP  not in ('N','I')  -- and c1.citced='1033794096'	
GROUP BY  maeesp.MENOME
order by   maeesp.MENOME; 

-- Consulta Primera Vez



SELECT maeesp.MENOME AS ESPECIALIDAD,   sum(c.citfec - DATE (ctrl.CITFCHHRA) ) DIAS , COUNT(*)  num_citas , sum(c.citfec - DATE (ctrl.CITFCHHRA) )/COUNT(*) Oportunidad
FROM HOSVITAL.CTRLCITAS ctrl
INNER JOIN HOSVITAL.CITMED  c ON (c.citnum = ctrl.citnum and c.citsed=ctrl.citsed and c.citemp=ctrl.citemp)
INNER JOIN HOSVITAL.CITMED1 c1 ON (c1.citnum=c.citnum)
INNER JOIN HOSVITAL.CAPBAS cap ON (cap.mptdoc=c1.cittipdoc and cap.mpcedu=c1.citced)
INNER JOIN HOSVITAL.CITMED2 c2 ON (c2.citnum= c1.citnum and c2.citsed = c1.citsed and c2.citemp=c1.citemp) 
INNER JOIN HOSVITAL.MAEMED1 maemed1 ON (maemed1.mmcodm = c2.mmcodm )
 INNER JOIN HOSVITAL.MAEESP maeesp ON (maeesp.mecode=c2.mecode)
INNER JOIN HOSVITAL.CONSUL consul ON (consul.conscod= c.citcons) 
INNER JOIN HOSVITAL.MAEEMP  maeemp ON (maeemp.mennit = c1.citnrocto)
INNER JOIN HOSVITAL.EMPRESS e ON (e.mecntr = maeemp.mecntr)
INNER JOIN HOSVITAL.MAEPRO maepro ON (maepro.prcodi = c.citpro)  
WHERE DATE(c.citfec)>='2020-10-01' AND DATE(c.citfec)<='2020-10-31' and  ctrl.citcmbdto='RESERVADA'  and maepro.prnomb like ('%PRI%VE%')
GROUP BY  maeesp.MENOME; 
