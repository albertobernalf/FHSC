select * from hosvital.FrmSmns where hisckey='17025430'  and  year(FSMFHRREG)= 2019  and month(FSMFHRREG)=4  and hiscsec in (294,334,335);  -- and fsmmsreso = '0035A11A' and hiscsec=371;  -- folio 371
SELECT * FROM hosvital.maesum1 where msnomg like ('%HEPARINA%BAJO%'); -- 0035A11A       	

-- DELETE from hosvital.FrmSmns where hisckey='17025430' and  FSMFHRREG='2019-04-05 07:39:17.00000 ' AND  fsmmsreso = '0035A11A' and HISCSEC='371';

SELECT * FROM HOSVITAL.CAPBAS WHERE MPNOMC LIKE ('%MELQUI%CHIQUI%')
