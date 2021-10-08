select * from hosvinew.nimovcon1 where EMPCOD='01' AND nimc1fch >= '2020-01-01 00:00:00'  and nimc1fch <= '2020-01-31 23:59:59' ;

select empcod,nimc1ma, nimc1mg , count(*)
 from hosvinew.nimovcon1 
where nimc1fch >= '2020-01-01 00:00:00'  and nimc1fch <= '2020-01-31 23:59:59' 
group by empcod,nimc1ma, nimc1mg;

/*

update  hosvinew.nimovcon1 
set nimc1ma='N', nimc1mg='N'
where empcod='01' and nimc1fch >= '2020-01-01 00:00:00'  and nimc1fch <= '2020-01-31 23:59:59' ;
*/

select * from hosvinew.nimovcon2 WHERE nimc2anio=2020 and nimc2mes=1;

select * from hosvinew.nirsmaux where nircemp='01' and nircanio=2020 ;
select * from hosvinew.nirsmgen  where nircemp='01' and nircanio=2020 ;

/*

delete from hosvinew.nirsmaux where nircemp='01' and nircanio=2020 ;
delete from hosvinew.nirsmgen  where nircemp='01' and nircanio=2020 ;

*/

SELECT hosvinew.EMPRESA.TPCCOD FROM hosvinew.EMPRESA WHERE hosvinew . EMPRESA.EMPCOD = '01';

select * from hosvinew.nimovcon2 WHERE DOCCOD='FAR' AND NIMCNRO=617193;

select MT2.EMPCOD , MT2.DOCCOD , MT2.NIMCNRO , MT2.MCDPTO , MT2.NIMC2CSC , MT2.NICNTVIG , MT2.NIMC2ANIO , MT2.NIMC2MES , MT2.NICNTCOD , MT2.NIMC2AJS , MT2.CNUCOD , MT2.CNUSUB , MT2.CNTSUB , MT2. TRCCOD , MT2.CNCCOD ,MT2.NIMC2NAT , MT2.NIMC2VL , ( SELECT hosvinew.EMPRESA.TPCCOD FROM hosvinew.EMPRESA WHERE hosvinew.EMPRESA.EMPCOD = '01')
from hosvinew.nimovcon2 MT2
where  nimc2anio=2020 and  nimc2mes=3 and doccod='FAR' ; --  and nicntcod='14555001';


SELECT * 
FROM hosvinew.NIMOVCON1
WHERE EMPCOD = '01' and doccod='ISI' AND NIMCNRO = 1164046 ;



CALL hosvinew.SP_CURSORMAYORIZACION_1 ( '01' , 'FAR' , 626340	 , '001' , 1 ,2020 ,1 ,'13010501' ,'N'  , 1 , '' , '' , '' , 900156264       ,'' , 'D' , 1269833 , 'N' , 'S' ) ;


SELECT * FROM hosvinew.NIRSMAUX WHERE NIRCEMP='01' AND NIRCANIO=2020 AND NIRCMES >=4;
SELECT * FROM hosvinew.NIRSMGEN WHERE NIRCEMP='01' AND NIRCANIO=2020 AND NIRCMES >=4;



select  NIMCNRO, nimc1ma,  nimc1mg  from hosvinew.nimovcon1 WHERE  doccod='FAR' AND NIMCNRO=626340	 ;


-- 623803

update  hosvinew.nimovcon1 
set nimc1ma='N', nimc1mg='N'
where empcod='01' and nimc1fch >= '2020-01-01 00:00:00'  and nimc1fch <= '2020-05-31 23:59:59' and nimcnro= 623803;