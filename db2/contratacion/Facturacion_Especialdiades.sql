select * from hosvital.maeate2;
-- enero a junilde este año

select * from hosvital.maeesp;
select mpnfac,mahoncod,mecomm from hosvital.maeate2 where mafepr >='2019-06-01 00:00:00' and mahoncod ='01' and mpnfac = 580752 order by mpnfac;
select * from hosvital.maeate2 where mafepr >='2019-06-01 00:00:00' and mpnfac = 583888 and fcptpotrn = 'F'   and maesanup <>'S'   order by mpnfac;


SELECT  mae.menome,count(*)
FROM hosvital.maeate2 m2
inner join hosvital.maeate m on (m.mpnfac=m2.mpnfac)
inner join  hosvital.maeesp mae on (mae.mecode = m2.mecomm)
where m.facfch>= '2019-01-01' and  m.facfch<= '2019-06-30' and mahoncod = '01'  and m2.fcptpotrn = 'F' and maesanup <>'S' and m.mpnfac = 583888	
	
	
group by mae.menome;

SELECT  mae.menome,count(*)
FROM hosvital.maeate2 m2
inner join hosvital.maeate m on (m.mpnfac=m2.mpnfac)
inner join  hosvital.maeesp mae on (mae.mecode = m2.mecomm)
where m.facfch>= '2019-01-01' and  m.facfch<= '2019-06-30' and mahoncod = '01'  and m2.fcptpotrn = 'F' and maesanup <>'S' 
group by mae.menome
order by mae.menome;
