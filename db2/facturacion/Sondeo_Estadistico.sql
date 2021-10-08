select count(*) from hosvital.maeate where facfch >= '2020-03-01';  -- 895	
select count(*) from hosvital.ingresos  where ingfecadm >= '2020-03-01 00:00:00';  -- 1910			
			

select DOCCOD,day(mvcfch),COUNT(*)
 from hosvital.movcont3 
where EMPCOD='01' AND mvcfch >='2020-03-01 00:00:00'  AND  mvcfch <='2020-03-31 23:59:59'-- and doccod='FAR'
GROUP BY DOCCOD ,day(mvcfch)
order by day(mvcfch);

select * from hosvital.movcont3 where mvcfch >='2020-03-01 00:00:00' ;
select * from hosvital.movcont2 where mvccfch >='2020-03-01' ;

select count(*) from hosvital.movcont2 where mvcanio= 2020 and mvcmes = 3;  -- 111289	




select count(*) from hosvital.frmsmns where fsmfhrreg >= '2020-03-01 00:00:00' ;  -- 93778			Ordenados		
Select count(*) from hosvital.dspfrmc where dsmfch >= '2020-03-01 00:00:00' ;  -- 48846			Despachados					
			

select * from hosvital.movcont3;				

select  citcmbdto, count(*) -- 1630 citas Medicas
from hosvital.ctrlcitas
where  citfchhra >= '2020-03-01 00:00:00'
group by citcmbdto;

select count(*) from hosvital.procir where profec >='2020-03-01'; --  525  Cirugias

select count(*) from hosvital.refcref where reffch >= '2020-03-01 00:00:00'; -- 209 Referencias	


select count(*) from hosvital.descirmed where codcir in (select procircod from hosvital.procir where profec>= '2020-03-01'); --  304  Descripciones Quirurgicas

select * from hosvital.procir where profec>= '2020-03-01';

select count(*) from hosvital.hccom1 where hisfhorat >= '2020-03-01 00:00:00';  -- 81015				 folios	

select year(m.mvcfch), month (m.mvcfch), day (m.mvcfch), d.doccod,d.docdsc,count(*)
 from hosvital.movcont3 M 
inner join hosvital.docucon d on (d.doccod=m.doccod)
where m.empcod='01' and m.mvfchsys >= '2020-03-01 00:00:00'
group by  year(m.mvcfch), month (m.mvcfch),day (m.mvcfch),d.doccod , d.docdsc
order by year(m.mvcfch), month (m.mvcfch),day (m.mvcfch),d.doccod , d.docdsc ;

-- Veamoscuantas planeaciones, 
-- Cuantas formulaciones



select * from hosvital.frmsmns where fsmfhrreg >= '2020-03-01 00:00:00' ;  -- 45121	

select count(*) from  hosvital.FrmSmns1 where  asfecpapl >= '2020-03-01 00:00:00'; -- 59715			-- Programados
select count(*) from  hosvital.FrmSmns1 where  hcfhhrap >= '2020-03-01 00:00:00';  -- 42428				-- Aplicados

select * from  hosvital.FrmSmns1 where  asfecpapl >= '2020-03-01 00:00:00';

