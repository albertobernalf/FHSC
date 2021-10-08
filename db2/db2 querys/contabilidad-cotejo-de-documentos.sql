select * from repexc1 where repdsc like ('%NO POS%')

select datepart(DD,mvcfch),doccod,count(*)
from movcont3
where mvcfch >= '2016-12-01' and  mvcfch <= '2017-01-31 23:59:59'
group by datepart(DD,mvcfch),doccod
order by datepart(DD,mvcfch);


select datepart(DD,mvcfch),doccod,count(*)
from movcont3
where mvcfch >= '2016-11-01' and  mvcfch <= '2016-11-30'  -- and doccod='NAF'
group by datepart(DD,mvcfch),doccod
order by datepart(DD,mvcfch);

DBCC useroptions



-- Vs
select * from movinv4 limit 100

select datepart('day',fchmvt),doccod,count(*)
from movinv4
where fchmvt >= '2016-05-01' and  fchmvt <= '2016-05-31'  -- and doccod LIKE ('%SAL%')
group by datepart(DD,fchmvt),doccod
order by datepart(DD,fchmvt)


select * from movcont3
where mvcfch>= '2016-12-01' order by doccod,mvcfch


SELECT * FROM MOVCONT3 
WHERE MvCFch >= '2016-11-01 00:00:00' AND MvCFch <= '2016-11-30 23:59:59'

SELECT * FROM MOVCONT2
WHERE MVCANIO=2016 AND MvCMes=11