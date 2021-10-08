 -- NO HAY NADA QUE HACER A ALA MOVCXC

 --Y E LA HOJOBL QUE PASA

SELECT * FROM HOJOBL WHERE HOJNUMOBL='1964241'
SELECT * FROM MOVCXC WHERE MCCNUMOBL = '1964241'

NAF        
NFR      10494, 10562, 10564, 10604, 10605, 10606, 10607,


select * from movcont3 where doccod = 'NFR' AND MVCNRO  IN
( 10494, 10562, 10564, 10604, 10605, 10606, 10607 )

select * from movcont3 where doccod = 'NGN' AND MVCNRO  IN
(884, 885, 888, 889)

select * from movcont3 where doccod = 'NAF' AND MVCNRO  IN
( 193334)

select * from movcont3 where doccod = 'NCG' AND MVCNRO  IN
( 25000, 25018, 25032,25038, 25046,25056)

select * from movcont3 where doccod = 'AG' AND MVCNRO  IN
( 1953)

select * from movcont3 where doccod = 'CDC' AND MVCNRO  IN
( 2106, 2107, 2108, 2109, 2110)


SELECT * FROM MOVCONT3 WHERE DOCCOD='NCC' AND MVCNRO>=25 order by mvcnro
SELECT * FROM MOVCONT2 WHERE DOCCOD='NCC' AND MVCNRO=25

25513

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  25     ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen , mvccnvmon ,  mvcorigen ,NULL,   mvcestpre ,NULL,NULL,NULL
    FROM MOVCONT3
WHERE DOCCOD='NCC' AND MVCNRO=26
-- COMMIT
-- ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  25     ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  25     ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 ,NULL,NULL
FROM MOVCONT2
WHERE DOCCOD='NCC' AND MVCNRO=26  AND MVCNAT='D' AND MVCCSC=72
-- COMMIT
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  25     ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  25     ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 ,NULL,NULL
FROM MOVCONT2
WHERE DOCCOD='NCC' AND MVCNRO=26 AND MVCNAT='C' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK



-- SEGUNDO CASO ..


begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  10562,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,    '2016-02-10' ,
  mvcmonbse ,  mvctascmb ,  'N' ,  '' ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  '2016-02-10' ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,    mvccnvmon ,  mvcorigen ,mvcnumequ,mvcestpre 
  FROM MOVCONT3
WHERE DOCCOD='NFR' AND MVCNRO=10563
-- COMMIT
-- ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,10562,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  10562,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-10' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NFR' AND MVCNRO=10563  AND MVCNAT='D' AND MVCCSC=2
-- COMMIT
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  10562,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  10562,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-10' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NFR' AND MVCNRO=10563 AND MVCNAT='C' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

-- TERCER CASO ..



begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  10564,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,    '2016-02-10' ,
  mvcmonbse ,  mvctascmb ,  'N' ,  '' ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  '2016-02-10' ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,    mvccnvmon ,  mvcorigen ,mvcnumequ,mvcestpre 
  FROM MOVCONT3
WHERE DOCCOD='NFR' AND MVCNRO=10565
-- COMMIT
-- ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,10564,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  10564,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-10' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NFR' AND MVCNRO=10565  AND MVCNAT='D' AND MVCCSC=2
-- COMMIT
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  10564,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  10564,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-10' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NFR' AND MVCNRO=10565 AND MVCNAT='C' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK



-- CUARTO CASO

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  10604,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,    '2016-02-16' ,
  mvcmonbse ,  mvctascmb ,  'N' ,  '' ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  '2016-02-16' ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,    mvccnvmon ,  mvcorigen ,mvcnumequ,mvcestpre 
  FROM MOVCONT3
WHERE DOCCOD='NFR' AND MVCNRO=10608
-- COMMIT
-- ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,10604,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  10604,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-16' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NFR' AND MVCNRO=10608  AND MVCNAT='D' AND MVCCSC=2
-- COMMIT
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  10604,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  10604,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-16' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NFR' AND MVCNRO=10608 AND MVCNAT='C' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

-- quinto caso


begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  10605,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,    '2016-02-16' ,
  mvcmonbse ,  mvctascmb ,  'N' ,  '' ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  '2016-02-16' ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,    mvccnvmon ,  mvcorigen ,mvcnumequ,mvcestpre 
  FROM MOVCONT3
WHERE DOCCOD='NFR' AND MVCNRO=10608
-- COMMIT
-- ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,10605,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  10605,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-16' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NFR' AND MVCNRO=10608  AND MVCNAT='D' AND MVCCSC=2
-- COMMIT
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  10605,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  10605,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-16' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NFR' AND MVCNRO=10608 AND MVCNAT='C' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

