select * from hosvital.actfij where acfcod in ('FEB000241','FEB000244');

select * from hosvital.actfij where acfcod in  ('FME000450','FME000451','FME000452','FME000453','FME000449');

UPDATE hosvital.actfij 
SET  ACFFCHCO='2019-09-04'
where acfcod in ('FME000450','FME000451','FME000452','FME000453','FME000449');


UPDATE hosvital.actfij 
SET  nacfchact='2019-09-04', acfchact='2019-09-04'
where acfcod in ('FME000452');



update hosvital.actfij 
set acfvlrco=471716
where acfcod='FEB000241' and acfpla='FEB000241';

update hosvital.actfij 
set acfvlrco=140420
where acfcod='FEB000244' and acfpla='FEB000244';

select * from hosvital.actfij where acfcod='FEB000244';