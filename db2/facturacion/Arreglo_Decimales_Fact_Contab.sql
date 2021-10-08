-- Query detecta casos masivos  maeate2


select M.FACFCH,m.mpnfac, m.mpmeni, mae.menomb,m.matipdoc,m2.mafepr, m2.macscp, m2.prcodi,m2.macanpr,m2.mpinte, m2.mavatp,mod(m2.mpinte,m2.macanpr),   m2.mapvlrsiv, m2.mahoncod, (m2.mapvlrsiv -m2. mpinte) as descuadre
 from hosvital.maeate2 m2
INNER JOIN hosvital.maeate m on (m.matipdoc=m2.matipdoc and m.mpnfac = m2.mpnfac)
inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni)
where  m2.mafepr >= '2021-01-01 00:00:00'  and m2.mpinte <>  mapvlrsiv    and m2.fcptpotrn='F' and m2.maesanup <>'S'
order by m2.mafepr, m2.mpnfac;


select M.FACFCH,m.mpnfac, m.mpmeni, mae.menomb,m.matipdoc,m2.mafcsu, m2.macscs, m2.msreso,m2.macans,m2.mavalu, m2.mavats,mod(m2.mavalu,m2.macans),   m2.masvlrsiv,  (m2.masvlrsiv -m2. mavalu) as descuadre
 from hosvital.maeate3 m2
INNER JOIN hosvital.maeate m on (m.matipdoc=m2.matipdoc and m.mpnfac = m2.mpnfac)
inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni)
where  m2.mafcsu >= '2021-01-01 00:00:00'  and m2.mavalu <>  masvlrsiv    and m2.fcstpotrn='F' and m2.maesanus <>'S'
order by m2.mafcsu, m2.mpnfac;

-- ACTUALIZACIONES

-- PROCEDIMIENTOS

select mpnfac, matipdoc, macscp, prcodi,macanpr,mpinte, mavatp,mod(mpinte,macanpr),   mapvlrsiv, mahoncod, (mapvlrsiv - mpinte) as descuadre
 from hosvital.maeate2
where  mpnfac in (652133)	and mpinte <>  mapvlrsiv    and fcptpotrn='F' and maesanup <>'S';

update hosvital.maeate2
set  mapvlrsiv=mpinte
where  mpnfac in (652442	)  and mpinte <>  mapvlrsiv    and fcptpotrn='F' and maesanup <>'S';

-- SUMINISTROS

select mpnfac, matipdoc, macscs, msreso,macans,mavalu, mavats,mod(mavalu,macans),  mavats1, masvlrsiv, macans * (mavalu - masvlrsiv) as dif
 from hosvital.maeate3 
where  mpnfac  in (652263)	          	  and mavalu <> masvlrsiv and  fcstpotrn='F' and maesanus<>'S' ;
     	
update  hosvital.maeate3 
set masvlrsiv = mavalu
where   mpnfac in  (652442)  and mavalu <> masvlrsiv and  fcstpotrn='F' and maesanus<>'S';

-- --TABLA MAEATE3 DIGITALWARE

select mpnfac, macscs, MAFCSU, msreso,macans,mavalu, mavats,mod(mavalu,macans),  mavats1, masvlrsiv  from hosvital.maeate3  where  mpnfac = 640799	 ;

update hosvital.maeate3 
set  mavalu=866.2 --estaba 210.1000	
where  mpnfac = 632978   and  fcstpotrn='F' and maesanus<>'S' AND MSRESO  in ('0009MQ45') and mavalu=866.23 and macscs=170;

select * from hosvital.maeate3 where mpnfac =633003;
select mpnfac, macscs, MAFCSU, msreso,macans,mavalu, mavats,mod(mavalu,macans),  mavats1, masvlrsiv  from hosvital.maeate3  where  mpnfac = 640799	 ;


select * from hosvital.maeate3 where mpnfac =640602;

select mpnfac, matotf, matotp, matots, masalcxc, mavals from hosvital.maeate where mpnfac =640602;

update hosvital.maeate3
set mavalu=210, masvlrsiv=210
 where mpnfac =633576 and macscs=333 and msreso='0016MQ03' and macans=4;

select MPNFAC, SUM(mavalu* Macans), SUM(MAVATS), SUM(mavalu),SUM(MASVLRSIV)
 from hosvital.maeate3 
where  mpnfac = 640602  and  fcstpotrn='F' and maesanus<>'S'
GROUP BY MPNFAC;


select * from hosvital.maeate3 where mpnfac =635557 and macscs= 217;

update hosvital.maeate3 
set mavalu=0,mavats1=0
where mpnfac =635557 and macscs= 217;


-- CASO 1

-- Consultamos la MAETAE

SELECT * FROM HOSVITAL.MAEATE WHERE MPNFAC = 651555;
SELECT * FROM HOSVITAL.MAEATE2 WHERE MPNFAC = 651555;
SELECT * FROM HOSVITAL.MAEATE3 WHERE MPNFAC = 651555;

SELECT * FROM HOSVITAL.MAEATE WHERE mpcedu = '2888302';
select * from hosvital.capbas where mpcedu='2888302';

select * from hosvital.refact where refatnum= 651555;


select matipdoc,  MPNFAC, maestf, MATOTF, MATOTP, MATOTS, MAVALS, MASALCXC   from hosvital.maeate where mpnfac = 652133;
 ; --3002276.00	1721000.00	1281276.00	3002276.00	3002276.00	


UPDATE HOSVITAL.MAEATE 
SET matotf=1721000.00	,    MAVALS=1721000.00,  MASALCXC=1721000.00		,matots=0	
 WHERE MPNFAC =652133  ;

-- Consultamos la maetae2

select *  from hosvital.maeate3 where mpnfac = 651555 ;

select MPNFAC, SUM(mpinte* Macanpr), SUM(MAVATp), SUM(mpinte),SUM(MApVLRSIV)  --1721000.00	1721000.00	1275950.00		
 from hosvital.maeate2
where  mpnfac =  652133  and  fcptpotrn='F' and maesanup<>'S'
GROUP BY MPNFAC;

-- Consultamos la maetae3

select MPNFAC, SUM(mavalu* Macans), SUM(MAVATS), SUM(MAVATS1) , SUM(mavalu),SUM(MASVLRSIV)  --
from hosvital.maeate3	
where  mpnfac =  652133  and  fcstpotrn='F' and maesanus<>'S'
GROUP BY mpnfac;



--  CASO No 2

-- Consultamos la MAETAE
	
select matipdoc,  MPNFAC, maestf, MATOTF, MATOTP, MATOTS, MAVALS, MASALCXC   from hosvital.maeate where mpnfac = 648119 ; --2334918.00	2084710.00	250208.00	2334918.00	2334918.00		

UPDATE HOSVITAL.MAEATE 
SET matotf=2084710,   MATOTS=0, MAVALS=2084710, MASALCXC=2084710
 WHERE MPNFAC = 648119 ;



