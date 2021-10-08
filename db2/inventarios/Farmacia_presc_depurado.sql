select a.histipdoc as tipo_doc,a.hisckey as documento,cap.mpnomc as paciente,hc.hisfhorat as fecha_ordenado, a.FSmCntDia as CANT_ORDENADA,
 (select dsp.DSmFch from hosvital.dspfrmc dsp where dsp.histipdoc=a.histipdoc and dsp.hisckey=a.hisckey and dsp.hiscsec=a.hiscsec and dsp.msreso=a.fsmmsreso) as fecha_dispensacion,
(select sum(dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec=a.hiscsec and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn ='DS') as cant_despachada
 from hosvital.FrmSmns as a 
inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd)
 inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia)
 inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd)
 inner join hosvital.hccom1 hc on (a.histipdoc=hc.histipdoc and a.hisckey=hc.hisckey and a.hiscsec=hc.hiscsec) 
inner join hosvital.maemed1 mae on (mae.mmcodm= hc.hiscmmed) inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu=a.hisckey)
 inner join hosvital.maeemp maeemp on (maeemp.mennit=hc.fhccodcto)
 where fsmfhrreg>='2020-04-10 00:00:00'  AND fsmfhrreg<='2020-04-10 23:59:59' 
order by a.hiscsec, a.fsmdscmdc;


select a.histipdoc as tipo_doc,a.hisckey as documento,cap.mpnomc as paciente,hc.hisfhorat as fecha_ordenado,a.fsmmsreso as medicamento,maesum1.msnomg as medicamento,

 a.FSmCntDia as CANT_ORDENADA,
 (select dsp.DSmFch from hosvital.dspfrmc dsp where dsp.histipdoc=a.histipdoc and dsp.hisckey=a.hisckey and dsp.hiscsec=a.hiscsec and dsp.msreso=a.fsmmsreso) as fecha_dispensacion,
(select sum(dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec=a.hiscsec and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn ='DS') as cant_despachada
 from hosvital.FrmSmns as a 
inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd)
 inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia)
 inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd)
 inner join hosvital.hccom1 hc on (a.histipdoc=hc.histipdoc and a.hisckey=hc.hisckey and a.hiscsec=hc.hiscsec) 
inner join hosvital.maemed1 mae on (mae.mmcodm= hc.hiscmmed) 
inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu=a.hisckey)
 inner join hosvital.maeemp maeemp on (maeemp.mennit=hc.fhccodcto)
inner join hosvital.maesum1 maesum1 on (maesum1.msreso=a.fsmmsreso)
 where fsmfhrreg>='2020-04-10 00:00:00'  AND fsmfhrreg<='2020-04-10 23:59:59' 
order by a.hisckey,a.hiscsec,a.fsmmsreso ;


select * from hosvital.FrmSmns ;

