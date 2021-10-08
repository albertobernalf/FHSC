SELECT * FROM HOSVITAL.MOVBAN  WHERE doccod='RNA' and MVBNROCMP=932;
SELECT * FROM HOSVITAL.MOVBAN  WHERE  MVBNROCMP=932;
SELECT * FROM HOSVITAL.MOVBAN  WHERE  MVBNROCMP=2196;

select * from hosvital.movcxc where mccnumobl='2196';

select * from hosvital.movcxc where mccnumobl in ('2196','932','809','679');

select * from hosvital.movcont3  where doccod='FV' and mvcnro  in ('57','22','24','26');

select * from hosvital.hojobl  where  empcod='02' and hojnumobl  in ('57','22','24','26');

/*

-- Tocaria cambiarles el tercero

22             	52886671       	
24             	51980253       	
26             	79672269       	
57             	52706439       	


*/

 -- update  hosvital.hojobl set cliciod='53116697' where  empcod='02' and hojnumobl  in ('57','22','24','26');


select * from hosvital.movcxc where mccnumobl in ('2196','932','809','679');

