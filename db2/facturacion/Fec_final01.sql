select trcmdcodd, trcmdcodm , concat(trcmdcodd ,  lpad(trcmdcodm,3,'0'))  from hosvital.terceros;

--trcmdcodd , trcmdcodm, trcmdcodb

SELECT '860007373' NitFacturador,'FESC' prefijo,m.mpnfac numeroDocumento,  '1'   tipoDocumento, '10' tipoOperacion , '01' subTipoDocumento,'1' plantilla,'true' generaRepresentacionGrafica, m.facfch fechaEmision,
 concat(m.facfchhor ,'-05:00') horaEmision,(m.facfch + 30 days) fechaVencimiento,'COP' moneda,1 notif_Tipo, ter.trcemail notif_Valor,
'2' as formapago_tipopago, 'ZZZ' formapago_codigomedio,(m.facfch + 30 days) FORMAPAGO_fechaVencimiento,
'ObservacionesFactura' infoadicional_nombre,'Factura' infoadicional_valor,
substring(maeemp.mecntr,1,9) adq_identificacion , case when tipdoc.tipcoddoc=1 then '31'   when tipdoc.tipcoddoc=2 then '13' when tipdoc.tipcoddoc=3 then '22'   when tipdoc.tipcoddoc=4 then '12'   when tipdoc.tipcoddoc=5 then '11' when tipdoc.tipcoddoc=6 then '41' when tipdoc.tipcoddoc=8 then '11'   end  adq_tipoIdentificacion,'669'  adq_codigointerno, '0' adq_matriculamercantil, ter.trcrazsoc adq_razonSocial,  ter.trcrazsoc adq_nombresucursal,  ter.trcemail adq_correo, ter.trcresfis  adq_responsabilidadesRUT,
'1'  adq_tipoPersona,
 'CO'  ubi_pais, concat(ter.trcmdcodd ,  lpad(ter.trcmdcodm,3,'0'))   ubi_codigoMunicipio,' ' ubi_ciudad, '' ubi_departamento ,ter.trcdir ubi_direccion,
m.matotf tot_valorBruto,'COP' tot_valorBrutoMoneda, m4.afcvlrabo tot_valorAnticipo, 'COP' tot_valorantiticipomoneda, m.matotf  tot_valorTotalSinImpuestos,
'COP'  tot_SinImpmoneda ,
 m.matotf  tot_valorTotalConImpuestos, 'COP'  tot_valorTotalConImpuestosmoneda , m.mavals  tot_valorNeto,'COP' tot_valornetomoneda
FROM hosvital.maeate m
inner join hosvital.maeemp maeemp on (maeemp.mennit = m.mpmeni)
inner join hosvital.terceros ter on (ter.trccod=substring(maeemp.mecntr,1,9))
left join hosvital.maeate4 m4 on (m4.mpnfac = m.mpnfac)
left join hosvital.tipdoc tipdoc on (tipdoc.tipcoddoc = ter.trctpoide)
left join hosvital.tpocont tpocont on (tpocont.tcocod=ter.tcocod )
where m.facfch>= '2021-08-17' and m.mpmeni <> '90'
UNION
SELECT '860007373' NitFacturador,'FESC' prefijo,m.mpnfac numeroDocumento,  '1'   tipoDocumento, '10' tipoOperacion , '01' subTipoDocumento,'1' plantilla,'true' generaRepresentacionGrafica, m.facfch fechaEmision,
 concat(m.facfchhor ,'-05:00') horaEmision,(m.facfch + 30 days) fechaVencimiento,'COP' moneda,1 notif_Tipo, ter.trcemail notif_Valor,