-- sexta


begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  10606,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,    '2016-02-16' ,
  mvcmonbse ,  mvctascmb ,  'N' ,  '' ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  '2016-02-16' ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,    mvccnvmon ,  mvcorigen ,mvcnumequ,mvcestpre 
  FROM MOVCONT3
WHERE DOCCOD='NFR' AND MVCNRO=10608
-- COMMIT
-- ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,10606,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  10606,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-16' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NFR' AND MVCNRO=10608  AND MVCNAT='D' AND MVCCSC=2
-- COMMIT
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  10606,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  10606,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-16' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NFR' AND MVCNRO=10608 AND MVCNAT='C' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

-- septima

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  10607,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,    '2016-02-16' ,
  mvcmonbse ,  mvctascmb ,  'N' ,  '' ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  '2016-02-16' ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,    mvccnvmon ,  mvcorigen ,mvcnumequ,mvcestpre 
  FROM MOVCONT3
WHERE DOCCOD='NFR' AND MVCNRO=10608
-- COMMIT
-- ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,10607,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  10607,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-16' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NFR' AND MVCNRO=10608  AND MVCNAT='D' AND MVCCSC=2
-- COMMIT
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  10607,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  10607,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-16' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NFR' AND MVCNRO=10608 AND MVCNAT='C' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK


-- documentos NGN

NGN       884, 885, 888, 889

SELECT * FROM MOVCONT3 WHERE DOCCOD='NGN' AND MVCNRO>=884 order by mvcnro

-- PRIMER CASO :


begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  884,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,    '2016-02-02' ,
  mvcmonbse ,  mvctascmb ,  'N' ,  '' ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  '2016-02-02' ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,    mvccnvmon ,  mvcorigen ,mvcnumequ,mvcestpre 
  FROM MOVCONT3
WHERE DOCCOD='NGN' AND MVCNRO=886
-- COMMIT
-- ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,884,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  884,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-02' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NGN' AND MVCNRO=886  AND MVCNAT='D' AND MVCCSC=2
-- COMMIT
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,884,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  884,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2015-02-02' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NGN' AND MVCNRO=886 AND MVCNAT='C' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

-- SEGUNDO CASO :

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  885,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,    '2016-02-02' ,
  mvcmonbse ,  mvctascmb ,  'N' ,  '' ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  '2016-02-02' ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,    mvccnvmon ,  mvcorigen ,mvcnumequ,mvcestpre 
  FROM MOVCONT3
WHERE DOCCOD='NGN' AND MVCNRO=886
-- COMMIT
-- ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,885,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  885,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-02' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NGN' AND MVCNRO=886  AND MVCNAT='D' AND MVCCSC=2
-- COMMIT
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,885,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  885,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2015-02-02' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NGN' AND MVCNRO=886 AND MVCNAT='C' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK


-- tercer caso


begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  888,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,    '2016-02-19' ,
  mvcmonbse ,  mvctascmb ,  'N' ,  '' ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  '2016-02-02' ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,    mvccnvmon ,  mvcorigen ,mvcnumequ,mvcestpre 
  FROM MOVCONT3
WHERE DOCCOD='NGN' AND MVCNRO=890
-- COMMIT
-- ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,888,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  888,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-19' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NGN' AND MVCNRO=890  AND MVCNAT='D' AND MVCCSC=2
-- COMMIT
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,888,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  888,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2015-02-19' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NGN' AND MVCNRO=890 AND MVCNAT='C' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

-- cuarto caso

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  889,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,    '2016-02-19' ,
  mvcmonbse ,  mvctascmb ,  'N' ,  '' ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  '2016-02-02' ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,    mvccnvmon ,  mvcorigen ,mvcnumequ,mvcestpre 
  FROM MOVCONT3
WHERE DOCCOD='NGN' AND MVCNRO=890
-- COMMIT
-- ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,889,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  889,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-19' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NGN' AND MVCNRO=890  AND MVCNAT='D' AND MVCCSC=2
-- COMMIT
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,889,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  889,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2015-02-19' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NGN' AND MVCNRO=890 AND MVCNAT='C' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK



-- potra parte :
SELECT * FROM MOVCONT3 WHERE DOCCOD='NCG' AND MVCNRO>= 25000 


NCG      25000, 25018, 25032,25038, 25046,25056


begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  25000 ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,    '2016-02-08' ,
  mvcmonbse ,  mvctascmb ,  'N' ,  '' ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  '2016-02-08' ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,    mvccnvmon ,  mvcorigen ,mvcnumequ,mvcestpre 
  FROM MOVCONT3
