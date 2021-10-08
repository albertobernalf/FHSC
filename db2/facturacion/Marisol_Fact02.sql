select m2.MACscP, ing.ingcsc as consc_ingreso,  ing.ingfecadm as Fec_ingreso, ing.IngFecEgr as Fec_egreso, pab.MPNomP Pabellon, m.FacFch as fec_fra, 
m.MPNFac as Nro_factura, CASE WHEN m.MAEstF = '0' THEN 'ACTIVA' WHEN m.MAEstF = '1' THEN 'ANULADA_SIN_CONTABILIZAR' WHEN m.MAEstF = '2' THEN 'RADICADA' WHEN m.MAEstF = '3' THEN 'GLOSADA' WHEN m.MAEstF = '4' THEN 'REMITIDA' WHEN m.MAEstF = '5' THEN 'GLOSADA_CONTESTADA' WHEN m.MAEstF = '6' THEN 'RESPUESTA_RADICADA' WHEN m.MAEstF = '7' THEN 'GLOSADA_SIN_RADICAR' WHEN m.MAEstF = '8' THEN 'NOTIFICADA' WHEN m.MAEstF = '9' THEN 'NOTIFICADA_CONTESTADA' WHEN m.MAEstF = '10' THEN 'ANULADA_CONTABILIZADA' end as ESTADO_FRA, emp1.empdsc as Empresa, (select MENOMB from  hosvital.maeemp emp where  emp.mennit=ing.ingnit) as Contrato
, Ca.mpnomc as nom_paciente, m.mpcedu as Id_Paciente, ca.mpsexo as sexo, ca.MPFchN as Fec_Nacimiento, 
  m2.mafepr as fec_servicio, 
m2.prcodi as Cod_Proc, mp.PrNomb as Desc_Proced, (select TiPrDes from hosvital.tipproc tp where tp.TiPrCod = m2.MATipP) as Tipo_Proced, vias.ViaDsc as Via_Qx, m2.MAHONCOD AS COD_HONORARIO, hon.HNRDSC AS HONORARIO, m2.MaCanPr as Cant_Proced, m2.MPInte as Valor_Unitario, m2.MAVaTP as Total_Proced, med1.MMNomM as Pers_Asistencial, esp.MENomE as Especialidad, glo11.AglFRdFac as Fec_Radicacion, ing.ingentdx as Cod_Dx_Ing, (select dmnomb from HOSVITAL.MAEDIA dia  where dia.DMCODI=ing.INGENTDX) as diagnostico_ingreso, ing.IngSalDx as Cod_Dx_Salida, (select dmnomb from hosvital.maedia dia  where dia.dmcodi=ing.IngSalDx) as Dx_Salida
from hosvital.maeate m
inner join hosvital.ingresos Ing on (ing.mptdoc = m.mptdoc and Ing.mpcedu = m.mpcedu and ing.ingcsc = m.mactving)
inner join hosvital.maeemp Emp on(Emp.mennit = Ing.ingnit)
inner  join hosvital.empress Emp1 on (Emp1.MEcntr = Emp.mecntr)
inner join hosvital.capbas Ca on (ca.MPTDoc = m.mptdoc  and Ca.mpcedu = m.mpcedu)
left join hosvital.maeate2 m2 on (m2.mpnfac = m.mpnfac and m2.fcptpotrn='F' and m2.maesanup <> 'S')
inner join hosvital.maepab Pab on (Pab.mpcodp = m2.maCodPab)
inner  join hosvital.maepro MP on (mp.prcodi = m2.prcodi)
inner join hosvital.tipproc Tp on (tp.TiPrCod = mp.TpPrCd)
left join hosvital.Vias Vias on (Vias.ViaCod  = m2.ViaCod)
left join hosvital.maemed1 med1 on (med1.mmcodm = m2.mmcodm)
left join hosvital.maeesp esp on (esp.MECodE = m2.MECoMM)
left join hosvital.admglo11 glo11 on (glo11.MPNFac  = m2.mpnfac )
left join hosvital.maedia dia on (dia.dmcodi = ing.ingentdx)
left JOIN HOSVITAL.HONRIOS Hon ON (hon.HNRCOD = m2.MAHONCOD)
where  ing.ingfecadm >='2021-08-01 00:00:00'  and ing.ingfecadm <= '2021-08-31 23:59:59' 
union
select tmp1.TFCscP, ing.ingcsc as consc_ingreso,  ing.ingfecadm as Fec_ingreso, ing.IngFecEgr as Fec_egreso, 
pab.MPNomP Pabellon,  '0001-01-01'   as Fec_fra,0  as nro_Fractura, ' ' Estado_Factura, emp1.empdsc as Empresa, (select MENOMB from  hosvital.maeemp emp where  emp.mennit=ing.ingnit) as Contrato
, ca.mpnomc as nom_paciente, tmp.tfcedu as Id_Paciente, ca.mpsexo as sexo, ca.MPFchN as Fec_Nacimiento,tmp1.TFFchP as fec_servicio,
 tmp1.TFPrC1 as Cod_Proc, mp.PrNomb as Desc_Proced
