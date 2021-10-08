select * from hosvital.movban where doccod='CEG'AND MVBNROCMP=33123;
select * from hosvital.movban1 where doccod='CEG'AND MVBNROCMP=33123;

select * from hosvital.movCONT2 where doccod='CEG'AND MVCNRO=33123;

SELECT * FROM HOSVITAL.MOVCXP WHERE DOCCOD='CEG' AND MVCXPNRO=33123;


update  hosvital.movban set   mvbvlr = 0.0 where doccod='CEG'AND MVBNROCMP=33123;  -- estaba en  5302922.00	

update hosvital.movCONT2 set mvcvlrlc=0.0, mvcvlr= 0 where doccod='CEG'AND MVCNRO=33123;

update HOSVITAL.MOVCXP set mvcxpval=0.0 WHERE DOCCOD='CEG' AND MVCXPNRO=33123;

select * from hosvital.hojoblprv where prvcod='1023890124';

update  hosvital.hojoblprv 
set hoptotdeb =  hoptotdeb	 -   5302922
where prvcod='1023890124';

select * from hosvinew.movban where doccod='CEG'AND MVBNROCMP=33060;
update  hosvinew.movban set  bancod=1  where doccod='CEG'AND MVBNROCMP=33060;

select * from hosvinew.cuentas where empcod  = '01' and cntcod in ('11100501','11050501') and cntvig=2019;

update  hosvinew.cuentas 
set cntint='N/A'
where empcod  = '01' and cntcod in ('11050501') and cntvig=2019;