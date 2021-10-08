/*

Reciban un cordial saludo area TIC, por medio de la presente solicito respetuosamente verificar si para el mes de septiembre hay la posibilidad de verificar por hosvital, los siguiente.
--CONSULTA CITAS
-- INTERCONSULTAS_CANTIDAD_TRABSOC_PSICO
-- REPORTE INTERCONSULTAS PSICOLOGIA
-- REPORTE INTERCONSULTAS TRABAJO SOCIAL

1- la cantidad de interconsultas generadas para el servicio de Trabajo Social y Psicología .
2- Tiempo de respuesta de las interconsulta desde el momento que se genera al momento que se responde.
3- Si hay la posibilidad que a mi perfil de Hosvital como coordinadora de Oficina de Atención al usuario, me permita verificar a diario cuantas interconsultas hay para el servicio de psicología y de Trabajo social.
4- Cantidad de pacientes atendidos en el mes de forma conjunta con el servicio de psiquiatría y de psicología y los días de estancia hospitalaria de esos pacientes.

*/

select * from hosvital.intercn;
select * from hosvital.intercn1;

select * from hosvital.maeesp where menome like ('TRABA%');; -- 661	TRABAJO SOCIAL                                                        	
select * from hosvital.maeesp where menome like ('%SICO%');  

SELECT I.MECODE,MAE.MENOME, COUNT(*)
FROM HOSVITAL.INTERCN I
INNER JOIN HOSVITAL.MAEESP MAE ON (MAE.MECODE= I.MECODE)
WHERE I.INTFCHRSL>='2020-08-01 00:00:00' AND   I.INTFCHRSL<='2020-08-31 23:59:59' AND I.MECODE IN (661,680,794)
GROUP BY  I.MECODE,MAE.MENOME;


-- tIEMPOS DE iNTERCONSULTAS

SELECT I.HISTIPDOC,I.HISCKEY, C.MPNOMC, MAE.MENOME,H.HISFHORAT,I.INTFCHRSL,(I.INTFCHRSL - H.HISFHORAT)
FROM HOSVITAL.INTERCN I
INNER JOIN HOSVITAL.HCCOM1 H ON (H.HISTIPDOC=I.HISTIPDOC AND H.HISCKEY = I.HISCKEY AND H.HISCSEC = I.HISCSEC)
INNER JOIN HOSVITAL.CAPBAS C ON (C.MPTDOC = I.HISTIPDOC AND C.MPCEDU=I.HISCKEY)
INNER JOIN HOSVITAL.MAEESP MAE ON (MAE.MECODE= I.MECODE)
WHERE H.HISFHORAT >= '2020-08-01 00:00:00' AND H.HISFHORAT <= '2020-08-05 00:00:00' AND I.MECODE IN (661,680,794);



-- EVOLUCIONES

SELECT H.HISTIPDOC TIPO_DOC,H.HISCKEY DOCUMENTO, H.HISCSEC FOLIO, C.MPNOMC PACIENTE , MAE.MENOME ESPECIALIDAD,H.HISFHORAT FECHA
FROM HOSVITAL.HCCOM1 H 
INNER JOIN HOSVITAL.CAPBAS C ON (C.MPTDOC = H.HISTIPDOC AND C.MPCEDU=H.HISCKEY)
INNER JOIN HOSVITAL.MAEESP MAE ON (MAE.MECODE= H.HCESP)
WHERE H.HISFHORAT >= '2020-08-01 00:00:00' AND H.HISFHORAT <= '2020-08-05 00:00:00' AND H.HCESP IN (661,680,794);

-- query para dias de estancia


SELECT H.HISTIPDOC TIPO_DOC,H.HISCKEY DOCUMENTO,  C.MPNOMC PACIENTE , MAE.MENOME ESPECIALIDAD,H.HISFHORAT FECHA,
I.INGFECEGR AS EGRESO, I.INGFECADM AS INGRESO

FROM HOSVITAL.HCCOM1 H 
INNER JOIN HOSVITAL.CAPBAS C ON (C.MPTDOC = H.HISTIPDOC AND C.MPCEDU=H.HISCKEY)
INNER JOIN HOSVITAL.MAEESP MAE ON (MAE.MECODE= H.HCESP)
inner join HOSVITAL.INGRESOS I ON (I.MPTDOC = C.MPTDOC AND I.MPCEDU = C.MPCEDU AND I.INGCSC =H.HCTVIN1)
WHERE H.HISFHORAT >= '2020-08-01 00:00:00' AND H.HISFHORAT <= '2020-08-05 00:00:00' AND H.HCESP IN (661,680,794)
GROUP BY  H.HISTIPDOC ,H.HISCKEY , C.MPNOMC , MAE.MENOME ,H.HISFHORAT ,I.INGFECEGR, I.INGFECADM ;





