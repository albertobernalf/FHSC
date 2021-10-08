select *   from hosvital.tmpfac where tfccodcam='746';
select * from hosvital.ingresos where mpcedu='19233274';
select * from hosvital.portar1 where ptcodi='148' and  prcodi= 'S11302';
SELECT * FROM HOSVITAL.MAEPAB1 WHERE MPUCED = '19233274';
SELECT * FROM HOSVITAL.MAEPAB1 where mpnumc in ('746','754');
SELECT * FROM HOSVITAL.TMPFAC1 WHERE TFCEDU = '19233274' and tfprc1= 'S11302';;
SELECT * FROM HOSVITAL.TMPFAC1 WHERE TFCEDU = '2183611' and tfprc1= 'S11302';  -- 754
select * from hosvital.tmpfac where tfccodcam='754';
select * from hosvital.ingresos where mpcedu='2183611';

select * from hosvital.tmpfac where tfmeni= 'SS0021'  and tfccodpab=16 order by tfcedu;

SELECT * FROM HOSVITAL.MAEPAB11 where mpnumc in ('746') order by hiscamfec;

update hosvital.ingresos
set ingfecegr ='0001-01-01 00:00:00.000'
where mpcedu= '19233274' and  ingcsc=3; -- estaba 2020-09-07 17:23:52.000000	

update hosvital.tmpfac  -- estaba 2020-09-07 17:23:52.000000	
set mpfesh='0001-01-01 00:00:00.000'
where tfcedu= '19233274' and tmctving=3;

update hosvital.ingresos
set ingfecegr ='2020-09-07 17:23:52.000000'
where mpcedu= '19233274' and  ingcsc=3;



update hosvital.tmpfac  -- estaba 2020-09-07 17:23:52.000000	
set mpfesh='2020-09-07 17:23:52.000000'
where tfcedu= '19233274' and tmctving=3;

select hisfecsal from hosvital.hccom1 where hisckey='19233274';

select *  from hosvital.hccom1 where hisckey='19233274' and hctvin1=3;

select hisfecsal  from hosvital.hccom1 where hisckey='2183611' and hctvin1=1;

