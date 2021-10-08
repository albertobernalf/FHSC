SELECT * FROM HOSVITAL.ADMGLO11 WHERE MPNFAC = 417227;


SELECT HOSVITAL.MAEATE.MPNFAC NUM_FACTURA, HOSVITAL.MAEATE.MPCEDU NUM_DOCUMENTO, HOSVITAL.CAPBAS.MPNOMC PACIENTE, HOSVITAL.MAEATE.MAFCHI FCH_INGRESO, HOSVITAL.MAEATE.MAFCHE FCH_EGRESO, HOSVITAL.MAEATE.MPMENI CONTRATO, HOSVITAL.MAEEMP.MENOMB PROVEEDOR, HOSVITAL.MAEEMP.MECNTR NIT, HOSVITAL.MAEATE.FACFCH FCH_FACTURA, ADMGLO01.AGlRemNr NUM_REMISION, ADMGLO01.AGlRemFc FCH_REMISION, HOSVITAL.MAEATE.MATOTP TOT_PROCEDIMIENTOS, HOSVITAL.MAEATE.MATOTS TOT_SUMINISTROS, HOSVITAL.MAEATE.MATOTF TOT_FACTURA, HOSVITAL.MAEATE.MAVALS VAL_SUBSIDIO, HOSVITAL.MAEATE.MAESTF EST_FACTURA, HOSVITAL.EMPRESS.EMPDSC EMPRESA
FROM (HOSVITAL.MAEATE
 INNER JOIN HOSVITAL.CAPBAS ON (HOSVITAL.MAEATE.MPTDOC = HOSVITAL.CAPBAS.MPTDOC) AND (HOSVITAL.MAEATE.MPCEDU = HOSVITAL.CAPBAS.MPCEDU))
 INNER JOIN HOSVITAL.MAEEMP ON HOSVITAL.MAEATE.MPMENI = HOSVITAL.MAEEMP.MENNIT 
LEFT JOIN HOSVITAL.ADMGLO11 ADMGLO11 ON ADMGLO11.MPNFAC = HOSVITAL.MAEATE.MPNFAC AND ADMGLO11.MATIPDOC = HOSVITAL.MAEATE.MATIPDOC 
LEFT JOIN HOSVITAL.ADMGLO01 ADMGLO01 ON ADMGLO01.AGlEmpCd = ADMGLO11.AGlEmpCd AND ADMGLO01.AGlMcdpt = ADMGLO11.AGlMcdpt AND ADMGLO01.AGlDocCd = ADMGLO11.AGlDocCd AND ADMGLO01.AGlRemNr = ADMGLO11.AGlRemNr
INNER JOIN HOSVITAL.EMPRESS ON (HOSVITAL.MAEEMP.MECNTR=HOSVITAL.EMPRESS.MECNTR)
WHERE HOSVITAL.MAEATE.MATIPDOC='2' AND HOSVITAL.MAEATE.MAESTF IN ('0','4') AND HOSVITAL.MAEATE.FACFCH>='2006-01-01' AND HOSVITAL.MAEATE.MPNFAC = 417227;


--------- 
---------
SELECT  m.mpnfac factura,m.mptdoc tipo_doc,m.mpcedu documento,cap.mpnomc paciente,m.mafchi ingreso,m.mafche egreso,m.mpmeni cod_contrato,mae.menomb contrato,mae.mecntr nit,m.facfch fch_factura,admglo01.aglremnr remision,
admglo01.aglremfc as fch_remision,

(select sum(m2.mavatp)
 from hosvital.maeate2 m2
 where m2.mpnfac=m.mpnfac and m2.fcptpotrn='F' and m2.maesanup<>'S'

) as procedimientos,
(
select sum(m3.mavats)
 from hosvital.maeate3 m3
 where m3.mpnfac=m.mpnfac and m3.fcstpotrn='F' and m3.maesanus<>'S'
) as suministros,
m.matotf as total_factura,m.mavals as valor_subsidio,m.maestf as estado_factura,e.empdsc as empresa
FROM hosvital.maeate m
inner join hosvital.capbas cap on (cap.mptdoc=m.mptdoc and cap.mpcedu=m.mpcedu)
inner join hosvital.maeemp mae on (mae.mennit = m.mpmeni)
left join hosvital.admglo11 admglo11 on (admglo11.mpnfac=m.mpnfac)
left join hosvital.admglo01 admglo01 on (admglo01.aglremnr=admglo11.aglremnr)
inner join hosvital.empress e on  (e.mecntr= mae.mecntr)
where m.matipdoc='2' and m.maestf in ('0','4') and m.facfch >= '2006-01-01' --  and m.mpnfac = 417227 
and admglo11.aglfacdev <> 'S'
order by m.facfch;
