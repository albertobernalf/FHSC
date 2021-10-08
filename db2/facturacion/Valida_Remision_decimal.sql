select * from hosvital.maeate3 where mpnfac  = 574487  and    mod(mavalu, 1) <> 0  order by mavalu ;
select * from hosvital.maepac where mpcedu = '79145200';


select a.aglremnr, b.mpnfac, b.msreso,b.macans,b.mavalu,b.mavats,round(b.mavalu) as redondeo, b.macans*round(b.mavalu) as daria
 from hosvital.admglo11 a,hosvital.maeate3 b
where aglremnr = 22990 and a.mpnfac = b.mpnfac and  mod(b.mavalu, 1) <> 0 and b.fcstpotrn='F' and b.maesanus='N'
order by a.mpnfac;

select sum(b.mavalu), sum(round(b.mavalu))  from hosvital.admglo11 a,hosvital.maeate3 b
where aglremnr = 22990 and a.mpnfac = b.mpnfac and  mod(b.mavalu, 1) <> 0 and fcstpotrn='F' and maesanu='N';