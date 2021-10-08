select * from hosvital.movcont3 where doccod='LAN' AND MVCNRO =1613; 
select * from hosvital.movcont2 where doccod='LAN' AND MVCNRO =1613;  -- 16981501            	  -- / 12450505

SELECT * FROM HOSVITAL.MOVCXC   WHERE DOCCOD= 'ACP AND ';

select * from hosvital.NImovcon2 where doccod='LAN' AND NIMCNRO =1613;  --  16981501  // 11250503
  -- X NIF

select * from hosvital.NImovcon1;

select * from hosvital.NImovcon2 where doccod='LAN' AND NIMCNRO =1613;  
select * from hosvital.NImovcon1 where doccod='LAN' AND NIMCNRO =1613;  
select * from hosvital.NImovcon2 where doccod='LAN' AND NIMCNRO =1613;  



UPDATE  hosvital.movcont2
SET CNTCOD = 12450505
WHERE  doccod='ACP' AND MVCNRO =1880 AND CNTCOD= 16981501 AND  MVCVLR=31049;


UPDATE  hosvital.NImovcon2
SET NICNTCOD = 11250503
WHERE  doccod='ACP' AND NIMCNRO =1880 AND NICNTCOD= 16981501 AND  nimc2VL=31049;

select * from hosvital.movcxp where doccod = 'ACP'  and prvcod = '800141235' ;  --  and mvcxpnuob = '1880';

-- Cargue de Local a Nif

INSERT INTO HOSVITAL.NImovcon1
select empcod,doccod,mvcnro,mcdpto,mvccpt,'',tranapl,mvcfch,'PES',1.00,mvcest,mvcusucre,'',mvcfchanu,mvcultcsc,'N','0001-01-01 00:00:00','','0001-01-01 00:00:00','','',0,'','0001-01-01','0001-01-01','','','N','N','N','S',0,'N','','',''
from hosvital.movcont3
 where doccod='LAN' AND MVCNRO =1613;


INSERT INTO HOSVITAL.NImovcon2
SELECT empcod,doccod,mvcnro,mcdpto,mvccsc,cntvig,cntcod,'','','','',trccod,mvcdocrf1,'',mvcdocrf2,mvcnat,mvcvlrlc,0.00,mvcdet,0.00,mvcvlrlc,'',mvccfch,mvcanio,mvcmes,'001','N','','',''
from hosvital.movcont2 where doccod='LAN' AND MVCNRO =1613;

select empcod,doccod,mvcnro,mcdpto,mvccpt,'',tranapl,mvcfch,'PES',1.00,mvcest,mvcusucre,'',mvcfchanu,mvcultcsc,'N','0001-01-01 00:00:00','','0001-01-01 00:00:00','','',0,'','0001-01-01','0001-01-01','','','N','N','N','S',0,'N','','',''
from hosvital.movcont3
 where doccod='LAN' AND MVCNRO =1613;


