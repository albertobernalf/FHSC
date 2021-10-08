SELECT * FROM hosvinew.NIRSMAUX WHERE NIRCEMP='01' AND NIRCANIO=2020 AND NIRCMES >=4;
SELECT * FROM hosvinew.NIRSMGEN WHERE NIRCEMP='01' AND NIRCANIO=2020 AND NIRCMES >=4;

select empcod,nimc1ma, nimc1mg , count(*)
 from hosvinew.nimovcon1 
where nimc1fch >= '2020-04-01 00:00:00'  and nimc1fch <= '2020-04-30 23:59:59' 
group by empcod,nimc1ma, nimc1mg;

SELECT *  FROM hosvinew.NIMOVCON1  WHERE NIMC1FCH >='2020-04-01 00:00:00' AND DOCCOD='REC';

-- Local



select * from hosvinew.movcont3;


select empcod,MVCEST, mvcmayaux, mvcmaygen , count(*)
from hosvinew.movcont3
where mvcfch >= '2020-04-01 00:00:00'  and mvcfch <= '2020-04-30 23:59:59' 
group by empcod,mvcest,mvcmayaux, mvcmaygen ;



SELECT count(*) FROM hosvinew.rsmaux WHERE rsmempcod='01' AND rsmano=2020 AND rsmmes =4;  -- 2252	
SELECT count(*) FROM hosvinew.rESMCUE  WHERE rsmempcod='01' AND rsmano=2020 AND rsmmes =4; --  316844	 /  316844	


select empcod,nimc1ma, nimc1mg , count(*)
 from hosvinew.nimovcon1 
where nimc1fch >= '2020-04-01 00:00:00'  and nimc1fch <= '2020-04-30 23:59:59' 
group by empcod,nimc1ma, nimc1mg;


SELECT * 
FROM HOSVInew.NIMOVCON1
WHERE EMPCOD = '01' and doccod='FAR' AND NIMCNRO = 617194 ;


select MT2.EMPCOD , MT2.DOCCOD , MT2.NIMCNRO , MT2.MCDPTO , MT2.NIMC2CSC , MT2.NICNTVIG , MT2.NIMC2ANIO , MT2.NIMC2MES , MT2.NICNTCOD , MT2.NIMC2AJS , MT2.CNUCOD , MT2.CNUSUB , MT2.CNTSUB , MT2. TRCCOD , MT2.CNCCOD ,MT2.NIMC2NAT , MT2.NIMC2VL , ( SELECT hosvinew.EMPRESA.TPCCOD FROM hosvinew.EMPRESA WHERE hosvinew.EMPRESA.EMPCOD = '01')
from hosvinew.nimovcon2 MT2
where  nimc2anio=2020 and  nimc2mes=4 and doccod='FAR' ; --  and nicntcod='14555001';


SELECT * FROM hosvinew.NIMOVCON1 WHERE EMPCOD = '01' and doccod='ISI' AND NIMCNRO = 1164046 ;
SELECT * FROM hosvinew.NIMOVCON1 WHERE EMPCOD = '01' and doccod='FAR' AND NIMCNRO = 617196 ;

UPDATE hosvinew.NIMOVCON1
SET nimc1ma='N', nimc1mg='N'
 WHERE EMPCOD = '01' and doccod='FAR' AND NIMCNRO = 617194 ;
 

CALL hosvinew.SP_CURSORMAYORIZACION_1 ( '01' , 'FAR' , 617196	 , '001' , 1 ,2020 ,1 ,'13010501' ,'N'  , 1 , '' , '' , '' , 900156264       ,'' , 'D' , 269725.00	, 'N' , 'S' ) ;



