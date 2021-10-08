

select * from hosvital.maeate where mpnfac = 576111; - 576111     --  576034
select * from hosvital.maeate2 where mpnfac = 576111;
select * from hosvital.maeate3 where mpnfac = 576111;

select * from hosvital.refact where refatnum = 576034;
select * from hosvital.refact1 where refatnum = 576034;

update hosvital.maeate
set matotp =11921098
where mpnfac = 576034;


update hosvital.maeate
set matotf =22648673,masalcxc=22648673,mavals=22648673
where mpnfac = 576034;



-- 22648673

select mpnfac,matotf,matotp,matots,mavals, masalcxc from hosvital.maeate where mpnfac = 572948;


update hosvital.maeate
set  matotf=914387,matotp=697265,mavals=914387,masalcxc=914387
where mpnfac = 572948;

select  sum(mavatp) from hosvital.maeate2 where  mpnfac = 572948 and fcptpotrn='F' and maesanup ='N'	; --- 697265.00				
select  sum(mavats) from hosvital.maeate3 where  mpnfac = 572948 and fcstpotrn='F' and maesanus ='N'	; --217122.00	
	


select mpnfac,macscp,prcodi,mavatp,mpinte,mavlrtot, maesanup from hosvital.maeate2 where mpnfac = 572948  AND PRCODI = '573201'order by prcodi;

update   hosvital.maeate2
set mavlrtot = 398751
 where  mpnfac = 572948 and fcptpotrn='F' and maesanup ='N' and prcodi = '573201'    and  mavlrtot=  	216473.69	and macscp in (44,	
45	,46	,47	);


update   hosvital.maeate2
set mavlrtot = 398751
 where  mpnfac = 572948 and fcptpotrn='F' and maesanup ='N' and prcodi = '573201'    and  mavlrtot=  	398751.15	
	
	and macscp in (19,20,21);



update   hosvital.maeate2
set mavatp=   127159, mpinte=127159
 where  mpnfac = 572948 and fcptpotrn='F' and maesanup ='N' and prcodi = '573201'   AND mavatp=127158.75 and macscp in (19);

update   hosvital.maeate2
set mavatp=   153298, mpinte=153298
 where  mpnfac = 572948 and fcptpotrn='F' and maesanup ='N' and prcodi = '573201'   AND mavatp=153298.05	 and macscp in (20);

update   hosvital.maeate2
set mavatp=   118294, mpinte=118294
 where  mpnfac = 572948 and fcptpotrn='F' and maesanup ='N' and prcodi = '573201'   AND mavatp=118294.35	 and macscp in (21);


-------------------------------
-----------------------------


select mpnfac,matotf,matotp,matots,mavals, masalcxc from hosvital.maeate where mpnfac = 576221;

select  sum(mavatp) from hosvital.maeate2 where  mpnfac = 576221 and fcptpotrn='F' and maesanup ='N'	; ---  11918318.00					
select  sum(mavats) from hosvital.maeate3 where  mpnfac = 576221 and fcstpotrn='F' and maesanus ='N'	; -- 10747283.00			


select mpnfac,macscp,prcodi,mavatp,mpinte,mavlrtot, maesanup from hosvital.maeate2 where mpnfac = 576221 order by prcodi;


update   hosvital.maeate2
set mavatp=   95695, mpinte=95695
 where  mpnfac = 576221 and fcptpotrn='F' and maesanup ='N' and prcodi = '402101'  	and macscp in (38);

update   hosvital.maeate2
set mavatp=   111210, mpinte=111210
 where  mpnfac = 576221 and fcptpotrn='F' and maesanup ='N' and prcodi = '402101'  	and macscp in (39);

update   hosvital.maeate2
set mavatp=   78652, mpinte=78652
 where  mpnfac = 576221 and fcptpotrn='F' and maesanup ='N' and prcodi = '402101'  	and macscp in (40);


update   hosvital.maeate2
set mavlrtot = 285557
 where  mpnfac = 576221 and fcptpotrn='F' and maesanup ='N' and prcodi = '402101'    and  mavlrtot=  	285555.95		and macscp in (38,39,40);


update   hosvital.maeate2
set mavatp=   30469, mpinte=30469
 where  mpnfac = 576221 and fcptpotrn='F' and maesanup ='N' and prcodi = '441302 '  	and macscp in (46);

update   hosvital.maeate2
set mavatp=   30469, mpinte=30469
 where  mpnfac = 576221 and fcptpotrn='F' and maesanup ='N' and prcodi = '441302'  	and macscp in (47);


update   hosvital.maeate2
set mavlrtot = 213693
 where  mpnfac = 576221 and fcptpotrn='F' and maesanup ='N' and prcodi = '441302'    and  mavlrtot=  216473.69 and macscp in (44,45,46,47);


update hosvital.maeate
set matotp =11918318
where mpnfac = 576221;

update hosvital.maeate
set matotf =22665601, mavals= 22665601, masalcxc=22665601
where mpnfac = 576221;

select mpnfac,matotf,matotp,matots,mavals, masalcxc from hosvital.maeate where mpnfac = 576221;

