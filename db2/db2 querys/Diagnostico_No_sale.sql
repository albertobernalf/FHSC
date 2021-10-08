select * from hosvital.hccom1 where hisckey = '17142609'   and hiscsec= 445 order by hiscsec;
select * from hosvital.hccom5  where hisckey = '17142609'    and hiscsec= 445 order by hiscsec;
select * from hosvital.hccom51 where hisckey = '17142609'    and hiscsec= 445 order by hiscsec;

select * from hosvital.hcdiagn  where hisckey = '17142609' ;  --  and hiscsec= 445 order by hiscsec;
select * from hosvital.hcdiagn1  where hisckey = '17142609'  and hiscsec= 445  order by hiscsec;

select * from hosvital.maedia
 where dmcodi in ('M545', 	
'I638',
'I638' ,	
'I269' ,	
'C348', 	
'I269' )	;

select * from hosvital.ingresos ;

select * from hosvital.tmpfac order by tfcedu;

select * from hosvital.maepro where prcodi in ('911003','911201','911020');