select * from hosvital.frmsmns where hisckey ='20379709'   and  hictvin = 3 and fsmmsreso = '0019A11A' order by hiscsec; -- folio113
select * from hosvital.maesum1 where msnomg like ('%NU%AISLA%');
select * from hosvital.frmsmns1 where hisckey ='20379709'   and  hictvin1 = 3 and hiscsec in (99,113	,114	,120); -- and fsmmsreso = '0019A11A' order by hiscsec;

select * from hosvital.citmed1 where citced = '20379709';

select * from hosvital.hccom1 where hisckey = '20379709' and hiscsec = 113;  -- hisfolppr ,, hisinddfol

-- Otro casito

select * from hosvital.hccom1 where hisckey = '20379709' ;