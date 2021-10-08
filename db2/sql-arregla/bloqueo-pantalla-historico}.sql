select * from ctrlcitas limit 10
where

--se bloquea en historico
select * from citmed where citnum in (select citnum from citmed1 where citced ='19179447')
select * from citmed1 where citced ='19179447' order by citfecpa -- 318
select * from citmed2 where citnum in (select citnum from citmed1 where citced ='19179447')
select * from ctrlcitas where citnum in (select citnum from citmed1 where citced ='19179447')



select *
from citmed1 a, ctrlcitas b
where a.citced ='19179447' and a.citnum=b.citnum
order by a.citnum  -- aqui hay  1230


select *
from citmed1 a, ctrlcitas b
where a.citced ='1072638965' and a.citnum=b.citnum
order by a.citnum  -- 317


select * from citmed1 where citced ='3446139' order by citfecpa -- 718

select *
from citmed1 a, ctrlcitas b
where a.citced ='3446139' and a.citnum=b.citnum
order by a.citnum  -- 1828 , NO SE BLOQEUO



SELECT T1.CitFchHra, T1.CitStsCit, T2.CitEsta, T1.CitNum, T1.CitTipDoc, T1.CitCed, T1.CitSed, T1.CitEmp, T1.CitNomRCa, T1.CitNroCan 
FROM (CTRLCITAS T1 INNER JOIN CITMED1 T2 ON T2.CitEmp = T1.CitEmp AND T2.CitSed = T1.CitSed AND T2.CitNum = T1.CitNum
 AND T2.CitCed = T1.CitCed AND T2.CitTipDoc = T1.CitTipDoc) WHERE (T1.CitEmp = $1 and T1.CitSed = $2 and T1.CitNum = $3 and T1.CitCed = $4
  and T1.CitTipDoc = $5) AND (T2.CitEsta = $6) AND (T1.CitStsCit = 'N') 
  ORDER BY T1.CitEmp, T1.CitSed, T1.CitNum, T1.CitCed, T1.CitTipDoc
Clinica - 2016-07-26 10:20:11 COT - 2561 - leominor.unisabana.edu.co DETAIL:  parameters: $1 = '1 ', $2 = '001      ', $3 = '151650', $4 = '19179447       ', $5 = 'CC ', $6 = 'N'
Clinica - 2016-07-26 10:20:11 COT - 2561 - leominor.unisabana.edu.co LOG:  execute <unnamed>: 
SELECT T1.CitEmp, T1.CitSed, T1.CitNum, T2.MMNomM, T1.METipMe, T1.MECodE, T1.MMCODM 
FROM (CITMED2 T1 INNER JOIN MAEMED1 T2 ON T2.MMCODM = T1.MMCODM) WHERE (T1.CitEmp = '1' and T1.CitSed = '001' and T1.CitNum =    151650 and 
T1.METipMe = 'P') ORDER BY T1.CitEmp, T1.CitSed, T1.CitNum, T1.METipMe

Clinica - 2016-07-26 10:20:11 COT - 2561 - leominor.unisabana.edu.co LOG:  execute S_24: 

SELECT T1.CitFchHra, T1.CitStsCit, T2.CitEsta, T1.CitNum, T1.CitTipDoc, T1.CitCed, T1.CitSed, T1.CitEmp, T1.CitNomRCa, T1.CitNroCan 
FROM (CTRLCITAS T1 INNER JOIN CITMED1 T2 ON T2.CitEmp = T1.CitEmp AND T2.CitSed = T1.CitSed AND T2.CitNum = T1.CitNum AND 
T2.CitCed = T1.CitCed AND T2.CitTipDoc = T1.CitTipDoc) WHERE (T1.CitEmp = '1 ' and T1.CitSed = '001      ' and T1.CitNum = '151662' and
 T1.CitCed = '19179447       ' and T1.CitTipDoc = 'CC ') AND (T2.CitEsta =  'N') AND (T1.CitStsCit = 'N') ORDER BY T1.CitEmp, T1.CitSed, T1.CitNum,
  T1.CitCed, T1.CitTipDoc

  
 SELECT MPTDoc, MPCedu, MENNIT
  FROM MAEPAC WHERE MPCedu = '19179447       ' and MPTDoc = 'CC' 
  ORDER BY MPCedu, MPTDoc, MENNIT
Clinica - 2016-07-26 10:20:10 COT - 2561 - leominor.unisabana.edu.co DETAIL:  parameters: $1 = , $2 = 
Clinica - 2016-07-26 10:20:11 COT - 2187 - leominor.unisabana.edu.co LOG:  execute S_28: 


SELECT T2.CitCons AS CitCons, T1.CitNum, T1.CitSed, T1.CitEmp, T1.CitEsta, T1.CitTipDoc, T1.CitCed, T2.CitFec, T2.CitHorI,
 T3.ConsDet AS CitDscCns, T3.MCDpto, T2.CitPro AS CitPro, T1.CitNroCto, T1.CitNroAut, T1.CitNomAut, T2.CitTiempo, T2.CitTip,
  T2.CitClas, T4.PrNomb AS CitNomPrc, T1.CitAutCsc, T2.CitTipOri, T1.CITMULVLR, T1.CITABOSED, T1.CITABOEMP, T1.CITABODOC, T1.CITABONUM 
  FROM (((CITMED1 T1 INNER JOIN CITMED T2 ON T2.CitEmp = T1.CitEmp AND T2.CitSed = T1.CitSed AND T2.CitNum = T1.CitNum) 
  LEFT JOIN CONSUL T3 ON T3.ConsCod = T2.CitCons) LEFT JOIN MAEPRO T4 ON T4.PRCODI = T2.CitPro) WHERE (T1.CitCed = '19179447' 
  and T1.CitTipDoc = 'CC') and (T1.CitNum >=         0) 
  ORDER BY T1.CitCed, T1.CitTipDoc
