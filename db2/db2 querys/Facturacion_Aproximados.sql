select * from hosvital.capbas where mpcedu = '1031174818';
select * from hosvital.tmpfac where tfcedu = '1031174818';

select  sum(tfvatp) from hosvital.tmpfac1 where tfcedu = '1031174818';  -- 3682827.00	


select  sum(tfvat)s from hosvital.tmpfac2 where tfcedu = '1031174818'; 

select  tfprc1,tfvatp,tfcanpr,tfinte , tfinte * tfcanpr  from hosvital.tmpfac1 where tfcedu = '1031174818' ;

select  tfprc1,tfcscp,tfvatp,tfcanpr,tfinte , tfinte * tfcanpr from hosvital.tmpfac1 where tfcedu = '1031174818'  and tfprc1 = '511000' order by tfprc1 ;  -- 3682825.50	
select  * from hosvital.tmpfac1 where tfcedu = '1031174818'; 


511000   	200088.50	
	
511000   	209712.75	
511000   	179627.55	
512104   	209486.70	




select sum(tfvats) from hosvital.tmpfac2 where;  -- 2224814.00



/*

estaba2

511000   	19	200089.00	1	200088.50	200088.50	
511000   	20	151248.00	1	151248.00	151248.00	
511000   	21	209713.00	1	209712.75	209712.75	
511000   	22	179628.00	1	179627.55	179627.55	

*/
/*
update hosvital.tmpfac1	
set tfvatp=200089,tfinte=200089
where   tfcedu = '1031174818' and tfprc1 = '511000' and tfcscp = 19 	;

update hosvital.tmpfac1	
set tfvatp=209713 , tfinte=209713
where   tfcedu = '1031174818' and tfprc1 = '511000' and tfcscp = 21 	;

update hosvital.tmpfac1	
set tfvatp=179628 , tfinte=179628
where   tfcedu = '1031174818' and tfprc1 = '511000' and tfcscp = 22	;



update hosvital.tmpfac1	
set tfvatp=209487
where   tfcedu = '1031174818' and tfprc1 = '512104' and tfcscp = 33 and  tfvatp= 209486.70	;


*/
--------------------------------------

select * from hosvital.tmpfac1 where tfcedu = '1026560986'  and tfprc1 = '760902';

update hosvital.tmpfac1	
set tfvatp=132232 , tfinte=132232
where   tfcedu = '1026560986' and tfprc1 = '760902' and tfcscp =17	 and tfvatp=132232.40;


update hosvital.tmpfac1	
set tfvatp=112772 , tfinte=112772
where   tfcedu = '1026560986' and tfprc1 = '760902' and tfcscp =18	 and tfvatp=112771.55;


update hosvital.tmpfac1	
set tfvlrtot = 366797
where   tfcedu = '1026560986' and tfprc1 = '760902' and tfcscp  in (16,17,18) 	 and tfvlrtot=366796.95	;


select tfprc1,tfcscp,tfcanpr,tfvatp,tfinte,tfvlrtot from hosvital.tmpfac1 where tfcedu = '39719935'   and tfprc1 = '512104';
select * from hosvital.tmpfac1 where tfcedu = '39719935'  ;  --and tfprc1 = '512104';

select mpnfac, facfch from hosvital.maeate where mpcedu = '1026560986';

update hosvital.tmpfac1
set tfvatp= 273273, tfinte=273273
 where tfcedu = '39719935'   and tfprc1 = '512104' and tfcscp=45 and  tfvatp= 273274.50	;

update hosvital.tmpfac1
set tfvatp= 204135, tfinte=204135
 where tfcedu = '39719935'   and tfprc1 = '512104' and tfcscp=46 and  tfvatp= 204134.85	
	;


update hosvital.tmpfac1
set tfvlrtot=1030632
 where tfcedu = '39719935'   and tfprc1 = '512104' and tfcscp in (42,43,44,45,46) and  tfvlrtot= 1030633.35		;


-------------------------------------
select * from hosvital.tmpfac where tfcedu = '28707892'  ;
select tfprc1,tfcscp,tfcanpr,tfvatp,tfinte,tfvlrtot from hosvital.tmpfac1 where tfcedu = '28707892' and tfprc1 ='250002' ;

update hosvital.tmpfac1
set tfvatp=198164, tfinte=198164
 where tfcedu = '28707892'   and tfprc1 = '250002' and tfcscp in (22)  ; --and  tfvlrtot= 521764.50			;

update hosvital.tmpfac1
set tfvatp=149611, tfinte=149611
 where tfcedu = '28707892'   and tfprc1 = '250002' and tfcscp in (23) ; -- and  tfvlrtot= 521764.50			;




update hosvital.tmpfac1
set tfvlrtot = 521765
 where tfcedu = '28707892'   and tfprc1 = '250002' and tfcscp in (21,22,23) ;


--------------


