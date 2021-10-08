select  * from hosvital.citmed where citnum  in (526262,525109);
select  * from hosvital.citmed1 where citnum  in (526262,525109);


/*
update hosvital.citmed
set  citestp='A'
where citnum=525109;

update hosvital.citmed1
set  citesta='A'
where citnum=525109;
*/

select * from hosvital.citmed2  where citnum  in (525109);
select * from hosvital.citmed3  where citnum  in (525109);
select * from hosvital.citmed2  where citnum  in (525109);

delete from  hosvital.citmed3  where citnum  in (525109) and citconpro=1 and citprocod='';