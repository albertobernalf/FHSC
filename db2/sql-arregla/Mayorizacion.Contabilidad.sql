select * from resmcue -- libro aux
-- aud bal comar de resmcue por maux

-- AUXILIARES LLENA LA RSMAUX
-- CUANDO MAYORIZO	GENERALE RESMCUE


select * from rsmaux where rsmano=2016 and rsmmes=10 and  rsmctncon >= '11' and rsmctncon <= '11300505'

select RsmMes, rsmctncon, sum(rsaxdeb) deb,sum(rsaxcre) cre,sum(rsaxsant) sant,sum(rsaxsact) sact
from rsmaux where rsmano=2016 and rsmmes in (10) and  rsmctncon >= '11050501' and rsmctncon <= '11050501'
group by rsmctncon,RsmMes
order by rsmctncon

--- oct 11050501            	316742344.40	322479209.30	17229502.20	11492637.30
-- sep  11050501            	383555884.20	379210477.80	12884095.80	17229502.20

select rsmctncon,  sum(rsmdeb),sum(rsmcre), sum(rsmsalant), sum(rsmsalact)
from resmcue  
where rsmano=2016 and rsmmes=10 and  rsmctncon >= '11050501' and rsmctncon <= '11050501'
group by rsmctncon
order by rsmctncon


select COUNT(*) from movcont3 
where mvcfch>= '2016-10-01' and    mvcfch>= '2016-10-31' and mvcmaygen <> 'S' -- 91908

select mvcmaygen,mvcmaygen,* from movcont3 
where mvcfch>= '2016-10-01' and    mvcfch>= '2016-10-31' and mvcmaygen <> 'S' -- 91908

SP_HELP MOVCONT3




SELECT * FROM MOVCONT2
WHERE  MVCANIO=2016 AND MVCMES=10 AND CNTCOD>= '11' AND CNTCOD<='11300505' AND
 CONCAT(DOCCOD,'',MVCNRO) IN (SELECT CONCAT(DOCCOD,'',MVCNRO)
                         	from movcont3 
							where mvcfch>= '2016-11-01' and    mvcfch<= '2016-11-30' and MvCMayAux <> 'S') -- Estos son los mayorizados


SELECT a.MvCMayAux , a.MvCMayGen,*
FROM MOVCONT3 A , MOVCONT2 B
WHERE A.mvcfch>= '2016-10-01' and   A.mvcfch<= '2016-10-31' AND
     A.DOCCOD=B.DOCCOD AND A.MVCNRO=B.MVCNRO AND
	 B.CNTCOD>= '11' AND B.CNTCOD<='11300505' AND A.MvCMayAux = 'S' --  11727


	 SELECT a.MvCMayAux,A.MvCMayGen,*
FROM MOVCONT3 A , MOVCONT2 B
WHERE A.mvcfch >= '2016-10-01' and   A.mvcfch<= '2016-10-31' AND
     A.DOCCOD=B.DOCCOD AND A.MVCNRO=B.MVCNRO AND
	 B.CNTCOD>= '11' AND B.CNTCOD<='11300505' AND A.MvCMayGen =  'S'  -- 11727


-- VEAMOS NOVIEMBRE


select RsmMes,rsmctncon,  sum(rsmdeb),sum(rsmcre), sum(rsmsalant), sum(rsmsalact)
from resmcue  
where rsmano=2016 and rsmmes=11 and  rsmctncon >= '11050501' --and rsmctncon <= '11050501'
group by RsmMes,rsmctncon
order by rsmctncon


select RsmMes, rsmctncon, sum(rsaxdeb) deb,sum(rsaxcre) cre,sum(rsaxsant) sant,sum(rsaxsact) sact
from rsmaux where rsmano=2016 and rsmmes in (11) --and  rsmctncon >= '11050501' and rsmctncon <= '11050501'
group by RsmMes,rsmctncon
order by rsmctncon



	
 -- grandes totales

 select RsmMes,  sum(rsmdeb),sum(rsmcre), sum(rsmsalant), sum(rsmsalact)
from resmcue  
where rsmano=2016 and rsmmes=10 --and  rsmctncon >= '11050501' --and rsmctncon <= '11050501'
group by rsmmes


select RsmMes, sum(rsaxdeb) deb,sum(rsaxcre) cre,sum(rsaxsant) sant,sum(rsaxsact) sact
from rsmaux 
where rsmano=2016 and rsmmes in (10) --and  rsmctncon >= '11050501' and rsmctncon <= '11050501'
group by RsmMes

-- cola de procesos


SELECT pqclass,* FROM PQUEUE-- WHERE PQWRKST LIKE ('%ALBERT%')
WHERE PQSTATUS='E'
 ORDER BY PQSTARTDT 
