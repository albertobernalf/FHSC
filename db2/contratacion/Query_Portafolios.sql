select * from hosvital.portar1 where ptcodi='152'  and prcodi = '219303' order by prcodi;
select * from hosvital.homproc WHERE PRCODI='010101';
select * from hosvital.factor;

select * from hosvital.portar;

select p.ptcodi,p.ptdesc, P1.FORLIQCOD AS FORMA_LIQ,m.prcodi,m.prnomb,
(select cast( h11.homprocnt*f.fctovlr*p11.ptporc/100 as float)
 from hosvital.portar1 p11 , hosvital.homproc h11, hosvital.factor f
 where p11.ptcodi=p1.ptcodi and p11.prcodi=p1.prcodi and p11.trfcod=h11.trfcod and p11.prcodi = h11.prcodi and p11.fctocod = f.fctocod

) as porfactor,
(select  cast(h11.homprovlr*p11.ptporc/100 as float)
 from hosvital.portar1 p11 , hosvital.homproc h11
 where p11.ptcodi=p1.ptcodi and p11.prcodi=p1.prcodi and p11.trfcod=h11.trfcod and p11.prcodi = h11.prcodi 

) as porfvalor,
(select  case when f1.forliqcar='U' then cast(p11.ptcntuvr * p11.ptporc/100 * f1.forliqvlhn as float)  when f1.forliqcar='F' then cast(p11.ptporc/100 * f1.forliqvlhn*  fac.fctovlr as float)   when f1.forliqcar='V' then cast(p11.ptporc* f1.forliqvlhn/100 as float)  end
 from hosvital.portar1 p11 
           inner join hosvital.forliq f on (1=1)
          inner join hosvital.forliq1 f1 on (p11.forliqcod=f1.forliqcod and  f1.forliqcod=f.forliqcod)
          inner join hosvital.honrios h on (h.hnrcod=f1.hnrcod)        
         left join hosvital.factor fac on (fac.fctocod=f1.fctocod)							
 where p11.ptcodi=p1.ptcodi and p11.prcodi=p1.prcodi  and  f1.hnrcod='01'
) as honorarios_01,
(select  case when f1.forliqcar='U' then cast(p11.ptcntuvr * p11.ptporc/100 * f1.forliqvlhn as float)  when f1.forliqcar='F' then cast(p11.ptporc/100 * f1.forliqvlhn*  fac.fctovlr as float)   when f1.forliqcar='V' then cast(p11.ptporc* f1.forliqvlhn/100 as float)  end
 from hosvital.portar1 p11 
           inner join hosvital.forliq f on (1=1)
          inner join hosvital.forliq1 f1 on (p11.forliqcod=f1.forliqcod and  f1.forliqcod=f.forliqcod)
          inner join hosvital.honrios h on (h.hnrcod=f1.hnrcod)        
         left join hosvital.factor fac on (fac.fctocod=f1.fctocod)							
 where p11.ptcodi=p1.ptcodi and p11.prcodi=p1.prcodi  and  f1.hnrcod='02'
) as honorarios_02,
(select  case when f1.forliqcar='U' then cast(p11.ptcntuvr * p11.ptporc/100 * f1.forliqvlhn as float)  when f1.forliqcar='F' then cast(p11.ptporc/100 * f1.forliqvlhn*  fac.fctovlr as float)   when f1.forliqcar='V' then cast(p11.ptporc* f1.forliqvlhn/100 as float)  end
 from hosvital.portar1 p11 
           inner join hosvital.forliq f on (1=1)
          inner join hosvital.forliq1 f1 on (p11.forliqcod=f1.forliqcod and  f1.forliqcod=f.forliqcod)
          inner join hosvital.honrios h on (h.hnrcod=f1.hnrcod)        
         left join hosvital.factor fac on (fac.fctocod=f1.fctocod)							
 where p11.ptcodi=p1.ptcodi and p11.prcodi=p1.prcodi  and  f1.hnrcod='03'
) as honorarios_03,
(select  case when f1.forliqcar='U' then cast(p11.ptcntuvr * p11.ptporc/100 * f1.forliqvlhn as float)  when f1.forliqcar='F' then cast(p11.ptporc/100 * f1.forliqvlhn*  fac.fctovlr as float)   when f1.forliqcar='V' then cast(p11.ptporc* f1.forliqvlhn/100 as float)  end
 from hosvital.portar1 p11 
           inner join hosvital.forliq f on (1=1)
          inner join hosvital.forliq1 f1 on (p11.forliqcod=f1.forliqcod and  f1.forliqcod=f.forliqcod)
          inner join hosvital.honrios h on (h.hnrcod=f1.hnrcod)        
         left join hosvital.factor fac on (fac.fctocod=f1.fctocod)							
 where p11.ptcodi=p1.ptcodi and p11.prcodi=p1.prcodi  and  f1.hnrcod='04'
) as honorarios_04,
(select  case when f1.forliqcar='U' then cast(p11.ptcntuvr * p11.ptporc/100 * f1.forliqvlhn as float)  when f1.forliqcar='F' then cast(p11.ptporc/100 * f1.forliqvlhn*  fac.fctovlr as float)   when f1.forliqcar='V' then cast(p11.ptporc* f1.forliqvlhn/100 as float)  end
 from hosvital.portar1 p11 
           inner join hosvital.forliq f on (1=1)
          inner join hosvital.forliq1 f1 on (p11.forliqcod=f1.forliqcod and  f1.forliqcod=f.forliqcod)
          inner join hosvital.honrios h on (h.hnrcod=f1.hnrcod)        
         left join hosvital.factor fac on (fac.fctocod=f1.fctocod)							
 where p11.ptcodi=p1.ptcodi and p11.prcodi=p1.prcodi  and  f1.hnrcod='05'
) as honorarios_05,
(select  case when f1.forliqcar='U' then cast(p11.ptcntuvr * p11.ptporc/100 * f1.forliqvlhn as float)  when f1.forliqcar='F' then cast(p11.ptporc/100 * f1.forliqvlhn*  fac.fctovlr as float)   when f1.forliqcar='V' then cast(p11.ptporc* f1.forliqvlhn/100 as float)  end
 from hosvital.portar1 p11 
           inner join hosvital.forliq f on (1=1)
          inner join hosvital.forliq1 f1 on (p11.forliqcod=f1.forliqcod and  f1.forliqcod=f.forliqcod)
          inner join hosvital.honrios h on (h.hnrcod=f1.hnrcod)        
         left join hosvital.factor fac on (fac.fctocod=f1.fctocod)							
 where p11.ptcodi=p1.ptcodi and p11.prcodi=p1.prcodi  and  f1.hnrcod='06'
) as honorarios_06,
(select  case when f1.forliqcar='U' then cast(p11.ptcntuvr * p11.ptporc/100 * f1.forliqvlhn as float)  when f1.forliqcar='F' then cast(p11.ptporc/100 * f1.forliqvlhn*  fac.fctovlr as float)   when f1.forliqcar='V' then cast(p11.ptporc* f1.forliqvlhn/100 as float)  end
 from hosvital.portar1 p11 
           inner join hosvital.forliq f on (1=1)
          inner join hosvital.forliq1 f1 on (p11.forliqcod=f1.forliqcod and  f1.forliqcod=f.forliqcod)
          inner join hosvital.honrios h on (h.hnrcod=f1.hnrcod)        
         left join hosvital.factor fac on (fac.fctocod=f1.fctocod)							
 where p11.ptcodi=p1.ptcodi and p11.prcodi=p1.prcodi  and  f1.hnrcod='07'
) as honorarios_07,
(select  case when f1.forliqcar='U' then cast(p11.ptcntuvr * p11.ptporc/100 * f1.forliqvlhn as float)  when f1.forliqcar='F' then cast(p11.ptporc/100 * f1.forliqvlhn*  fac.fctovlr as float)   when f1.forliqcar='V' then cast(p11.ptporc* f1.forliqvlhn/100 as float)  end
 from hosvital.portar1 p11 
           inner join hosvital.forliq f on (1=1)
          inner join hosvital.forliq1 f1 on (p11.forliqcod=f1.forliqcod and  f1.forliqcod=f.forliqcod)
          inner join hosvital.honrios h on (h.hnrcod=f1.hnrcod)        
         left join hosvital.factor fac on (fac.fctocod=f1.fctocod)							
 where p11.ptcodi=p1.ptcodi and p11.prcodi=p1.prcodi  and  f1.hnrcod='08'
) as honorarios_08
from hosvital.portar p, hosvital.portar1 p1, hosvital.maepro m
where p.ptcodi='152' and p.ptcodi=p1.ptcodi  and p1.prcodi=m.prcodi ; -- and p1.prcodi='219303';


select * FROM HOSVITAL.HONRIOS;
SELECT */ FROM HOSVITAL
select * FROM HOSVITAL.forliq where forliqcOD='J20';
select * FROM HOSVITAL.forliq1 order by forliqcod, hnrcod;
select * FROM HOSVITAL.forliq1 where forliqcod='C25' order by forliqcod, hnrcod;

select  * --  cast(p11.ptcntuvr * p11.ptporc/100 * f1.forliqvlhn as float)
 from hosvital.portar1 p11 , hosvital.honrios h, hosvital.forliq f, hosvital.forliq1 f1
 where p11.ptcodi='141' and  p11.prcodi='204003' and  p11.forliqcod=f.forliqcod and  f.forliqcod=f1.forliqcod and  f1.hnrcod = h.hnrcod  