WHERE DOCCOD='NCG' AND MVCNRO=25009
-- COMMIT
-- ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,25000 ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  25000 , '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-08' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NCG' AND MVCNRO=25009 AND MVCNAT='D' AND MVCCSC=2
-- COMMIT
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,25000 ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,25000 ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2015-02-08' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NCG' AND MVCNRO=25009 AND MVCNAT='C' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

--segunda


begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  25018 ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,    '2016-02-08' ,
  mvcmonbse ,  mvctascmb ,  'N' ,  '' ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  '2016-02-08' ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,    mvccnvmon ,  mvcorigen ,mvcnumequ,mvcestpre 
  FROM MOVCONT3
WHERE DOCCOD='NCG' AND MVCNRO=25009
-- COMMIT
-- ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,25018 ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  25018 , '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-08' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NCG' AND MVCNRO=25009 AND MVCNAT='D' AND MVCCSC=2
-- COMMIT
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,25018 ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,25018 ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2015-02-08' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NCG' AND MVCNRO=25009 AND MVCNAT='C' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK


-- tercera



begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  25032 ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,    '2016-02-08' ,
  mvcmonbse ,  mvctascmb ,  'N' ,  '' ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  '2016-02-08' ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,    mvccnvmon ,  mvcorigen ,mvcnumequ,mvcestpre 
  FROM MOVCONT3
WHERE DOCCOD='NCG' AND MVCNRO=25009
-- COMMIT
-- ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,25032 ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  25032 , '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-08' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NCG' AND MVCNRO=25009 AND MVCNAT='D' AND MVCCSC=2
-- COMMIT
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,25032 ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,25032 ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2015-02-08' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NCG' AND MVCNRO=25009 AND MVCNAT='C' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

-- cuarto




begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  25038 ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,    '2016-02-08' ,
  mvcmonbse ,  mvctascmb ,  'N' ,  '' ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  '2016-02-08' ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,    mvccnvmon ,  mvcorigen ,mvcnumequ,mvcestpre 
  FROM MOVCONT3
WHERE DOCCOD='NCG' AND MVCNRO=25009
-- COMMIT
-- ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,25038 ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  25038, '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-08' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NCG' AND MVCNRO=25009 AND MVCNAT='D' AND MVCCSC=2
-- COMMIT
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,25038 ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,25038 ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2015-02-08' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NCG' AND MVCNRO=25009 AND MVCNAT='C' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK




-- quinto
-- 

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  25046 ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,    '2016-02-08' ,
  mvcmonbse ,  mvctascmb ,  'N' ,  '' ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  '2016-02-08' ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,    mvccnvmon ,  mvcorigen ,mvcnumequ,mvcestpre 
  FROM MOVCONT3
WHERE DOCCOD='NCG' AND MVCNRO=25009
-- COMMIT
-- ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,25046 ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  25046 , '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-08' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NCG' AND MVCNRO=25009 AND MVCNAT='D' AND MVCCSC=2
-- COMMIT
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,25046 ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,25046 ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2015-02-08' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NCG' AND MVCNRO=25009 AND MVCNAT='C' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK





-- sexto





begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  25056 ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,    '2016-02-08' ,
  mvcmonbse ,  mvctascmb ,  'N' ,  '' ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  '2016-02-08' ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,    mvccnvmon ,  mvcorigen ,mvcnumequ,mvcestpre 
  FROM MOVCONT3
WHERE DOCCOD='NCG' AND MVCNRO=25009
-- COMMIT
-- ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,25056 ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  25056 , '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-08' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NCG' AND MVCNRO=25009 AND MVCNAT='D' AND MVCCSC=2
-- COMMIT
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,25056 ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,25056 ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2015-02-08' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NCG' AND MVCNRO=25009 AND MVCNAT='C' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK


-- OTRA PARTE SIETE


SELECT * FROM MOVCONT3 WHERE DOCCOD='NAF' AND MVCNRO>=19334


begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  19334,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,    '2016-02-01' ,
  mvcmonbse ,  mvctascmb ,  'N' ,  '' ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  '2016-02-01' ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,    mvccnvmon ,  mvcorigen ,mvcnumequ,mvcestpre 
  FROM MOVCONT3
WHERE DOCCOD='NAF' AND MVCNRO=19335
-- COMMIT
-- ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,19334,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  19334, '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2016-02-01' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NAF' AND MVCNRO=19335 AND MVCNAT='D' AND MVCCSC=2
-- COMMIT
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,19334,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,19334,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,    '2015-01-18' ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='NAF' AND MVCNRO=19335 AND MVCNAT='C' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

SELECT * FROM MOVCONT3 WHERE DOCCOD='NAF' AND MVCNRO = 19334