, (select TiPrDes from hosvital.tipproc tp where tp.TiPrCod = tmp1.TFTipP) as Tipo_Proced, vias.ViaDsc as Via_Qx, TMP1.TFHnrCod AS COD_HONORARIO, HON.HNRDSC AS HONORARIO, Tmp1.TFCanpr as Cant_Proced, tmp1.TFinte as Valor_Unitario, tmp1.TFPVlrSIv as Total_Proced, med1.MMNomM as Pers_Asistencial, esp.MENomE as Especialidad,
 '0001-01-01 ' Fec_Radicacion, ing.ingentdx as Cod_Dx_Ing, (select dmnomb from HOSVITAL.MAEDIA dia  where dia.DMCODI=ing.INGENTDX) as diagnostico_ingreso, ing.IngSalDx as Cod_Dx_Salida, (select dmnomb from hosvital.maedia dia  where dia.dmcodi=ing.IngSalDx) as Dx_Salida
from hosvital.tmpfac Tmp
inner join hosvital.ingresos Ing on (ing.mptdoc =tmp.tftdoc and Ing.mpcedu = tmp.tfcedu and ing.ingcsc = tmp.tmctving)
left join hosvital.tmpfac1 tmp1 on (tmp1.tftdoc =tmp.tftdoc and tmp1.tfcedu = tmp.tfcedu and tmp1.tmctving = tmp.tmctving  and tmp1.tfptpotrn='F' and tmp1.tfestaanu1<>'S')
inner join hosvital.maepab Pab on (Pab.mpcodp = tmp1.TfCodPab)
inner join hosvital.maeemp emp on (emp.mennit = ing.ingnit)
inner join hosvital.empress emp1 on (emp1.MEcntr = emp.mecntr)
inner join hosvital.capbas ca on (ca.MPTDoc = tmp.tftdoc and ca.mpcedu = tmp.tfcedu)
inner join hosvital.maepro mp on (mp.prcodi = tmp1.TFPrC1)
inner join hosvital.tipproc tp on (tp.TiPrCod = mp.TpPrCd)
left join hosvital.Vias vias on (Vias.ViaCod  = tmp1.ViaCod)
left join hosvital.maemed1 med1 on (med1.mmcodm = tmp1.MMcoM1)
left join hosvital.maeesp esp on (esp.MECodE =tmp1.MECoM1)
left join hosvital.maedia dia on (dia.dmcodi = ing.ingentdx)   
LEFT JOIN HOSVITAL.HONRIOS hon ON (hon.HNRCOD = tmp1.TFHnrCod)
where  ing.ingfecadm >='2021-08-01 00:00:00'  and ing.ingfecadm <= '2021-08-31 23:59:59' 
union
select m3.MACscs, ing.ingcsc as consc_ingreso, ing.ingfecadm as Fec_ingreso, ing.IngFecEgr as Fec_egreso, Bod.boddesc  Bodega, m.FacFch as fec_fra, m.MPNFac as Nro_factura, CASE WHEN m.MAEstF = '0' THEN 'ACTIVA' WHEN m.MAEstF = '1' THEN 'ANULADA_SIN_CONTABILIZAR' WHEN m.MAEstF = '2' THEN 'RADICADA' WHEN m.MAEstF = '3' THEN 'GLOSADA' WHEN m.MAEstF = '4' THEN 'REMITIDA' WHEN m.MAEstF = '5' THEN 'GLOSADA_CONTESTADA' WHEN m.MAEstF = '6' THEN 'RESPUESTA_RADICADA' WHEN m.MAEstF = '7' THEN 'GLOSADA_SIN_RADICAR' WHEN m.MAEstF = '8' THEN 'NOTIFICADA' WHEN m.MAEstF = '9' THEN 'NOTIFICADA_CONTESTADA' WHEN m.MAEstF = '10' THEN 'ANULADA_CONTABILIZADA' end as ESTADO_FRA, emp1.empdsc as Empresa, (select MENOMB from  hosvital.maeemp emp where  emp.mennit=ing.ingnit) as Contrato, Ca.mpnomc as nom_paciente, m.mpcedu as Id_Paciente, ca.mpsexo as sexo, ca.MPFchN as Fec_Nacimiento, m3.mafcsu as fec_servicio, m3.msreso as CodSum, maesum1.msnomg as Desc_Suministro, ' '  as TIPO_PROCED, ' ' as VIA_QX, ' ' as COD_HONORARIO, ' ' as HONORARIO,
                                            m3.MaCans as Cant_Suministros, m3.mavalu as Valor_Unitario, m3.MAVats as Total_Suministros,  ' ' as  PERS_ASISTENCIAL, ' ' as ESPECIALIDAD,
             glo11.AglFRdFac as Fec_Radicacion, ing.ingentdx as Cod_Dx_Ing, (select dmnomb from HOSVITAL.MAEDIA dia  where dia.DMCODI=ing.INGENTDX) as diagnostico_ingreso, ing.IngSalDx as Cod_Dx_Salida, (select dmnomb from hosvital.maedia dia  where dia.dmcodi=ing.IngSalDx) as Dx_Salida
