SELECT *
from hosvital.movban
where doccod='RNA' and mvbnrocmp IN (6328 ,6639,6638 );

update hosvital.movban
set mvbact='R'
where doccod='RNA' and mvbnrocmp IN (6328  ) and mvbact='S';  -- estaba en R


SELECT *
from hosvital.movban1
where doccod='RNA' and mvbnrocmp IN (6328 ,6639 );

select * from hosvital.movant  where MVANTDOC='RNA' AND MVANTNRO  IN (6328 ,6639 );

SELECT * FROM HOSVITAL.DOCUCON WHERE DOCCOD='RNA';
