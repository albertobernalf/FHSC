select a.histipdoc as tipo_doc,a.hisckey as documento,cap.mpnomc as paciente,hc.hisfhorat as fecha_ordenado,mae.mmregm as registro_medico, mae.mmnomm as medico,a.hiscsec as folio,a.fsmdscmdc as descripcion, a.mscodi,a.msprac,a.msform,case when a.HCSmStGr='O' then 'Nuevo' when a.HCSmStGr='N' then 'Sin Cambios' when a.HCSmStGr='S' then 'Suspendido' when a.HCSmStGr= 'C' then 'Continuar' when a.HCSmStGr='M' then 'Modificacion' END,a.FSmCntDia as CANTIDAD_ORDENADA,a.hiscansum as dosis, un.unmddes as medida,case when a.hcfsfrh='93' then 'Dosis Unica' else a.hcfsfrh end as frecuencia,maec.cncdes as concentracion,via.viapldsc as via,(select dsp.DSmFch from hosvital.dspfrmc dsp where dsp.histipdoc=a.histipdoc and dsp.hisckey=a.hisckey and dsp.hiscsec=a.hiscsec and dsp.msreso=a.fsmmsreso) as fecha_dispensacion,(select sum(dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec=a.hiscsec and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn ='DS') as cantidad_despachada,(select sum(dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn='DV') as cantidad_devuelta from hosvital.FrmSmns as a inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd) inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia) inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd) inner join hosvital.hccom1 hc on (a.histipdoc=hc.histipdoc and a.hisckey=hc.hisckey and a.hiscsec=hc.hiscsec) inner join hosvital.maemed1 mae on (mae.mmcodm= hc.hiscmmed) inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu=a.hisckey) where fsmfhrreg>=? AND fsmfhrreg<=? order by a.hiscsec, a.fsmdscmdc;

-- Primer Reporte con Despacho

select year(a.fsmfhrreg), month(a.fsmfhrreg),a.fsmdscmdc, un.unmddes as medida,maec.cncdes as concentracion,count(*) as prescripciones,sum(a.FSmCntDia) as cantidad_ordenada,
sum((select sum(dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec=a.hiscsec and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn ='DS'     and year(dsp1.dsmfhrmov) = year(a.fsmfhrreg) and month(dsp1.dsmfhrmov) = month(a.fsmfhrreg))) as cantidad_despachada
from hosvital.FrmSmns as a 
inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd) 
inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia) 
inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd) 
inner join hosvital.hccom1 hc on (a.histipdoc=hc.histipdoc and a.hisckey=hc.hisckey and a.hiscsec=hc.hiscsec) 
inner join hosvital.maemed1 mae on (mae.mmcodm= hc.hiscmmed) 
inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu=a.hisckey) 
where a.fsmfhrreg>='2019-05-01 00:00:00' AND a.fsmfhrreg<='2019-09-30 23:59:59'  and cap.mpcedu='28587002'
group by year(a.fsmfhrreg), month(a.fsmfhrreg),a.fsmdscmdc ,un.unmddes,maec.cncdes
order by  year(a.fsmfhrreg), month(a.fsmfhrreg),a.fsmdscmdc ;


-- Segundo Reporte con Despacho - Contrato CAPITAL

select year(a.fsmfhrreg), month(a.fsmfhrreg),maeemp.menomb as contrato,a.fsmdscmdc, un.unmddes as medida,maec.cncdes as concentracion,count(*) as prescripciones,sum(a.FSmCntDia) as cantidad_ordenada,
sum((select sum(dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec=a.hiscsec and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn ='DS' and year(dsp1.dsmfhrmov) = year(a.fsmfhrreg) and month(dsp1.dsmfhrmov) = month(a.fsmfhrreg))) as cantidad_despachada
from hosvital.FrmSmns as a 
inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd) 
inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia) 
inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd) 
inner join hosvital.hccom1 hc on (a.histipdoc=hc.histipdoc and a.hisckey=hc.hisckey and a.hiscsec=hc.hiscsec) 
inner join hosvital.maemed1 mae on (mae.mmcodm= hc.hiscmmed) 
inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu=a.hisckey) 
inner join hosvital.maeemp maeemp on (maeemp.mennit = hc.fhccodcto)
where a.fsmfhrreg>='2019-08-01 00:00:00' AND a.fsmfhrreg<='2019-09-30 23:59:59'  and (a.histipdoc, a.hisckey,a.hiscsec) in (select hc1.histipdoc ,hc1.hisckey ,hc1.hiscsec from hosvital.hccom1 hc1 where  hc1.fhccodcto in ('SS0021','CAPITALSALUS','CS0021','CAPITALCONT'))   and cap.mpcedu='28587002'
group by year(a.fsmfhrreg), month(a.fsmfhrreg),maeemp.menomb,a.fsmdscmdc ,un.unmddes,maec.cncdes
order by  year(a.fsmfhrreg), month(a.fsmfhrreg),maeemp.menomb,a.fsmdscmdc ;




-- Tercer Reporte con Despacho - Contratos TODOS

select year(a.fsmfhrreg), month(a.fsmfhrreg),maeemp.menomb as contrato,a.fsmdscmdc, un.unmddes as medida,maec.cncdes as concentracion,count(*) as prescripciones,sum(a.FSmCntDia) as cantidad_ordenada,
sum((select sum(dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec=a.hiscsec and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn ='DS' and year(dsp1.dsmfhrmov) = year(a.fsmfhrreg) and month(dsp1.dsmfhrmov) = month(a.fsmfhrreg))) as cantidad_despachada
from hosvital.FrmSmns as a 
inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd) 
inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia) 
inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd) 
inner join hosvital.hccom1 hc on (a.histipdoc=hc.histipdoc and a.hisckey=hc.hisckey and a.hiscsec=hc.hiscsec) 
inner join hosvital.maemed1 mae on (mae.mmcodm= hc.hiscmmed) 
inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu=a.hisckey) 
inner join hosvital.maeemp maeemp on (maeemp.mennit = hc.fhccodcto)
where a.fsmfhrreg>='2019-05-01 00:00:00' AND a.fsmfhrreg<='2019-07-31 23:59:59'  -- and cap.mpcedu='28587002'
group by year(a.fsmfhrreg), month(a.fsmfhrreg),maeemp.menomb,a.fsmdscmdc ,un.unmddes,maec.cncdes
order by  year(a.fsmfhrreg), month(a.fsmfhrreg),maeemp.menomb,a.fsmdscmdc ;


