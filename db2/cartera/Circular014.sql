select * from hosvital.maeemp where mennit='SS0021'; --  MECODRIP

select * from hosvital.admglo11 where mpnfac =573429  ;
select * from hosvital.admglo11 where mpnfac =570555 ;  -- 2019-04-01	
select *  from hosvital.admglo11 where aglremnr = 22572;

select * from hosvital.maeate where mpnfac =573429;

select  mecodrip from hosvital.maeemp where mennit in ('245','2455');


select  * from hosvital.maeemp where mennit in ('245','2455');

select '860007373',4,'04',2019,2,m.mpnfac, m.matotf,m1.mecodrip,   '110001',0
from hosvital.maeate m, hosvital.maeemp m1
where m.mpnfac =  573429  and m.mpmeni = m1.mennit and m.facfch >='2019-04-22' and m.facfch <= '2019-05-21' and m1.mecodrip in ('CCF001','CCF002','CCF007','CCF009','CCF015','CCF018',
'CCF023','CCF024','CCF027','CCF028','CCF031','CCF032','CCF033','CCF035','CCF037','CCF045','CCF049','CCF053','CCF055','CCF101','CCF102','CCF103','EPS020','EPSS34',
'EPS022','EPS025','EPS028','EPS030','EPS031','EPSI01','EPSI02','EPSI03','EPSI04','EPSI05','EPSI06','EPSS02','EPSS03','EPSS09','EPSS14','EPSS26','EPSS33','ESS002','ESS024',
'ESS062','ESS076','ESS091','ESS118','ESS133','ESS207','EPS045','EPS005');



select '860007373',4,'04',2019,2,m.mpnfac, m.matotf,emp.mennid, '110001',0 
from hosvital.maeate m, hosvital.maeemp m1 ,hosvital.admglo11 adm, hosvital.empress emp
where   m.mpmeni = m1.mennit and m1.mecntr = emp.mecntr and m.mpnfac = adm.mpnfac and adm.aglfrdfac >= '2019-04-21' and adm.aglfrdfac <= '2019-05-20' and
 m.maestf not in ('1','10') and emp.mennid in ('CCF001','CCF002','CCF007','CCF009','CCF015','CCF018', 'CCF023','CCF024','CCF027','CCF028','CCF031','CCF032','CCF033','CCF035','CCF037','CCF045','CCF049','CCF053','CCF055','CCF101', 'CCF102','CCF103','EPS020','EPSS34', 'EPS022','EPS025','EPS028','EPS030','EPS031','EPSI01','EPSI02','EPSI03','EPSI04','EPSI05','EPSI06','EPSS02','EPSS03','EPSS09','EPSS14' ,'EPSS26','EPSS33','ESS002','ESS024','ESS062','ESS076','ESS091','ESS118','ESS133','ESS207','EPS045','EPS005') order by m.mpnfac;

select  * from hosvital.empress where mecntr='800251440-6';

select * from hosvital.maecont where mecntr='800251440-6';

