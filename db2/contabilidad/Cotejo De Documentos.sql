select day(mvcfch),doccod,count(*)
from hosvital.movcont3
where mvcfch >= '2020-07-01 00:00:00' and  mvcfch <= '2020-07-31 23:59:59'  -- and doccod='NAF'
group by day(mvcfch),doccod
order by day(mvcfch);


select * from hosvital.docucon where doccOD='ISI';