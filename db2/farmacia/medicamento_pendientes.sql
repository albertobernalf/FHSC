select  a.hiscsec as folio, a.fsmdscmdc as descripcion, a.fsmcntdia as dosis, a.hcsmundcd as unidad,a.hcfsfrh as frecuencia,a.hcfsvia as via, a.fsmfhrreg as fecha_formulacion, b.hcfhhrap as fecha_hora_programacion, b.asfecpapl as fecha_hora_reg_aplicacion, b.hcsumest as estado_aplicacion, c.mmnomm as usuario_aplicacion 
from hosvital.FrmSmns as a 
inner join hosvital.FrmSmns1 as b on a.hisckey=b.hisckey 
inner join hosvital.maemed1 as c on b.asusuapl=c.mmcodm 
where b.hisckey='40432150' and fsmfhrreg>='2019-01-23 00:00:00' and  fsmfhrreg<='2019-03-29 00:00:00'; 


select  a.hiscsec as folio, a.fsmdscmdc as descripcion, a.fsmcntdia as dosis, a.hcsmundcd as unidad,a.hcfsfrh as frecuencia,a.hcfsvia as via, a.fsmfhrreg as fecha_formulacion, b.hcfhhrap as fecha_hora_programacion, b.asfecpapl as fecha_hora_reg_aplicacion, b.hcsumest as estado_aplicacion, c.mmnomm as usuario_aplicacion 
from hosvital.FrmSmns as a 
inner join hosvital.FrmSmns1 as b on (a.histipdoc = b.histipdoc and a.hisckey=b.hisckey  and a.hiscsec=b.hiscsec and a.hictvin = b.hictvin1 and a.mscodi=b.mscodi and a.msprac=b.msprac and a.msform=b.msform and a.cnccd = b.cnccd)
inner join hosvital.maemed1 as c on (b.asusuapl=c.mmcodm )
where b.hisckey='40432150' and fsmfhrreg>='2019-01-23 00:00:00' and  fsmfhrreg<='2019-03-29 00:00:00'; 

select * from hosvital.FrmSmns where hisckey='40432150' and hiscsec = 1236;
select * from hosvital.FrmSmns1 where hisckey='40432150' and hiscsec = 1236;

-- Acotado

select  a.hiscsec as folio, a.fsmdscmdc as descripcion, a.fsmcntdia as dosis, a.hcsmundcd as unidad,a.hcfsfrh as frecuencia,a.hcfsvia as via, a.fsmfhrreg as fecha_formulacion, b.hcfhhrap as fecha_hora_programacion, b.asfecpapl as fecha_hora_reg_aplicacion, b.hcsumest as estado_aplicacion, c.mmnomm as usuario_aplicacion 
from hosvital.FrmSmns as a inner join hosvital.FrmSmns1 as b on (a.histipdoc = b.histipdoc and a.hisckey=b.hisckey  and a.hiscsec=b.hiscsec and a.hictvin = b.hictvin1 and a.mscodi=b.mscodi and a.msprac=b.msprac and a.msform=b.msform and a.cnccd = b.cnccd) inner join hosvital.maemed1 as c on (b.asusuapl=c.mmcodm ) where b.hisckey=? and fsmfhrreg>=? and  fsmfhrreg<=?