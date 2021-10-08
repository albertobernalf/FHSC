
select a.histipdoc as tipo_doc,a.hisckey as documento,a.hiscsec as folio,cap.mpnomc as paciente,hc.hisfhorat as fecha_ordenado, maes.msreso as cod_medicamento, maes.msnomg as Medicamento, 
(select sum(dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec=a.hiscsec and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn ='DS') as cant_despachada
 from hosvital.FrmSmns as a 
inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd)
 inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia)
 inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd)
 inner join hosvital.hccom1 hc on (a.histipdoc=hc.histipdoc and a.hisckey=hc.hisckey and a.hiscsec=hc.hiscsec) 
inner join hosvital.maemed1 mae on (mae.mmcodm= hc.hiscmmed)
 inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu=a.hisckey) 
inner join hosvital.maeemp maeemp on (maeemp.mennit=hc.fhccodcto) 
inner join hosvital.maesum1 maes on (maes.msreso=a.fsmmsreso)
where a.fsmfhrreg>='2020-01-01 00:00:00' AND a.fsmfhrreg<='2020-10-31 23:59:59' and a.fsmmsreso in (
'0015A11A','0016A11A','0007A11A','0005A11A','0005V06D','0008A11A','0019A11A','0020A11A','0006A11A','0002V02B','0035A11A','0007B05B','0009B05B','0004B05B','0009A11A','0008B05B','0018A11A')  order by a.histipdoc,a.hisckey, a.hiscsec, a.fsmdscmdc;

select a.histipdoc as tipo_doc,a.hisckey as documento,a.hiscsec as folio,cap.mpnomc as paciente, maes.msreso as cod_medicamento, maes.msnomg as Medicamento, (select sum(dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec=a.hiscsec and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn ='DS') as cant_despachada from hosvital.FrmSmns as a inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd) inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia) inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd) inner join hosvital.hccom1 hc on (a.histipdoc = hc.histipdoc and a.hisckey=hc.hisckey and a.hiscsec=hc.hiscsec) inner join hosvital.maemed1 mae on (mae.mmcodm= hc.hiscmmed) inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu=a.hisckey) inner join hosvital.maeemp maeemp on (maeemp.mennit=hc.fhccodcto) inner join hosvital.maesum1 maes on (maes.msreso = a.fsmmsreso) where a.fsmfhrreg>='2020-01-01 00:00:00' AND a.fsmfhrreg<='2020-10-01 00:00:00' and a.fsmmsreso in ( '0015A11A' ,'0016A11A', '0007A11A','0005A11A', '0005V06D','0008A11A', '0019A11A','0020A11A','0006A11A','0002V02B' , '0035A11A' , '0007B05B','0009B05B', '0004B05B','0009A11A','0008B05B' ,'0018A11A') order by a.histipdoc,a.hisckey, a.hiscsec