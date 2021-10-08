select * from hosvital.nimovcon1 where doccod='REC' and nimcnro=168088;

update hosvital.nimovcon1 
set nimc1est='N'
where doccod='REC' and nimcnro=168088;

select * from hosvital.nimovcon2 where doccod='REC' and nimcnro=168088;

update hosvital.nimovcon2 
set nimc2vl=0, nimc2vlr=0
where doccod='REC' and nimcnro=168088;


select * from hosvital.movcont3 where doccod='REC' and mvcnro=168088;
select * from hosvital.movcont2 where doccod='REC' and mvcnro=168088;