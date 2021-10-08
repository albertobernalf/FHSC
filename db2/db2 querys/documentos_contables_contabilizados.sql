select hosvital.movcont3.empcod, DAY(mvcfch),hosvital.docucon.doccod,hosvital.docucon.docdsc,count(*)
from hosvital.movcont3 , hosvital.docucon 
where mvcfch >= '2019-05-01 00:00:00' and  mvcfch <= '2019-05-31 23:59:59' and   hosvital.movcont3.doccod = hosvital.docucon.doccod 
-- and hosvital.movcont3.doccod='FAD'
group by hosvital.movcont3.empcod, DAY(mvcfch),hosvital.docucon.doccod,hosvital.docucon.docdsc
order by hosvital.movcont3.empcod,DAY(mvcfch);

select * from hosvital.movcont3 WHERE MVCFCH>='2019-05-01 00:00:00' AND DOCCOD='FAD';