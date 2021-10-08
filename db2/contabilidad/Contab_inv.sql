select * from hosvital.movinv3 where doccod='ISI' AND DOCNRO= 1156555;
select * from hosvital.movinv4 where doccod='ISI' AND DOCNRO= 1156555;

select * from hosvital.movinv3 where doccod='ISI' AND DOCNRO= 1156717;

select * from hosvital.movinv4 where doccod='ISI' AND DOCNRO IN (1156714,1156715, 1156716);

select * from hosvital.movinv3 where doccod='ISI' AND DOCNRO IN (1156714,1156700, 1156716, 1156717);

select * from hosvital.movinv3 where doccod='ISI' AND MVTOFCH >= '2020-06-01 00:00:00' AND TRANCOD IN ('SALBAJ','SALVEN');

select DISTINCT TRANCOD  from hosvital.movinv3 where doccod='ISI' AND MVTOFCH >= '2020-06-01 00:00:00' ;

SELECT * FROM HOSVITAL.KARDEX1 WHERE DOCTIP='ISI' AND DOCNRO=1156717;


select DISTINCT TRANCOD  from hosvital.movinv3 where doccod='ISI' AND  MVTOFCH <= '2020-05-31 23:59:59' ;


SELECT * FROM HOSVITAL.NICUENTAS WHERE NICNTCOD='53154002';


SELECT * FROM HOSVITAL.CUENTAS WHERE CNTCOD='53154002';

select * from hosvital.movinv3 where doccod='ISI' AND MVTOFCH >= '2015-01-01 00:00:00' AND TRANCOD IN ('SALBAJ');
select * from hosvital.movinv3 where doccod='ISI' AND MVTOFCH >= '2019-06-01 00:00:00' AND TRANCOD IN ('SALTRAS');

