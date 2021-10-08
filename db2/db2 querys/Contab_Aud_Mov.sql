SELECT  * from hosvital.movcont2
where doccod='NCF' AND MVCNRO = 6604;

UPDATE  hosvital.movcont2
SET CNTCOD='13012501'
where doccod='NCF' AND MVCNRO = 6604 AND MVCCSC=2;


SELECT * FROM  hosvital.NImovcon2
where doccod='NCF' AND NIMCNRO = 6604;

UPDATE  hosvital.NImovcon2
SET NICNTCOD='13012501'
where doccod='NCF' AND NIMCNRO = 6604 AND NIMC2CSC=3;
