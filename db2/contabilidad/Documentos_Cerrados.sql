select EMPCOD, MVCNRO,  MVCEST from hosvital.movcont3  
where  doccod='CA' AND MVCNRO IN (19966 );

SELECT * FROM HOSVITAL.DOCUCON WHERE DOCCOD='CEF';

select EMPCOD, DOCCOD,MVCNRO,  MVCEST from hosvital.movcont3  
where   MVCNRO IN (647	        );

select * from hosvital.movcont3 where empcod='01' AND  mvcnro= 33325 ;
select * from hosvital.movcont2 where empcod='01' and doccod='PCP' AND  mvcnro= 2357 ;

update  hosvital.movcont3
set  mvcest ='N'
WHERE  EMPCOD='01' AND  doccod='DRC' AND MVCNRO   IN (24678     ) and mvcest='S';


update  hosviTAL.movcont3
set  mvcest ='S'
WHERE  EMPCOD='01' AND    doccod='CA' AND MVCNRO IN  (19966 )  and mvcest='C';

select * from hosvital.NIMOVCON1   
where  EMPCOD='03' AND DOCCOD = 'CEF' AND NIMCNRO IN   (652, 660);

UPDATE  hosvital.NIMOVCON1
set  NIMC1EST ='S'
where EMPCOD='02' AND doccod='TRB' and NIMCNRO  in  (3  ) and NIMC1EST='C';

UPDATE  hosvital.NIMOVCON1
set  NIMC1EST ='S'
where EMPCOD='01' AND doccod='CA ' and NIMCNRO  in  (17728           );  and NIMC1EST='C';

-- Otras Actualizaciones

UPDATE hosvital.movcont3  
SET  TRANAPL='CXC'
where  doccod='FV' AND MVCNRO IN ( 70 );


select * from hosvital.movcont2  
where  doccod='CEG' AND MVCNRO IN  (31699, 30405);

select * from hosvital.MOVCONT3   where  DOCCOD = 'CA' AND MVCNRO  IN ( 9586,9587  );
select * from hosvital.MOVCONT3   where  DOCCOD = 'NCR' AND MVCNRO  IN ( 18285,18261,18262) ;  -- and mvcest='C';
select * from hosvital.NIMOVCON2   where  DOCCOD = 'DPF' AND NIMCNRO IN   (1);

select * from hosvital.NIMOVCON1   where  DOCCOD = 'CA ' AND NIMCNRO IN  (  19966   ); 
select * from hosvital.NIMOVCON1   where  DOCCOD = 'CA ' ;

UPDATE  hosvital.NIMOVCON1   
SET TRANAPL='CXC'
where  DOCCOD = 'FV' AND NIMCNRO IN (70  );  


UPDATE  hosvital.NIMOVCON1
set  NIMC1EST ='S'
where EMPCOD='01' AND doccod='CA ' and NIMCNRO  in  ( 19966    ) and NIMC1EST='C';


update  hosvital.NIMOVCON1
set  NIMC1EST ='S'
where doccod='NCF' and NIMCNRO  in   (  59  )  and NIMC1EST='C';

update  hosvital.NIMOVCON1
set  NIMC1EST ='S'
where   EMPCOD='03' AND doccod='CEF' and NIMCNRO IN (666) and NIMC1EST='C';


select * from hosvital.NIMOVCON1   where  DOCCOD = 'DRC' AND NIMCNRO IN  (23195);  
select * from hosvital.NIMOVCON2   where  DOCCOD = 'RC' AND NIMCNRO IN  (1409);  

select *  From hosvital.docucon where doccod='CNS';