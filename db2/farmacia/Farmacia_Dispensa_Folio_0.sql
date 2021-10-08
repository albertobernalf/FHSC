select * from hosvital.FrmSmns where hisckey='17025430'  and  year(FSMFHRREG)= 2019  and month(FSMFHRREG)=4  and fsmmsreso = '0035A11A' and hiscsec=371;  -- folio 371
SELECT * FROM hosvital.maesum1 where msnomg like ('%DIBEN%NUTRICI%'); -- 0035A11A       	

-- DELETE from hosvital.FrmSmns where hisckey='17025430' and  FSMFHRREG='2019-04-05 07:39:17.00000 ' AND  fsmmsreso = '0035A11A' and HISCSEC='371';

SELECT * FROM HOSVITAL.CAPBAS WHERE MPNOMC LIKE ('%MELQUI%CHIQUI%')

-- SDO CASO

20379709
SELECT * FROM hosvital.maesum1 where msnomg like ('%NUTRICI%AISLADO%'); --0019A11A 
select * from hosvital.FrmSmns where hisckey='20379709'  and  year(FSMFHRREG)= 2019  and month(FSMFHRREG)=4  and fsmmsreso = '0019A11A';  -- folio 113
-- DELETE from hosvital.FrmSmns where hisckey='20379709' and  FSMFHRREG='2019-04-05 06:30:33.00000 ' AND  fsmmsreso = '0019A11A' and HISCSEC='113';

--- 3 caso

--20379709
SELECT * FROM hosvital.maesum1 where msnomg like ('%NUTRICI%AISLADO%'); --0019A11A 
select * from hosvital.FrmSmns where hisckey='20379709'  and  year(FSMFHRREG)= 2019  and month(FSMFHRREG)=4  and fsmmsreso = '0019A11A';  -- folio 113
-- 
DELETE from hosvital.FrmSmns where hisckey='20379709' and  FSMFHRREG='2019-04-05 07:48:33.00000 ' AND  fsmmsreso = '0019A11A' and HISCSEC='114';


--4 caso
select * from hosvital.FrmSmns where hisckey='17025430'  and  year(FSMFHRREG)= 2019  and month(FSMFHRREG)=4  and fsmmsreso = '0035A11A';  -- and hiscsec=371;  -- folio 371
DELETE from hosvital.FrmSmns where hisckey='17025430' and  FSMFHRREG='2019-04-05 09:16:03.00000 ' AND  fsmmsreso = '0035A11A' and HISCSEC='374';

-- Estudio que es lo que pasa

SELECT * FROM hosvital.maesum1 where msnomg like ('%HIDROMORFONA%');  --0467N02A       	

select * from hosvital.FrmSmns where hisckey='17025430'  and  year(FSMFHRREG)= 2019  and month(FSMFHRREG)=4  and hiscsec=334 AND  fsmmsreso = '0467N02A'  ;
select * from hosvital.hccom1 where hisckey = '17025430' and hiscsec  in (0, 334);

SELECT * FROM hosvital.maesum1 where msnomg like ('%DIBEN%NUTRI%');  --0467N02A       
select * from hosvital.FrmSmns where hisckey='17025430'  and  year(FSMFHRREG)= 2019  and month(FSMFHRREG)=4  and fsmmsreso = '0035A11A'  and hiscsec = 414 ;
select * from hosvital.hccom1 where hisckey = '17025430' and hiscsec  in (334, 414);


select * from hosvital.dspfrmc  where hisckey = '17025430' and hiscsec  in (334, 414)  and msreso in ('0035A11A','0467N02A');

select * from hosvital.maepab11 where mpcedu = '17025430' order by hiscamfec;

-- PARECE UN LIO DE OCUPACION DE CAMAS SEGUIR REVISANDO

--CASOS DEL DIA 11/04/2019


SELECT * FROM hosvital.maesum1 where msnomg like ('%NUTRICI%DIABETE%'); --0035A11A       	 
select * from hosvital.FrmSmns where hisckey='17025430'  and  year(FSMFHRREG)= 2019  and month(FSMFHRREG)=4  and fsmmsreso = '0035A11A';  -- folio 610
-- 
DELETE from hosvital.FrmSmns where hisckey='17025430' and  FSMFHRREG='2019-04-06 07:24:10.00000 ' AND  fsmmsreso = '17025430'  ;  -- and HISCSEC='414';