'2' as formapago_tipopago, 'ZZZ' formapago_codigomedio,(m.facfch + 30 days) FORMAPAGO_fechaVencimiento,
'ObservacionesFactura' infoadicional_nombre,'Factura' infoadicional_valor,
m.mpcedu adq_identificacion , case when tipdoc1.tipcoddoc=1 then '31'   when tipdoc1.tipcoddoc=2 then '13' when tipdoc1.tipcoddoc=3 then '22'   when tipdoc1.tipcoddoc=4 then '12'   when tipdoc1.tipcoddoc=5 then '11' when tipdoc1.tipcoddoc=6 then '41' when tipdoc1.tipcoddoc=8 then '11'   end  adq_tipoIdentificacion,'669'  adq_codigointerno, '0' adq_matriculamercantil, ter.trcrazsoc adq_razonSocial,  ter.trcrazsoc adq_nombresucursal,  ter.trcemail adq_correo, ter.trcresfis  adq_responsabilidadesRUT,
'1'  adq_tipoPersona,
 'CO'  ubi_pais,concat(ter.trcmdcodd ,  lpad(ter.trcmdcodm,3,'0'))   ubi_codigoMunicipio,' ' ubi_ciudad, '' ubi_departamento ,ter.trcdir ubi_direccion,
m.matotf tot_valorBruto,'COP' tot_valorBrutoMoneda, m4.afcvlrabo tot_valorAnticipo, 'COP' tot_valorantiticipomoneda, m.matotf  tot_valorTotalSinImpuestos,
'COP'  tot_SinImpmoneda ,
 m.matotf  tot_valorTotalConImpuestos, 'COP'  tot_valorTotalConImpuestosmoneda , m.mavals  tot_valorNeto,'COP' tot_valornetomoneda
FROM hosvital.maeate m
inner join hosvital.maeemp maeemp on (maeemp.mennit = m.mpmeni)
inner join hosvital.terceros ter on (ter.trccod=m.mpcedu)
left join hosvital.maeate4 m4 on (m4.mpnfac = m.mpnfac)
left join hosvital.tipdoc tipdoc on (tipdoc.tipcoddoc = ter.trctpoide)
left join hosvital.tpocont tpocont on (tpocont.tcocod=ter.tcocod )
left join hosvital.tipdocasi casi on  (casi.mptdoc = m.mptdoc )
left join hosvital.tipdoc tipdoc1 on ( tipdoc1.tipcoddoc = cast(casi.mptdohom as decimal))
where m.facfch>= '2021-08-17' and m.mpmeni = '90'
order by 3;

--Ahora los detalles

SELECT  m.mpnfac, m2.macscp consec,'1' as det_tipoDetalle, m2.prcodi valorCodigoInterno, '999' codigoestandar,m2.prcodi valorCodigoEstandar, '04' unidadMedida, maepro.prnomb descripcion,
m2.macanpr  unidades, m2.mpinte valorUnitarioBruto,   'COP' valorunitariobrutomoneda,        m2.mavatp valorBruto,    'COP' valorBrutoMoneda,'1' tipodetalle,'Codigo' infadicnombre,'999' infadicvalor
FROM hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac and m2.fcptpotrn='F' and m2.maesanup<>'S')
inner join hosvital.maepro maepro on (maepro.prcodi=m2.prcodi)
WHERE  m.facfch>= '2021-08-17' and m.facfch<= '2021-08-31'
union
SELECT  m.mpnfac, m3.macscs consec,'1' as det_tipoDetalle, m3.msreso  valorCodigoInterno, '999' codigoestandar,m3.msreso valorCodigoEstandar, '04' unidadMedida, maesum1.msnomg descripcion,
m3.macans  unidades, m3.mavalu valorUnitarioBruto,   'COP' valorunitariobrutomoneda,        m3.mavats valorBruto,    'COP' valorBrutoMoneda,'1' tipodetalle,'Codigo' infadicnombre,'999' infadicvalor
FROM hosvital.maeate m
inner join hosvital.maeate3 m3 on (m3.mpnfac=m.mpnfac and m3.fcstpotrn='F' and m3.maesanus<>'S')
inner join hosvital.maesum1 maesum1 on (maesum1.msreso=m3.msreso)
WHERE  m.facfch>= '2021-08-17' and m.facfch<= '2021-08-31'
order by  1,2
