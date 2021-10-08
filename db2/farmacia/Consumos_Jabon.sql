select DOCTIP,DOCNRO, K.MOVFCH, K.MSRESO, M1.MSNOMG , K.MOVCNT from hosvital.kardex1 K
INNER JOIN HOSVITAL.MAESUM1 M1 ON (M1.MSRESO=K.MSRESO)
 where movfch >= '2019-01-01 00:00:00' and
 K.msreso in (select msreso from hosvital.maesum1 where msnomg LIKE ('%JABON%'));


select DOCTIP,DOCNRO, K.MOVFCH, K.MSRESO, M1.MSNOMG , K.MOVCNT from hosvital.kardex1 K
INNER JOIN HOSVITAL.MAESUM1 M1 ON (M1.MSRESO=K.MSRESO)
 where movfch >= '2019-01-01 00:00:00' and
 K.msreso in (select msreso from hosvital.maesum1 where msnomg LIKE ('%GLICERINADO%'));