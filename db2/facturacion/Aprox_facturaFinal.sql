select mpnfac,macscp,prcodi,mahoncod,mavatp,mpinte, round( mavatp) as redondeado,mavlrtot from   hosvital.maeate2 where mpnfac = 624538 and  fcptpotrn='F' and maesanup ='N' order by prcodi,macscp;

select a.mpnfac, a.macscp, a.prcodi,a.mahoncod,a.mpinte,a.mavatp,a.mavlrtot ,maesanup,  round( a.mavatp) as redondeado from  hosvital.maeate2 a where a.mpnfac =624538
 and a.prcodi in (select b.prcodi from   hosvital.maeate2 b where b.mpnfac = a.mpnfac and mod(b.mavatp, 1) <> 0);


-- Query Actualiza en la maeate2 el DECIMAL. Anoto el procedimiento

 update hosvital.maeate2
 set mavatp=round( mavatp) , mpinte=round( mpinte)
 where mpnfac =594890 and mod(mavatp, 1) <> 0; 

--Actualiza el total del procedimiento:

update  hosvital.maeate2 a
set mavlrtot  = (select  sum(b.mavatp) from hosvital.maeate2 b where  b.mpnfac = a.mpnfac and b.prcodi =a.prcodi and  fcptpotrn='F' and maesanup <> 'S' and macscp in (34,35,36,37))
where mpnfac = 594890  and prcodi = '808061'  and  fcptpotrn='F' and macscp in (34,35,36,37) and maesanup <> 'S';

-- Verifico cedula del paciente

select  mpnfac,mpcedu,mactving,matotf, matotp, matots, mavals,  masalcxc,mavapu from hosvital.maeate where mpnfac = 618140	
; 

-- Query actualiza maeate 

update  hosvital.maeate a
set a.matotp = (select  sum(mavatp) from hosvital.maeate2  b where  b.mpnfac = a.mpnfac and b. fcptpotrn='F' and b.maesanup  <> 'S' )
where a.mpnfac = 614259 and a.mpcedu = '5836719' and a.mactving=3; 


update hosvital.maeate set matots=2733090	 where mpnfac = 618140; 
update  hosvital.maeate set matotf = matotp + matots  where mpnfac = 618140; 
update  hosvital.maeate set mavals = matotf  - mavapu ,masalcxc =   matotf  - mavapu  where mpnfac = 618140; 
	

-- validacion proced y suministros

select  sum(mavatp) from hosvital.maeate2 where  mpnfac = 618140 and fcptpotrn='F' and maesanup <>'S'	; --13791342.00				
								
select  sum(mavats) from hosvital.maeate3 where  mpnfac = 618140 and fcstpotrn='F' and maesanus <> 'S';	--; 2733090.00	


select * from hosvital.maeate where mpnfac    = 614259; 

select  prcodi,  macanpr, mpinte , mavatp, mavlrtot from hosvital.maeate2 
where mpnfac  = 614259;

select  prcodi,  macanpr, mpinte , mavatp, mavlrtot from hosvital.maeate2 
where mpnfac  = 614259 and macanpr*mpinte <> mavatp;

select * from hosvital.admglo11 where mpnfac  = 614259;

select * from hosvital.admglo01 where aglremnr   = 24604	;

select * from hosvital.admglo11 where aglremnr   = 24604	;

select  prcodi,  macanpr, mpinte , mavatp, mavlrtot,maesanup from hosvital.maeate2 where mpnfac  = 614259 and mavatp >=72800 and  mavatp <=73000 ;
select  MAHONCOD,MPNGRP,MAAGRCIR,FCPTPOTRN, MAESANUP  from hosvital.maeate2 where mpnfac  = 614259 and mavatp >=72800 and  mavatp <=73000 ;