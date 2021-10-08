select DAY(mvcfch),hosvital.docucon.doccod,hosvital.docucon.docdsc,count(*)
from hosvital.movcont3 , hosvital.docucon 
where mvcfch >= '2017-03-13 00:00:00' and  mvcfch <= '2017-03-14 23:59:59' and   hosvital.movcont3.doccod = hosvital.docucon.doccod
group by DAY(mvcfch),hosvital.docucon.doccod,hosvital.docucon.docdsc
order by DAY(mvcfch)