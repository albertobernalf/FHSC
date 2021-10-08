select * from hosvital.maesum1;

select * from hosvital.grupos1;

select  m.msgrpcod as grupo,g.grpdsc as descripcion_grupo,  m.mssgrpcd as subgrupo, subg.sgrpdsc as descripcion_subgrupo, m.msreso ascod_medicamento, m.msnomg as medicamento,m.MovVlU1 as ult_precio_compra
from hosvital.maesum1 m, hosvital.grupos g, hosvital.grupos1 subg
where m.msgrpcod=g.grpcod  and g.grpcod=subg.grpcod and subg.sgrpcod=m.mssgrpcd and  m.msestado='S'
order by  g.grpdsc, subg.sgrpdsc;


select * from hosvital.compcab2 where Ordreqnro=48386 ;
 -- and  msreso= '0321HM01


select * from hosvital.maesum1 where msreso= '0321HM01';

select * from hosvital.requisi1 where reqnro= 48386 and requltest = 'T' ;
select * from hosvital.requisici where reqnro= 48386;


select * from hosvital.requisi1 where  reqnro in ('71066') and requltest = 'T' ;

-- update hosvital.requisi1 set requltest= 'P' where reqnro in ('48387','49506','47927','48664','48386') and requltest = 'T' ;

update hosvital.requisi1 set requltest= 'T' where reqnro in ('71066') and requltest = 'P' ;