SELECT * FROM hosvital.maesum1 where msnomg like ('%NUTRICI%AISLADO%'); --0035A11A       	 
select * from hosvital.FrmSmns where hisckey='20379709'  and  year(FSMFHRREG)= 2019  and month(FSMFHRREG)=4  and fsmmsreso = '0019A11A' ORDER BY  FSMFHRREG;  -- folio 610
-- 
DELETE from hosvital.FrmSmns where hisckey='20379709' and  FSMFHRREG='2019-04-06 06:36:18.00000 ' AND  fsmmsreso = '0019A11A'  ;  -- and HISCSEC='414';
DELETE from hosvital.FrmSmns where hisckey='20379709' and  FSMFHRREG='2019-04-06 08:00:55.00000 ' AND  fsmmsreso = '0019A11A'  ; 
DELETE from hosvital.FrmSmns where hisckey='20379709' and  FSMFHRREG='2019-04-07 06:22:08.00000 ' AND  fsmmsreso = '0019A11A'  ; 
DELETE from hosvital.FrmSmns where hisckey='20379709' and  FSMFHRREG='2019-04-07 07:49:11.00000 ' AND  fsmmsreso = '0019A11A'  ; 
DELETE from hosvital.FrmSmns where hisckey='20379709' and  FSMFHRREG='2019-04-10 06:31:38.00000 ' AND  fsmmsreso = '0019A11A'  ; 
DELETE from hosvital.FrmSmns where hisckey='20379709' and  FSMFHRREG='2019-04-10 07:38:26.00000 ' AND  fsmmsreso = '0019A11A'  ; 
DELETE from hosvital.FrmSmns where hisckey='20379709' and  FSMFHRREG='2019-04-11 06:34:32.00000 ' AND  fsmmsreso = '0019A11A'  ; 
DELETE from hosvital.FrmSmns where hisckey='20379709' and  FSMFHRREG='2019-04-11 07:29:55.00000 ' AND  fsmmsreso = '0019A11A'  ; 


SELECT * FROM hosvital.maesum1 where msnomg like ('%NUTRICI%AISLADO%'); --0019A11A   	 
select * from hosvital.FrmSmns where hisckey='41415280'  and  year(FSMFHRREG)= 2019  and month(FSMFHRREG)=4  and fsmmsreso = '0019A11A' ORDER BY  FSMFHRREG;  -- folio 610
-- 
DELETE from hosvital.FrmSmns where hisckey='41415280' and  FSMFHRREG='2019-04-09 12:36:11.00000 ' AND  fsmmsreso = '0019A11A'  ;  -- and HISCSEC='414';


SELECT * FROM hosvital.maesum1 where msnomg like ('%NUTRICI%AISLADO%'); --0019A11A   	 
select * from hosvital.FrmSmns where hisckey='19187816'  and  year(FSMFHRREG)= 2019  and month(FSMFHRREG)=4  and fsmmsreso = '0019A11A' ORDER BY  FSMFHRREG;  -- folio 610
-- 
DELETE from hosvital.FrmSmns where hisckey='19187816' and  FSMFHRREG='2019-04-08 10:58:15.00000 ' AND  fsmmsreso = '0019A11A'  ;  -- and HISCSEC='414';


SELECT * FROM hosvital.maesum1 where msnomg like ('%NUTRICI%AISLADO%'); --0019A11A   	 
select * from hosvital.FrmSmns where hisckey='20379709'  and  year(FSMFHRREG)= 2019  and month(FSMFHRREG)=4  and fsmmsreso = '0020A11A' ORDER BY  FSMFHRREG;  

DELETE from hosvital.FrmSmns where hisckey='20379709' and  FSMFHRREG='2019-04-11 12:51:17.00000 ' AND  fsmmsreso = '0019A11A'  ;  -- and HISCSEC='414';
--------------

select * from hosvital.capbas where mpnomc like ('%LUIS%JORGE%PEDRAZA%');

SELECT * FROM hosvital.maesum1 where msnomg like ('%NUTRICI%COMP%ALTO%');   --       	
--       	

SELECT * FROM HOSVITAL.CAPBAS WHERE MPCEDU ='41527123   ';


SELECT * FROM hosvital.maesum1 where msnomg like ('%DIETA%ESPECI%PC%'); 
       	
select * from hosvital.FrmSmns where hisckey='41527123 '  and  year(FSMFHRREG)= 2019  and month(FSMFHRREG)=4  and fsmmsreso = '0016A11A' ORDER BY  FSMFHRREG; 

DELETE from hosvital.FrmSmns where hisckey='41527123' and  FSMFHRREG='2019-05-03 11:35:13' AND  fsmmsreso = '0016A11A';

------------------

--caso
SELECT * FROM HOSVITAL.CAPBAS WHERE MPnomc like('%ALICIA%TELLEZ%AVI%');

select * from hosvital.capbas where mpcedu='103059318';

select * from hosvital.capbas where mpnOmc like ('%JULIETA%GUZMAN%');       	

SELECT * FROM hosvital.maesum1 where msnomg like ('%POTASIO%CLORURO%');
SELECT * FROM hosvital.maesum1 where msnomg like ('%SODIO%CLORURO%');

SELECT * FROM hosvital.maesum1 where msnomg like ('%NUTRICION%COMP%ALTO%');

-- 0015A11A       	
-- 0016A11A     
  	
 select * from hosvital.FrmSmns where hisckey='229018'  and year(FSMFHRREG)= 2019  and month(FSMFHRREG)>=4  and fsmmsreso = '0010A11A'   ORDER BY  FSMFHRREG; 
 --130359318


SELECT * FROM hosvital.maesum1 where msnomg like ('%DIETA%ESPECI%PC%'); 
       	
select * from hosvital.FrmSmns where hisckey='103059318 '  and  year(FSMFHRREG)= 2020  and month(FSMFHRREG)=3; --   and fsmmsreso = '0016A11A' ORDER BY  FSMFHRREG; 

DELETE from hosvital.FrmSmns where hisckey='41527123' and  FSMFHRREG='2019-05-03 11:35:13' AND  fsmmsreso = '0016A11A';

130359318

DELETE from hosvital.FrmSmns where hisckey='79516999' and  FSMFHRREG='2019-06-21 07:43:24' AND  fsmmsreso = '0008A11A';	

 