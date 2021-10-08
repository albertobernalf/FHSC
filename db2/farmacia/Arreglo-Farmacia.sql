select a.histipdoc as tipo_doc,a.hisckey as documento,cap.mpnomc as paciente,hc.hisfhorat as fecha_ordenado,mae.mmregm as registro_medico, mae.mmnomm as medico,a.hiscsec as folio,a.fsmdscmdc as descripcion, a.mscodi,a.msprac,a.msform,case when a.HCSmStGr='O' then 'Nuevo' when a.HCSmStGr='N' then 'Sin Cambios' when a.HCSmStGr='S' then 'Suspendido' when a.HCSmStGr= 'C' then 'Continuar' when a.HCSmStGr='M' then 'Modificacion' END,a.FSmCntDia as CANTIDAD_ORDENADA,a.hiscansum as dosis, un.unmddes as medida,case when a.hcfsfrh='93' then 'Dosis Unica' else a.hcfsfrh end as frecuencia,maec.cncdes as concentracion,via.viapldsc as via,

(select dsp.DSmFch from hosvital.dspfrmc dsp where dsp.histipdoc=a.histipdoc and dsp.hisckey=a.hisckey and dsp.hiscsec=a.hiscsec and dsp.msreso=a.fsmmsreso 
--and dsmfch= (select min(dspx.dsmfch) from hosvital.dspfrmc dspx where  dspx.histipdoc=dsp.histipdoc and dspx.hisckey=dsp.hisckey and dspx.hiscsec=dsp.hiscsec and dspx.msreso=dsp.msreso)
) as fecha_dispensacion, 
/*
(select dsp1.DsCnsDsp from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and  dsp1.msreso = a.fsmmsreso and dsp1.dsmtpotrn='DS'
-- and dsp1.DsCnsDsp= (select min(dspx1.DsCnsDsp) from hosvital.dspfrmc1 dspx1 where  dspx1.histipdoc=dsp1.histipdoc and dspx1.hisckey=dsp1.hisckey and dspx1.hiscsec=dsp1.hiscsec and dspx1.msreso=dsp1.msreso)
) as consec_despacho,
*/
(select sum(dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec=a.hiscsec and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn ='DS') as cantidad_despachada,
(select sum(dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn='DV') as cantidad_devuelta 
from hosvital.FrmSmns as a 
inner join hosvital.maeconc maec on (maec.cnccd=a.cnccd) 
inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia) 
inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd)
 inner join hosvital.hccom1 hc on (a.histipdoc=hc.histipdoc and a.hisckey=hc.hisckey and a.hiscsec=hc.hiscsec)
 inner join hosvital.maemed1 mae on (mae.mmcodm= hc.hiscmmed) 
inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu=a.hisckey) where fsmfhrreg>='2019-01-01 00:00:00' AND fsmfhrreg<='2019-09-05 23:59:59'     and hc.hisckey='2901205' 
order by a.hiscsec, a.fsmdscmdc;

SELECT * FROM HOSVITAL.DSPFRMC;

SELECT * FROM HOSVITAL.DSPFRMC1  where histipdoc='CC' and hisckey='2901205'   and hiscsec=2;

