SELECT HOSVITAL.MAEATE.MPNFAC NUM_FACTURA, HOSVITAL.MAEATE.MPCEDU NUM_DOCUMENTO, HOSVITAL.CAPBAS.MPNOMC PACIENTE, HOSVITAL.MAEATE.MAFCHI FCH_INGRESO, HOSVITAL.MAEATE.MAFCHE FCH_EGRESO, HOSVITAL.MAEATE.MPMENI CONTRATO, HOSVITAL.MAEEMP.MENOMB PROVEEDOR, HOSVITAL.MAEEMP.MECNTR NIT, HOSVITAL.MAEATE.FACFCH FCH_FACTURA, ADMGLO01.AGlRemNr NUM_REMISION, ADMGLO01.AGlRemFc FCH_REMISION, HOSVITAL.MAEATE.MATOTP TOT_PROCEDIMIENTOS, HOSVITAL.MAEATE.MATOTS TOT_SUMINISTROS, HOSVITAL.MAEATE.MATOTF TOT_FACTURA, HOSVITAL.MAEATE.MAVALS VAL_SUBSIDIO, HOSVITAL.MAEATE.MAESTF EST_FACTURA, HOSVITAL.EMPRESS.EMPDSC EMPRESA
FROM (HOSVITAL.MAEATE
 INNER JOIN HOSVITAL.CAPBAS ON (HOSVITAL.MAEATE.MPTDOC = HOSVITAL.CAPBAS.MPTDOC) AND (HOSVITAL.MAEATE.MPCEDU = HOSVITAL.CAPBAS.MPCEDU))
 INNER JOIN HOSVITAL.MAEEMP ON HOSVITAL.MAEATE.MPMENI = HOSVITAL.MAEEMP.MENNIT
 LEFT JOIN HOSVITAL.ADMGLO11 ADMGLO11 ON ADMGLO11.MPNFAC = HOSVITAL.MAEATE.MPNFAC AND ADMGLO11.MATIPDOC = HOSVITAL.MAEATE.MATIPDOC 
LEFT JOIN HOSVITAL.ADMGLO01 ADMGLO01 ON ADMGLO01.AGlEmpCd = ADMGLO11.AGlEmpCd AND ADMGLO01.AGlMcdpt = ADMGLO11.AGlMcdpt AND ADMGLO01.AGlDocCd = ADMGLO11.AGlDocCd AND ADMGLO01.AGlRemNr = ADMGLO11.AGlRemNr
INNER JOIN HOSVITAL.EMPRESS ON (HOSVITAL.MAEEMP.MECNTR=HOSVITAL.EMPRESS.MECNTR)
WHERE HOSVITAL.MAEATE.MATIPDOC='2' AND HOSVITAL.MAEATE.MAESTF IN ('0','4') AND HOSVITAL.MAEATE.FACFCH>='2006-01-01' 

order by  HOSVITAL.MAEATE.MPNFAC;

---------------------------
---------------------------
select * from hosvital.maeemp;
select * from hosvital.maeate where mpnfac =133529;
select * from hosvital.maeate2 where mpnfac =13689;
select * from hosvital.admglo11;
select * from hosvital.admglo01;

select mae.mpnfac as factura,c.mptdoc as tipo_doc, c.mpcedu as documento, c.mpnomc as paciente,i.ingfecadm as ingreso, i.ingfecegr as egreso,mae.mpmeni, memp.menomb as contrato ,memp.mecntr as nit,
mae.facfch as fecha_factura,ad2.aglremnr as numero_remision,ad1.aglremfc as fecha_remision,mae.matotp as total_procedimientos,mae.matots as total_sumnistros,mae.matotf as total_factura,mae.mavals as valor_subsidiado,mae.maestf as estado_factura
from hosvital.maeate mae
inner join hosvital.capbas c on (c.mptdoc=mae.mptdoc and c.mpcedu=mae.mpcedu)
inner join hosvital.ingresos i on (i.mptdoc=mae.mptdoc and i.mpcedu=mae.mpcedu and i.ingcsc=mae.mactving)
inner join  hosvital.maeemp   memp on (memp.mennit=mae.mpmeni)
left join hosvital.admglo11 ad2 on (ad2.mpnfac = mae.mpnfac)
left join hosvital.admglo01 ad1 on (ad1.aglremnr=ad2.aglremnr)
where mae.matipdoc='2' and mae.maestf  in ('0','4') and  mae.facfch>='2006-01-01'
order by mae.mpnfac;
