select mpnfac,matotf,matotp,matots,masalcxc, mavals  from hosvital.maeate where mpnfac in (636926 , 636910 , 636929 , 636930 ,  636933);

select * from hosvital.maeate2 where mpnfac in (636926 , 636910 , 636929 , 636930 ,  636933);
select * from hosvital.maeate3 where mpnfac in (636926 , 636910 , 636929 , 636930 ,  636933);

/*

update hosvital.maeate
set matotf=0,matotp=0,masalcxc=0.mavals=0
 where mpnfac in (636926 , 636910 , 636929 , 636930 ,  636933);

*/
select mpnfac,matotf,matotp,matots,masalcxc, mavals  from hosvital.maeate where mpnfac in (636894,636895);
select * from hosvital.maeate2 where mpnfac in (636894,636895);
select * from hosvital.maeate3 where mpnfac in (636894,636895);



update hosvital.maeate
set matotf=160000000,matotp=0,masalcxc=0,mavals=0
 where mpnfac in (636894,636895);

