select * from hOsvital.movban where doccod='RNA' AND MVBNROCMP =6918;
select * from hOsvital.movban where doccod='RNA' AND MVBNROCMP =6955;

select * from hOsvital.movban where doccod='RNA'  AND  MVBVLR=150000000;  -- AND MVBNROCMP =6918;

-- 6955

UPDATE HOSVITAL.movban
SET MVESTREC='L',MVESTUSU=''
where docCod='RNA' AND mvbnrocmp IN ( 6955	       );

UPDATE HOSVITAL.movban
SET MVESTREC='L',MVESTUSU=''
where docCod='RNA' AND mvbnrocmp IN ( 6918	       );

