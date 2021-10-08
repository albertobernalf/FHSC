select * from hosvital.resmcue where rsmano=2020 and rsmmes=8 and trccod='860007373' order by rsmctncon;

select * from hosvital.cuentas;

select r.rsmctncon,t.trcrazsoc , sum(r.rsmsalant), sum(r.rsmcre), sum(r.rsmdeb), sum(r.rsmsalact)
from hosvital.resmcue r
inner join hosvital.cuentas c on (c.empcod=r.rsmempcod and c.cntcod= r.rsmctncon  and c.cntint='CXC')
inner join hosvital.terceros t on (t.trccod=r.trccod)
where  r.rsmempcod = '01' and r.mcdpto='001' and r.rsmano=2020 and r.rsmmes=8 and r.trccod='900156264'     
group by rsmctncon,t.trcrazsoc
order by rsmctncon,t.trcrazsoc ;

-- 13999001


select r.rsmctncon,t.trcrazsoc , sum(r.rsmsalant), sum(r.rsmcre), sum(r.rsmdeb), sum(r.rsmsalact)
from hosvital.resmcue r
inner join hosvital.cuentas c on (c.empcod=r.rsmempcod and c.cntcod= r.rsmctncon  and c.cntint='CXC')
inner join hosvital.terceros t on (t.trccod=r.trccod)
where  r.rsmempcod = '01' and r.mcdpto='001' and r.rsmano=2020 and r.rsmmes=8 and r.trccod='900156264'    and
(r.rsmsalant <> 0.00 or r.rsmdeb <> 0.00 or r.rsmcre <> 0.00 or  r.rsmsalact<> 0.00)
group by rsmctncon,t.trcrazsoc
order by rsmctncon,t.trcrazsoc ;

-- Query final

select r.rsmctncon,r.trccod,t.trcrazsoc , sum(r.rsmsalant), sum(r.rsmcre), sum(r.rsmdeb), sum(r.rsmsalact)
from hosvital.resmcue r
inner join hosvital.cuentas c on (c.empcod=r.rsmempcod and c.cntvig=2020 and c.cntcod= r.rsmctncon  and c.cntint='CXC')
inner join hosvital.terceros t on (t.trccod=r.trccod)
where  r.rsmempcod = '01' and r.mcdpto='001' and r.rsmano=2020 and r.rsmmes=8 and r.trccod='900156264'    and
(r.rsmsalant <> 0.00 or r.rsmdeb <> 0.00 or r.rsmcre <> 0.00 or  r.rsmsalact<> 0.00)
group by rsmctncon,r.trccod,t.trcrazsoc
having (sum(r.rsmsalant) <> 0.00 OR sum(r.rsmcre) <> 0.00 OR sum(r.rsmdeb) <> 0.00 OR  sum(r.rsmsalact) <> 0.00)
order by rsmctncon,t.trcrazsoc ;

