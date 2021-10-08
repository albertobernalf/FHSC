select mpnfac, mpcedu, matotf, matotp, matots, mavals, mavapu, masalcxc from hosvital.maeate where mpnfac  = 635247;
select * from hosvital.maeate where mpnfac  = 635247;

select * from hosvital.tmpfac where tfcedu='20227978';


select SUM(MAVATS)  -- 0
 from hosvital.maeate3 
where  mpnfac = 635247  and  fcstpotrn='F' and maesanus<>'S';


select SUM(MAVATp)
 from hosvital.maeate2 
where  mpnfac = 635247  and  fcptpotrn='F' and maesanup<>'S';  -- 658391.00	;

update hosvital.maeate 
set matotf = 658391.00	, matots =0,mavapu=658391.00, mavnpu=658391.00
where mpnfac  = 635247;
