SELECT * FROM HOSVITAL.NIRSMGEN WHERE     NIRCEMP='02' AND NIRCANIO=2020 AND NIRCMES=1 AND NIRCCUE='23550501';

SELECT * FROM HOSVITAL.NIRSMAUX WHERE     NIRCEMP='02' AND NIRCANIO=2020 AND NIRCMES=1    AND NIRCCUE='23550501';

SELECT * FROM HOSVITAL.NICUENTAS    WHERE EMPCOD='02' AND NICNTCOD='23550501';


UPDATE  HOSVITAL.NICUENTAS    
SET NICNTTRC=NULL, NICNTCLC1=NULL
WHERE EMPCOD='02' AND NICNTCOD='23550501' AND  NICNTVIG IN (2020,2021);



SELECT * FROM HOSVITAL.NICUENTASH  WHERE EMPCOD='02' AND NICNTCOD='23550501';

SELECT * FROM HOSVITAL.NICUENTAS    WHERE EMPCOD='02' AND NICNTCOD='2355';

SELECT * FROM HOSVITAL.NICUENTASH  WHERE EMPCOD='02' AND NICNTCOD='2355';

SELECT * FROM HOSVITAL.NICUENTAS    WHERE EMPCOD='02' AND NICNTCOD='235505';

UPDATE  HOSVITAL.NICUENTAS    
SET NICNTTRC=NULL, NICNTCLC1=NULL
WHERE EMPCOD='02' AND NICNTCOD='235505' AND  NICNTVIG IN (2020,2021);

SELECT * FROM HOSVITAL.NICUENTASH  WHERE EMPCOD='02' AND NICNTCOD='235505';

SELECT * FROM HOSVITAL.NICUENTAS    WHERE EMPCOD='02' AND NICNTCOD='23';
SELECT * FROM HOSVITAL.NICUENTASH    WHERE EMPCOD='02' AND NICNTCOD='2335';
SELECT * FROM HOSVITAL.NICUENTAS    WHERE EMPCOD='02' AND NICNTCOD='2335';
SELECT * FROM HOSVITAL.NICUENTAS    WHERE EMPCOD='02' AND NICNTCOD IN ('233525','233530') AND NICNTVIG=2020;

SELECT * FROM HOSVITAL.NICUENTASH    WHERE EMPCOD='02' AND NICNTCOD IN ('233525','233530') AND NICNTVIG=2020;

SELECT * FROM HOSVITAL.NIRSMAUX WHERE NIRCEMP='02' AND NIRCANIO=2020 AND NIRCMES=1 AND NIRCCUE  IN ('23352501','23353001') ;
SELECT * FROM HOSVITAL.NIRSMGEN WHERE NIRCEMP='02' AND NIRCANIO=2020 AND NIRCMES=1 AND NIRCCUE  IN ('23352501','23353001') ;