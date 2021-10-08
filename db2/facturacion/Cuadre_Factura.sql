select mafcsu,macscs,msreso,macans,mavalu,mavats,MAVATS1,MASVLRSIV
 from hosvital.maeate3 where mpnfac = 629751;   --  and msreso ='0548P01A';

select * from hosvital.maeate3 where mpnfac = 623576;

-- 13480159.00	2303469.00	0	15783628.00	15783628.00	


select mod(5/2);	
	
select SUM(MACANS), SUM(MAVALU),sum(macans*mavalu) , sum(mavats), SUM(MAVATS1)
 from hosvital.maeate3 
where mpnfac = 629751 and fcstpotRn='F' AND MAESANUS ='N';  -- 2303469.00	/ 2303468.000000	


update hosvital.maeate3
set mavalu= 673,mavats=2019, MAVATS1=2019, MASVLRSIV=673
 where mpnfac = 623576 and msreso ='0548P01A' and macscs=133;
-- 0548P01A       	


select *  from  hosvital.maeate where mpnfac =623576;

update hosvital.maeate
set matots=2303468,matotf=15783627,mavals=15783627, masalcxc=15783627
where mpnfac =623576;

select * from hosvital.movcont3 where doccod='FAR' AND MVCNRO = 623576;

SELECT * FROM HOSVITAL.ADMGLO11 WHERE MPNFAC=623576;

SELECT *  from hosvital.maeate3 where mpnfac = 623576;
