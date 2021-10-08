select * from hosvital.capbas where mpnomc like ('%BERT%GOMEZ%ZAM%');

SELECT * FROM HOSVITAL.INGRESOS WHERE MPCEDU ='20734023';

update hosvital.ingresos
set ingfecegr= '2018-05-12 07:29:03'
where mpcedu = '20734023' and  ingcsc=5;

select * from hosvital.maepab1 where mpuced = '20734023';

select * from hosvital.maepab1 where mpnumc='OBM06' ;    -- order by hiscamfec ;

select * from hosvital.maepab11 where mpnumc='OBM06' order by hiscamfec, hiscamhor;

/*

insert into hosvital.maepab11 values ('20','OBM06',9991,'L','2019-05-06','07:41:58','20734023','CC','.B.<ÑB¤:,,',5	);

*/

select * from hosvital.maepab1 order by mpnumc;

update hosvital.maepab1
set mpdisp=0,mpuced=0,mpctvin=0,mpcodca='',mpfchi= '0001-01-01 00:00:00.000000'
 where mpnumc='OBM06';



