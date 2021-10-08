select * from hosvital.movcont2 where doccod='RCM' and mvcnro = 298 AND MVCCSC=91 ;

select * from hosvital.hojoblprv where empcod='01' and prvcod='890900943';; 
select * from hosvital.hojoblprv where empcod='01' and prvcod='890900943';;

select * from hosvital.hojoblprv where hopnoobl ='301410502466';

select * from hosvital.movcxp where doccod='RCM' and  mvcxpnro =298;

select * from hosvital.movcont2 where doccod='RCM' and mvcnro = 298 and mvcvlrlc=20800;

select * from hosvital.movcont2 where doccod='RCM' and mvcnro = 298 order by cntcod;
             
insert into   hosvital.movcxp values ('01','RCM','001',298,91,2019,'2019-04-26 14:55:54.00000','PES',1.00,'301410502466','22050501','890900943','D',312900,0,' ',' ',' ',' ','REEMBOLSO CAJA ABRIL 2019','S','N',' ',' ');

UPDATE  hosvital.hojoblprv
SET HOPTOTDEB=312900.00	
 where hopnoobl ='301410502466';
