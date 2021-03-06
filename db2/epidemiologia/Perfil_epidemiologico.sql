-- Archivo Excel

SELECT HOSVITAL.MAEPAB11.MPCODP AS COD_PABELLON, HOSVITAL.MAEPAB.MPNOMP AS PABELLON, HOSVITAL.MAEPAB11.MPNUMC AS CAMA, HOSVITAL.MAEPAB11.HISCAMEDO AS ESTADO_CAMA, HOSVITAL.MAEPAB11.HISCAMFEC AS FECHA, HOSVITAL.MAEPAB11.HISCAMHOR AS HORA, HOSVITAL.MAEPAB11.MPCEDU AS IDENTIFICACION, HOSVITAL.MAEPAB11.MPTDOC AS TIPO_IDEN, HOSVITAL.CAPBAS.MPNOMC AS NOMBRE, HOSVITAL.CAPBAS.MPSEXO AS SEXO, HOSVITAL.CAPBAS.MPFCHN  AS FECHA_NAC, HOSVITAL.MAEPAB11.HISCNSING AS CONSEC_INGRE, HOSVITAL.INGRESOS.INGSALDX AS DIAGNOSTICO_SALIDA FROM (HOSVITAL.MAEPAB11 INNER JOIN HOSVITAL.MAEPAB ON HOSVITAL.MAEPAB11.MPCODP = HOSVITAL.MAEPAB.MPCODP) INNER JOIN HOSVITAL.CAPBAS ON (HOSVITAL.MAEPAB11.MPTDOC = HOSVITAL.CAPBAS.MPTDOC) AND (HOSVITAL.MAEPAB11.MPCEDU = HOSVITAL.CAPBAS.MPCEDU) INNER JOIN HOSVITAL.INGRESOS ON(HOSVITAL.MAEPAB11.MPCEDU=HOSVITAL.INGRESOS.MPCEDU) AND (HOSVITAL.MAEPAB11.MPTDOC=HOSVITAL.INGRESOS.MPTDOC) WHERE (((HOSVITAL.MAEPAB11.HISCAMFEC)>='2021-01-01' And (HOSVITAL.MAEPAB11.HISCAMFEC)<='2021-01-31'));

-- Archivo Report
-- Reportes de calidad/Perfil

SELECT MAEPAB.MPCODP AS COD_PABELLON,MAEPAB.MPNOMP,I.MPNUMC,I.MPTDOC,I.MPCEDU AS TIPO_IDEN, C.MPNOMC AS NOMBRE, C.MPSEXO AS GENERO,C.MPFCHN AS FECHA_NAC,I.INGCSC AS CONSEC_INGRE,I.INGSALDX AS DIAGNOSTICO_SALIDA,M.MENOMB, I.INGFECADM AS FECHA_INGRESO, C.MDCODD COD_DEPARTAMENTO,MAEDMB.MDNOMD DEPARTAMENTO, C.MDCODM COD_LOCALIDAD,
MAEDMB1.MDNOMM LOCALIDAD, C.MDCODB COD_BARRIO, MAEDMB2.MDNOMB BARRIO
 FROM HOSVITAL.INGRESOS I INNER JOIN HOSVITAL.MAEPAB MAEPAB ON (MAEPAB.MPCODP=I.MPCODP) INNER JOIN HOSVITAL.CAPBAS C ON (C.MPTDOC=I.MPTDOC AND C.MPCEDU=I.MPCEDU) INNER JOIN HOSVITAL.MAEEMP M ON (M.MENNIT=I.INGNIT) INNER JOIN HOSVITAL.MAEDMB MAEDMB ON (MAEDMB.MDCODD=C.MDCODD) INNER JOIN HOSVITAL.MAEDMB1 MAEDMB1 ON (MAEDMB1.MDCODM =C.MDCODM AND MAEDMB1.MDCODD=C.MDCODD) INNER JOIN HOSVITAL.MAEDMB2 MAEDMB2 ON (MAEDMB2.MDCODM=C.MDCODM AND MAEDMB2.MDCODD=C.MDCODD AND MAEDMB2.MDCODB =C.MDCODB) WHERE I.INGFECADM>='2021-01-01 00:00:00' AND I.INGFECADM<='2021-01-31 23:59:59' ORDER BY I.MPCEDU;


-- Super Query...
select * from hosvital.maepab11;
select * from hosvital.maepab;


SELECT maepab.mpcodp as cod_pabellon,maepab.mpnomp as pabellon,m11.mpnumc as cama,m11.hiscamedo estado_cama, m11.hiscamfec fecha, m11.hiscamhor hora, i.mptdoc tipo_doc,i.mpcedu documento,cap.mpnomc paciente,cap.mpsexo genero,cap.mpfchn fecha_nac,i.ingcsc csc_ingreso,
i.ingsaldx as Diagnostico_salida,emp.menomb contrato,i.ingfecadm  fecha_ingreso,cap.mdcodd cod_departamento, maedmb.mdnomd  departamento,cap.mdcodm cod_localidad,maedmb1.mdnomm localidad,
cap.mdcodb cod_barrio, maedmb2.mdnomb barrio
FROM hosvital.ingresos i
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
inner join hosvital.maepab11 m11 on (m11.mptdoc=i.mptdoc and m11.mpcedu =i.mpcedu and m11.hiscnsing=i.ingcsc)
inner join hosvital.maepab  maepab on (maepab.mpcodp= m11.mpcodp)
inner join hosvital.maeemp emp  on (emp.mennit=i.ingnit)
inner join hosvital.maedmb maedmb  on (MAEDMB.MDCODD=CAP.MDCODD)
inner  join hosvital.maedmb1 maedmb1  on (MAEDMB1.MDCODM =CAP.MDCODM AND MAEDMB1.MDCODD=CAP.MDCODD)
inner join hosvital.maedmb2  maedmb2  on (MAEDMB2.MDCODM=CAP.MDCODM AND MAEDMB2.MDCODD=CAP.MDCODD AND MAEDMB2.MDCODB =CAP.MDCODB)
where i.ingfecadm >= '2021-01-01 00:00:00' and i.ingfecadm<= '2021-03-31 23:59:59'
order by i.mptdoc,i.mpcedu;

