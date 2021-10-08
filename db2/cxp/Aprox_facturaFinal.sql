

select mpnfac,macscp,prcodi,mahoncod,mavatp,mpinte, round( mavatp) as redondeado,mavlrtot from   hosvital.maeate2 where mpnfac = 573500 and  fcptpotrn='F' and maesanup ='N' order by prcodi,macscp;

select a.mpnfac, a.macscp, a.prcodi,a.mahoncod,a.mpinte,a.mavatp,a.mavlrtot ,maesanup,  round( a.mavatp) as redondeado from  hosvital.maeate2 a where a.mpnfac =573500 and a.prcodi in (select b.prcodi from   hosvital.maeate2 b where b.mpnfac = a.mpnfac and mod(b.mavatp, 1) <> 0);


-- Query Actualiza en la maeate2 el DECIMAL. Anoto el procedimiento

 update hosvital.maeate2
 set mavatp=round( mavatp) , mpinte=round( mpinte)
 where mpnfac =573500 and mod(mavatp, 1) <> 0; 

--Actualiza el total del procedimiento:

update  hosvital.maeate2 a
set mavlrtot  = (select  sum(b.mavatp) from hosvital.maeate2 b where  b.mpnfac = a.mpnfac and b.prcodi =a.prcodi and  fcptpotrn='F' and maesanup <> 'S' and macscp in (21,22,23))
where mpnfac = 573500  and prcodi = '340401'  and  fcptpotrn='F' and macscp in (21,22,23) and maesanup <> 'S';

-- Verifico cedula del paciente

select  mpnfac,mpcedu,mactving,matotf, matotp, matots, mavals,  masalcxc,mavapu from hosvital.maeate where mpnfac = 573500; 

-- Query actualiza maeate 

update  hosvital.maeate a
set a.matotp = (select  sum(mavatp) from hosvital.maeate2  b where  b.mpnfac = a.mpnfac and b. fcptpotrn='F' and b.maesanup  <> 'S' )
where a.mpnfac = 573500 and a.mpcedu = '79327043' and a.mactving=1; 


update  hosvital.maeate set matotf = matotp + matots  where mpnfac = 573500; 
update  hosvital.maeate set mavals = matotf  - mavapu ,masalcxc =   matotf  - mavapu  where mpnfac = 573500; 
	

-- validacion proced y suministros

select  sum(mavatp) from hosvital.maeate2 where  mpnfac = 573500 and fcptpotrn='F' and maesanup <>'S'	; --5610492.00							
select  sum(mavats) from hosvital.maeate3 where  mpnfac = 573500 and fcstpotrn='F' and maesanus <> 'S'	; -- 902281.00	
	
	
-- facturas pendientes:
572851
572879
572881
572893
572914
572970
573000
573052
573084
573106
573119
573144
573249
573319
573349
573357
573358
573449
573574
573644
573652
573668
573703
573767
573792
573808
573825
573833
573880
573882
573913
573937
573986
574065
574085
574094
574130
574132
573500