from hosvital.maeate m
inner join hosvital.ingresos Ing on (ing.mptdoc = m.mptdoc and Ing.mpcedu = m.mpcedu and ing.ingcsc = m.mactving)
inner join hosvital.maeemp Emp on(Emp.mennit = Ing.ingnit)
inner  join hosvital.empress Emp1 on (Emp1.MEcntr = Emp.mecntr)
inner join hosvital.capbas Ca on (ca.MPTDoc = m.mptdoc  and Ca.mpcedu = m.mpcedu)
left join hosvital.maeate3 m3 on (m3.mpnfac = m.mpnfac  and m3.fcstpotrn='F' and m3.maesanus <> 'S' )
inner join hosvital.bodegas Bod on (Bod.bodega = m3.bodega)
inner join hosvital.maesum1 maesum1 on (maesum1.msreso=m3.msreso)
left join hosvital.admglo11 glo11 on (glo11.MPNFac  = m3.mpnfac )
where  ing.ingfecadm >='2021-08-01 00:00:00' and ing.ingfecadm <= '2021-08-31 23:59:59'
union
select tmp2.tfcscs, ing.ingcsc as consc_ingreso, ing.ingfecadm as Fec_ingreso, ing.IngFecEgr as Fec_egreso, Bod.boddesc  Bodega, '0001-01-01'  as Fec_fra, 0  as nro_Fractura, ' ' Estado_Factura, emp1.empdsc as Empresa, (select MENOMB from  hosvital.maeemp emp where  emp.mennit=ing.ingnit) as Contrato, ca.mpnomc as nom_paciente, tmp.tfcedu as Id_Paciente, ca.mpsexo as sexo, ca.MPFchN as Fec_Nacimiento, tmp2.Tffcsu as fec_servicio, tmp2.tfreso as Cod_Sum,  maesum1.msnomg as Desc_Suministro,    ' '  as TIPO_PROCED, ' ' as VIA_QX, ' ' as COD_HONORARIO, ' ' as HONORARIO, 
  Tmp2.TFCans as Cant_Suministro, tmp2.tfvalu as Valor_Unitario, tmp2.Tfvats as Total_Suministros, ' ' as  PERS_ASISTENCIAL, ' ' as ESPECIALIDAD,          '0001-01-01 ' Fec_Radicacion, ing.ingentdx as Cod_Dx_Ing, (select dmnomb from HOSVITAL.MAEDIA dia  where dia.DMCODI=ing.INGENTDX) as diagnostico_ingreso, ing.IngSalDx as Cod_Dx_Salida, (select dmnomb from hosvital.maedia dia  where dia.dmcodi=ing.IngSalDx) as Dx_Salida
from hosvital.tmpfac Tmp
inner join hosvital.ingresos Ing on (ing.mptdoc =tmp.tftdoc and Ing.mpcedu = tmp.tfcedu and ing.ingcsc = tmp.tmctving)
left join hosvital.tmpfac2 tmp2 on (tmp2.tftdoc =tmp.tftdoc and tmp2.tfcedu = tmp.tfcedu and tmp2.tmctving = tmp.tmctving and tmp2.tfstpotrn='F' and tmp2.tfestaanu2<>'S' )
inner join hosvital.maeemp emp on (emp.mennit = ing.ingnit)
inner join hosvital.empress emp1 on (emp1.MEcntr = emp.mecntr)
inner join hosvital.capbas ca on (ca.MPTDoc = tmp.tftdoc and ca.mpcedu = tmp.tfcedu)
inner join hosvital.bodegas Bod on (Bod.bodega = tmp2.bodega)
inner join hosvital.maesum1 maesum1 on (maesum1.msreso=tmp2.tfreso)
where  ing.ingfecadm >='2021-08-01 00:00:00' and ing.ingfecadm <= '2021-05-31 23:59:59'
ORDER BY  12,15; 
