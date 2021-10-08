select * from hosvital.movban where doccod= 'RC'   AND  mvbnrocmp IN (1269);

UPDATE  hosvital.movban
SET  MVBVLR = 0
 where doccod= 'RC'   AND  mvbnrocmp IN (1269) AND MVBVLR = 1000000;