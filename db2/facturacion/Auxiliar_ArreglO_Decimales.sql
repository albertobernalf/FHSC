SELECT * FROM HOSVITAL.MAEATE2 WHERE MPNFAC = 629751;
SELECT * FROM HOSVITAL.MAEATE3 WHERE MPNFAC = 629751;
SELECT * FROM HOSVITAL.MAEATE WHERE MPNFAC = 629751;

UPDATE  HOSVITAL.MAEATE
SET MATOTS = 0, MATOTF=0, MAVALS=0,MASALCXC=0 -- TENIA $ 1969 PESITOS
 WHERE MPNFAC = 629751;

select mpnfac, matipdoc, macscp, prcodi,macanpr,mpinte, mavatp,mod(mpinte,macanpr),   mapvlrsiv, mahoncod, (mapvlrsiv - mpinte) as descuadre
 from hosvital.maeate2
where  mpnfac = 629751      and fcptpotrn='F' and maesanup <>'S';  -- and mpinte <>  mapvlrsiv


-- suministros

select mpnfac, matipdoc, macscs, msreso,macans,mavalu, mavats,mod(mavalu,macans),  mavats1, masvlrsiv, macans * (mavalu - masvlrsiv) as dif
 from hosvital.maeate3 
where  mpnfac = 628510 and  fcstpotrn='F' and maesanus<>'S'  and msreso='S55201'; --and mavalu <> masvlrsiv ;


select mpnfac,facfch,matotp,matots, matotf, mavals,masalcxc from hosvital.maeate where mpnfac = 628510;

select sum(macans*mavalu) , sum(mavats)
 from hosvital.maeate3 
where  mpnfac = 629751 and  fcstpotrn='F' and maesanus<>'S' ;

select mpnfac,msreso,macans,mavalu,mavats
 from hosvital.maeate3 
where  mpnfac = 628510 and  fcstpotrn='F' and maesanus<>'S' and msreso='S55201' ;

update hosvital.maeate3 
set mavalu=20.00
where  mpnfac = 628510 and  macscs= 54 and  fcstpotrn='F' and maesanus<>'S' and msreso='S55201' ; --estaba 15.00

