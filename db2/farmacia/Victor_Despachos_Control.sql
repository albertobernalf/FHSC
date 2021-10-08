select a.histipdoc as tipo_doc,a.hisckey as documento,cap.mpnomc as paciente,a.hiscsec as folio,hc.hisfhorat as fecha_ordenado, maes.msreso as cod_medicamento, maes.msnomg as Med_Control, a.FSmCntDia as CANT_ORDENADA, 
(select dsp.DSmFch from hosvital.dspfrmc dsp where dsp.histipdoc=a.histipdoc and dsp.hisckey=a.hisckey and dsp.hiscsec=a.hiscsec and dsp.msreso=a.fsmmsreso) as fecha_dispensacion,
(select sum(dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec=a.hiscsec and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn ='DS') as cant_despachada,
(select sum(dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec=a.hiscsec and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn ='DV') as cant_devuelta
 from hosvital.FrmSmns as a 
inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd)
 inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia)
 inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd)
 inner join hosvital.hccom1 hc on (a.histipdoc=hc.histipdoc and a.hisckey=hc.hisckey and a.hiscsec=hc.hiscsec) 
inner join hosvital.maemed1 mae on (mae.mmcodm= hc.hiscmmed)
 inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu=a.hisckey) 
inner join hosvital.maeemp maeemp on (maeemp.mennit=hc.fhccodcto) 
inner join hosvital.maesum1 maes on (maes.msreso=a.fsmmsreso)
where  a.fsmfhrreg>='2020-04-01 00:00:00' AND a.fsmfhrreg<='2020-04-03 23:59:59' and a.fsmmsreso in (
'0521N05B','0522N05B','0523N05B','0507N05A','0508N05A','0804N03A','0511N05A','0526N05B','0490N03A','0050N02B','0493N03A','0439N01B','0423N01A','0527N05B','0528N05B','0003N02A','0424N01A','0464N02A','0001N02A','0004N05A',
'0230H01B','0001H03B','0002N01A','0427N01A')

 order by a.histipdoc,a.hisckey, a.hiscsec, a.fsmdscmdc;

select * from hosvital.dspfrmc1 where hisckey= '1085044775' and hiscsec =3550 and msreso ='0464N02A';     	
       	



-- Intentemos Agrupado por paciente

select a.histipdoc as tipo_doc,a.hisckey as documento,cap.mpnomc as paciente,hc.hisfhorat as fecha_ordenado, maes.msreso as cod_medicamento, maes.msnomg as Med_Control, a.FSmCntDia as CANT_ORDENADA, 
(select dsp.DSmFch from hosvital.dspfrmc dsp where dsp.histipdoc=a.histipdoc and dsp.hisckey=a.hisckey and dsp.hiscsec=a.hiscsec and dsp.msreso=a.fsmmsreso) as fecha_dispensacion,
(select sum(dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec=a.hiscsec and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn ='DS') as cant_despachada,
(select sum(dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec=a.hiscsec and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn ='DV') as cant_devuelta
 from hosvital.FrmSmns as a 
inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd)
 inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia)
 inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd)
 inner join hosvital.hccom1 hc on (a.histipdoc=hc.histipdoc and a.hisckey=hc.hisckey and a.hiscsec=hc.hiscsec) 
inner join hosvital.maemed1 mae on (mae.mmcodm= hc.hiscmmed)
 inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu=a.hisckey) 
inner join hosvital.maeemp maeemp on (maeemp.mennit=hc.fhccodcto) 
inner join hosvital.maesum1 maes on (maes.msreso=a.fsmmsreso)
where a.fsmfhrreg>='2020-04-01 00:00:00' AND a.fsmfhrreg<='2020-04-03 23:59:59' and a.fsmmsreso in (
'0521N05B','0522N05B','0523N05B','0507N05A','0508N05A','0804N03A','0511N05A','0526N05B','0490N03A','0050N02B','0493N03A','0439N01B','0423N01A','0527N05B','0528N05B','0003N02A','0424N01A','0464N02A','0001N02A','0004N05A',
'0230H01B','0001H03B','0002N01A','0427N01A')

 order by a.histipdoc,a.hisckey, a.hiscsec, a.fsmdscmdc;

