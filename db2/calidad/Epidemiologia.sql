SELECT maepab.mpcodp as cod_pabellon,maepab.mpnomp as pabellon,m11.mpnumc as cama,m11.hiscamedo estado_cama, m11.hiscamfec fecha, m11.hiscamhor hora, i.mptdoc tipo_doc,i.mpcedu documento,cap.mpnomc paciente,cap.mpsexo genero,cap.mpfchn fecha_nac,i.ingcsc csc_ingreso,i.ingsaldx as Diagnostico_salida,emp.menomb contrato,i.ingfecadm fecha_ingreso,cap.mdcodd cod_departamento, maedmb.mdnomd  departamento,cap.mdcodm cod_localidad,maedmb1.mdnomm localidad,cap.mdcodb cod_barrio, maedmb2.mdnomb barrio 
FROM hosvital.ingresos i 
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu) 
inner join hosvital.maepab11 m11 on (m11.mptdoc=i.mptdoc and m11.mpcedu =i.mpcedu and m11.hiscnsing=i.ingcsc) 
inner join hosvital.maepab maepab on (maepab.mpcodp= m11.mpcodp) 
inner join hosvital.maeemp emp  on (emp.mennit=i.ingnit) 
inner join hosvital.maedmb maedmb on (MAEDMB.MDCODD=CAP.MDCODD)
 inner  join hosvital.maedmb1 maedmb1 on (MAEDMB1.MDCODM =CAP.MDCODM AND MAEDMB1.MDCODD=CAP.MDCODD) 
inner join hosvital.maedmb2 maedmb2 on (MAEDMB2.MDCODM=CAP.MDCODM AND MAEDMB2.MDCODD=CAP.MDCODD AND MAEDMB2.MDCODB =CAP.MDCODB) 
where i.ingfecadm>='2021-01-01 00:00:0' and i.ingfecadm<='2021-01-31 23:59:59'
order by i.mptdoc,i.mpcedu, m11.hiscamfec,m11.hiscamhor;


-- QUERY SIN CAMA Y ESPECIALIDAD

SELECT i.mpcodp as cod_pabellon,maepab.mpnomp as pabellon, i.mptdoc tipo_doc,i.mpcedu documento,cap.mpnomc paciente,cap.mpsexo genero,cap.mpfchn fecha_nac,i.ingcsc csc_ingreso,i.ingsaldx as Diagnostico_salida,emp.menomb contrato,i.ingfecadm fecha_ingreso,cap.mdcodd cod_departamento, maedmb.mdnomd  departamento,cap.mdcodm cod_localidad,maedmb1.mdnomm localidad,cap.mdcodb cod_barrio, maedmb2.mdnomb barrio , esp.menome
FROM hosvital.ingresos i 
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu) 
--inner join hosvital.maepab11 m11 on (m11.mptdoc=i.mptdoc and m11.mpcedu =i.mpcedu and m11.hiscnsing=i.ingcsc) 
inner join hosvital.maepab maepab on (maepab.mpcodp= i.mpcodp) 
inner join hosvital.maeemp emp  on (emp.mennit=i.ingnit) 
inner join hosvital.maemed1 maemed1 on (maemed1.mmusuario =i.ingusrsal)
inner join hosvital.maemed maemed on (maemed.mmcodm= maemed1.mmcodm)
inner join hosvital.maeesp esp on (esp.mecode=maemed.mecode)
inner join hosvital.maedmb maedmb on (MAEDMB.MDCODD=CAP.MDCODD)
 inner  join hosvital.maedmb1 maedmb1 on (MAEDMB1.MDCODM =CAP.MDCODM AND MAEDMB1.MDCODD=CAP.MDCODD) 
inner join hosvital.maedmb2 maedmb2 on (MAEDMB2.MDCODM=CAP.MDCODM AND MAEDMB2.MDCODD=CAP.MDCODD AND MAEDMB2.MDCODB =CAP.MDCODB) 
where i.ingfecadm>='2021-01-01 00:00:0' and i.ingfecadm<='2021-01-31 23:59:59'
order by i.mptdoc,i.mpcedu,ingcsc;


SELECT INGCSC,MPCODP FROM HOSVITAL.INGRESOS WHERE MPCEDU ='75093403';     
SELECT * FROM HOSVITAL.CAPBAS WHERE MPCEDU='1000078399';
SELECT * FROM HOSVITAL.MAEEMP WHERE MENNIT='NUEVACONTRB21';

select * from hosvital.maemed1;
select * from hosvital.maemed;
select * from hosvital.maeesp;
SELECT * FROM HOSVITAL.MAEPAB;

SELECT CASE WHEN M.MPCLAPRO='1' THEN 'Ambulatorio'  WHEN M.MPCLAPRO='2' THEN 'Hospitalizado' WHEN M.MPCLAPRO='3' OR M.MPCLAPRO='4' THEN 'Urgencias' WHEN M.MPCLAPRO='5' THEN 'Triage' END,            COUNT(*)
FROM HOSVITAL.INGRESOS I
INNER JOIN HOSVITAL.MAEPAB M ON (M.MPCODP=I.MPCODP)
WHERE I.INGFECADM>= '2020-01-01 00:00:00' AND  I.INGFECADM < '2020-12-31 23:59:59' AND I.INGFECEGR <>  '0001-01-01 00:00:00.00000'
GROUP BY M.MPCLAPRO;

/*

Ambulatorio	10254	
Hospitalizado	820	
Urgencias	4319	
Triage	20851	

*/

SELECT * FROM HOSVITAL.INGRESOS
WHERE INGFECADM>= '2020-01-01 00:00:00' AND  INGFECADM < '2020-12-31 23:59:59' AND INGFECEGR <>  '0001-01-01 00:00:00.00000' AND CLAPRO='1' AND INGNUMCIT <> 1;


SELECT COUNT(*) FROM HOSVITAL.INGRESOS
WHERE INGFECADM>= '2020-01-01 00:00:00' AND  INGFECADM < '2020-12-31 23:59:59' AND INGFECEGR <>  '0001-01-01 00:00:00.00000' AND CLAPRO='1' AND INGNUMCIT <> 1; -- 10254

SELECT * FROM HOSVITAL.CITMED  WHERE CITFEC >= '2020-01-01'   AND CITFEC <= '2020-12-31' AND CITESTP IN ('F','A');	

SELECT COUNT(*) FROM HOSVITAL.CITMED  WHERE CITFEC >= '2020-01-01'   AND CITFEC <= '2020-12-31' AND CITESTP IN ('F','A');  -- 6857
SELECT COUNT(*) FROM HOSVITAL.CITMED  WHERE CITFEC >= '2020-01-01'   AND CITFEC <= '2020-12-31' AND CITESTP IN ('F','A','C');  -- 8389	
	