select mpnfac,macscp,prcodi,mavatp,mpinte,mavlrtot, maesanup from hosvital.maeate2 where mpnfac = 576221 order by prcodi;

select  sum(mavatp) from hosvital.maeate2 where  mpnfac = 576221 and fcptpotrn='F' and maesanup ='N'	;  -- 11918318.00	

----------------------- caso muestra ---------------------------
------------------------------------------------------------------


select  sum(mavatp) from hosvital.maeate2 where  mpnfac = 576122 and fcptpotrn='F' and maesanup ='N'	; --1777881.64						
select  sum(mavats) from hosvital.maeate3 where  mpnfac = 576122 and fcstpotrn='F' and maesanus ='N'	; -- 6615649.00				
select mpnfac,macscp,prcodi,mavatp,mpinte,mavlrtot, maesanup from hosvital.maeate2 where mpnfac = 575573  ;            -- AND PRCODI = '441302'order by prcodi;


update   hosvital.maeate2
set mavatp=   84772				, mpinte=84772		
 where  mpnfac = 575573 and fcptpotrn='F' and maesanup ='N' and prcodi = '441302'   AND mavatp=84772.50	and macscp in (15);

update   hosvital.maeate2
set mavatp=   29690				, mpinte=29690		
 where  mpnfac = 575573 and fcptpotrn='F' and maesanup ='N' and prcodi = '441302'   AND mavatp=29690.40			and macscp in (16);

update   hosvital.maeate2
set mavatp=   32400				, mpinte=32400		
 where  mpnfac = 575573 and fcptpotrn='F' and maesanup ='N' and prcodi = '441302'   AND mavatp=32400.45				and macscp in (17);

update   hosvital.maeate2
set mavlrtot = 146863	
 where  mpnfac = 575573  and fcptpotrn='F' and maesanup ='N' and prcodi = '441302'    and  mavlrtot=146863.35			and macscp in (15,16,17);

select  mpnfac,matotf, matotp, matots, mavals,  masalcxc,mavapu from hosvital.maeate where mpnfac = 575573;  --33843994.08		

update hosvital.maeate
set  matotf=1661699 ,matotp= 1053120.00						,mavals=1661699,masalcxc=1661699  -- estgab 1661700.35	
where mpnfac = 575573;


-- ya hice hasta 575755

-- Factura de prueba : 573052	
-- 1er query

select mpnfac,macscp,prcodi,mahoncod,mavatp,mpinte, round( mavatp) as redondeado,mavlrtot from   hosvital.maeate2 where mpnfac = 576197 and  fcptpotrn='F' and maesanup ='N' order by prcodi,macscp;

select mpnfac, macscp, prcodi,mpinte,mavatp,mavlrtot , round( mavatp) as redondeado from  hosvital.maeate2 where mpnfac =576197 and prcodi in (select prcodi from   hosvital.maeate2 where mpnfac =576197 and mod(mavatp, 1) <> 0);



-- Anoto el procedimiento
-- Query Actualiza en la maeate2 el DECIMAL

 update hosvital.maeate2
 set mavatp=round( mavatp) , mpinte=round( mpinte)
 where mpnfac =576197 and mod(mavatp, 1) <> 0; 

--Actualiza el total del procedimiento:

update  hosvital.maeate2
set mavlrtot  = (select  sum(mavatp) from hosvital.maeate2 where  mpnfac = 576197 and prcodi = '574201' and  fcptpotrn='F' and maesanup ='N' and macscp in (48,49,50,51) )
where mpnfac = 576197 and prcodi = '574201' and maesanup<>'S' AND  FCPTPOTRN='F' and macscp in (48,49,50,51);

-- Valido que el arreglo haya funcionado

select mpnfac, mafepr, macscp,prcodi,mavatp,mavlrtot , round( mavatp) as redondeado  from hosvital.maeate2 where mpnfac =575833 and prcodi= '452301';
-- me tire la 574201

select  mpnfac,mpcedu,mactving,matotf, matotp, matots, mavals,  masalcxc,mavapu from hosvital.maeate where mpnfac = 576197; 

-- Query actualiza maeate 

update  hosvital.maeate a
set a.matotp = (select  sum(mavatp) from hosvital.maeate2  b where  b.mpnfac = a.mpnfac and b. fcptpotrn='F' and b.maesanup  <> 'S' )
where a.mpnfac = 576197 and a.mpcedu = '10522686' and a.mactving=1; 


update  hosvital.maeate set matotf = matotp + matots  where mpnfac = 576197; 
update  hosvital.maeate set mavals = matotf  - mavapu ,masalcxc =   matotf  - mavapu  where mpnfac = 576197; 
	
-- validacion
select  sum(mavatp) from hosvital.maeate2 where  mpnfac = 576184 and fcptpotrn='F' and maesanup ='N'	; --5610492.00							
select  sum(mavats) from hosvital.maeate3 where  mpnfac = 576184 and fcstpotrn='F' and maesanus ='N'	; -- 902281.00	
	
	


