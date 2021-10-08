select matipdoc, count(*) from hosvital.maeate where facfch >= '2020-07-29' group by matipdoc;  -- 82

select matipdoc, count(*) from hosvital.maeate 
where facfch >= '2020-07-29' 
group by matipdoc;



select * from hosvital.maeate where facfch >= '2020-07-29' 	;
select * from hosvital.maeate where facfch < '2020-07-29' 	;


select count(*) from hosvital.ressev where resfec >= '2020-07-29 00:00:00';  -- 82 / 59/ 61

select * from hosvital.ressev where resfec >= '2020-07-29 00:00:00'; 