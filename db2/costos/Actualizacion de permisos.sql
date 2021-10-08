select * from hosvital.repexc where repclctv in (27,54);
select * from hosvital.repexc1 where repclctv=27 order by repctv;
select * from hosvital.repexc1 where repclctv=54 order by repctv;  -- conces nuevo 45
select * from hosvital.repexc1 where repclctv=27  and repctv = 69 ;  -- order by repctv;
select * from hosvital.repexc2   where repclctv=27  and repctv = 69 ;   -- permisos
select * from hosvital.repexc3  where repclctv=27  and repctv = 69 ; 

-- ordenes de trabajo
 
update hosvital.repexc1 set repclctv = 54  , repctv = 47 where  repclctv=74  and repctv = 9 ; 
update hosvital.repexc2 set repclctv = 54  , repctv = 47 where  repclctv=74  and repctv = 9 ; 
update hosvital.repexc3 set repclctv = 54  , repctv = 47 where  repclctv=74  and repctv = 9 ; 


--