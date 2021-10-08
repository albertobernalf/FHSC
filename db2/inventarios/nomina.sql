select * from hosvital.movcont3 where mvcfch >= '2020-12-18 00:00:00';
select * from hosvital.movcont2 where doccod='CEG' AND MVCNRO=35506 AND TRCCOD='1013588348';
select doccod, trccod, mvcdocrf1, mvcnat,  mvcvlr , mvcdet  from hosvital.movcont2 where mvcanio=2020 and  mvcmes= 6 and TRCCOD='1013588348' order by mvcmes;
select doccod, trccod, mvcdocrf1, mvcnat,  mvcvlr , mvcdet  from hosvital.movcont2 where mvcanio=2020 and  mvcmes= 3 and TRCCOD='19465673' order by mvcmes;

select doccod, trccod, mvcdocrf1, mvcnat,  mvcvlr , mvcdet  from hosvital.movcont2 where mvcanio=2020 and  mvcmes= 12 and TRCCOD='1013588348' order by mvcmes;
select doccod, trccod, mvcdocrf1, mvcnat,  mvcvlr , mvcdet  from hosvital.movcont2 where mvcanio=2020 and  mvcmes= 12 and TRCCOD='19465673' order by mvcmes;
select doccod, trccod, mvcdocrf1, mvcnat,  mvcvlr , mvcdet  from hosvital.movcont2 where mvcanio=2020 and  doccod='CEG'  and TRCCOD='1013588348' order by mvcmes;
select doccod, trccod, mvcdocrf1, mvcnat,  mvcvlr , mvcdet  from hosvital.movcont2 where mvcanio=2020 and  doccod='CEG'  and TRCCOD='19465673' order by mvcmes;
select *  from hosvital.movcont2 where mvcanio=2020 and  mvcmes= 12 and TRCCOD='52504304' order by mvcmes;
select *  from hosvital.movcont2 where mvcanio=2020 and  mvcmes>1 and TRCCOD='19465673' and mvcdet like ('%NOMINA%PLANTA%') AND MVCNAT='C' order by mvcmes;
select *  from hosvital.movcont2 where mvcanio=2021 and  mvcmes>1 and TRCCOD='1013588348' and mvcdet like ('%NOMINA%PLANTA%') AND MVCNAT='C' order by mvcmes;
select *  from hosvital.movcont2 where mvcanio=2021 and  mvcmes>= 1  and TRCCOD='19465673' order by mvcmes;
select *  from hosvital.movcont2 where mvcanio=2021 and  mvcmes>= 1  and TRCCOD='' order by mvcmes;
select *  from hosvital.movcont2 where mvcanio=2021 and  mvcmes>= 1  and TRCCOD='' order by mvcmes;

select DOCCOD,MVCNRO,CNTVIG,TRCCOD,MVCDOCRF1,  MVCNAT, MVCDET, MVCVLRLC ,  MVCVLR  from hosvital.movcont2 where mvcanio=2020 and  mvcmes= 12 and TRCCOD='19465673'  and MVCDOCRF1 like ('%CES%') order by mvcmes;
select DOCCOD,MVCNRO,CNTVIG,TRCCOD,MVCDOCRF1,  MVCNAT, MVCDET, MVCVLRLC ,  MVCVLR  from hosvital.movcont2 where mvcanio=2019 and  mvcmes= 12 and TRCCOD='19465673'  and MVCDOCRF1 like ('%CES%') order by mvcmes;
select *  from hosvital.movcont2 where mvcanio=2020 and  mvcmes= 12  and TRCCOD='80760858' order by mvcmes;

select * from hosvital.terceros where trcrazsoc like ('%MARISOL%GARZON%');

select *  from hosvital.movcont2 where mvcanio>=2020 and  mvcmes>1 and TRCCOD='' ORDER BY MVCMES ;