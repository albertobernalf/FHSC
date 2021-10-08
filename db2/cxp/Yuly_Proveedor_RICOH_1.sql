
select * from  hosvital.movcont2 where doccod='ACP' AND MVCNRO  = 1745 and mvcdocrf1 ='NOM.JUNIO18';

select * from hosvital.movcont2 where doccod='NCP' and trccod='805026666' and cntvig=2019;


select * from hosvital.movcont2 a where a.doccod='NCP' and a.trccod='805026666' and a.cntvig>=2018 and a.mvcnat='D' and a.cntcod = '22050502'   and  a.mvcdocrf1
  not in 
(select b.mvcxpnuob from hosvital.movcxp b where b.cntvig>=2018 and b.prvcod= '805026666' and b.doccod=a.doccod and b.mvcxpnro=a.mvcnro and a.cntcod=b.cntcod)
order by a.mvcnro;

select * from hosvital.movcxp where doccod='NCP' AND mvcxpnro= 2570 ;
select * from hosvital.movcont2 where doccod='NCP' AND mvcnro= 2570 ;

select  a.doccod,a.mvcnro,a.cntvig,a.mvccsc,a.mvcdocrf1, x.mvcxpnuob,a.mvcvlr
from hosvital.movcont2 a , hosvital.movcxp x
where a.doccod=x.doccod and  a.mvcnro = x.mvcxpnro and a.doccod='NCP' and a.trccod='805026666' and a.cntvig>=2018 and a.mvcnat='D' and a.cntcod = '22050502'   and  a.mvcdocrf1
  not in 
(select b.mvcxpnuob from hosvital.movcxp b where b.cntvig>=2018 and b.prvcod= '805026666' and b.doccod=a.doccod and b.mvcxpnro=a.mvcnro and a.cntcod=b.cntcod)
order by a.mvcnro;


update hosvital.movcont2
set mvcdocrf1= 'FB-65971'
where doccod='NCP' and mvcnro = 2570 and mvccsc=4;

update hosvital.movcont2
set mvcdocrf1= 'FB-65966'
where doccod='NCP' and mvcnro = 2571 and mvccsc=4;

update hosvital.movcont2
set mvcdocrf1= 'FB-65972'
where doccod='NCP' and mvcnro = 2572 and mvccsc=4;

update hosvital.movcont2
set mvcdocrf1= 'FB-65969'
where doccod='NCP' and mvcnro = 2573 and mvccsc=4;

update hosvital.movcont2
set mvcdocrf1= 'FB-65968 '
where doccod='NCP' and mvcnro = 2574 and mvccsc=4;

update hosvital.movcont2
set mvcdocrf1= 'FB-65980'
where doccod='NCP' and mvcnro = 2575 and mvccsc=4;

update hosvital.movcont2
set mvcdocrf1= 'FB-65979'
where doccod='NCP' and mvcnro = 2576 and mvccsc=4;

update hosvital.movcont2
set mvcdocrf1= 'FB-65977'
where doccod='NCP' and mvcnro = 2577 and mvccsc=4;

update hosvital.movcont2
set mvcdocrf1= 'FB-65975'
where doccod='NCP' and mvcnro = 2578 and mvccsc=4;   	

update hosvital.movcont2
set mvcdocrf1= 'FB-65976'
where doccod='NCP' and mvcnro = 2579 and mvccsc=4;    

update hosvital.movcont2
set mvcdocrf1= 'FB-65978'
where doccod='NCP' and mvcnro = 2580 and mvccsc=4;    

update hosvital.movcont2
set mvcdocrf1= 'FB-65970'
where doccod='NCP' and mvcnro = 2581 and mvccsc=4;        

update hosvital.movcont2
set mvcdocrf1= 'FB-65974'
where doccod='NCP' and mvcnro = 2582 and mvccsc=4;      
  	


select  a.doccod,a.mvcnro,a.mvccsc,a.mvcdocrf1, x.mvcxpnuob, a.mvcvlr
from hosvital.movcont2 a , hosvital.movcxp x
where a.doccod=x.doccod and  a.mvcnro = x.mvcxpnro and a.doccod='NCP' and a.trccod='830023819' and a.cntvig>=2018 and a.mvcnat='D'   and  a.mvcdocrf1
  not in 
(select b.mvcxpnuob from hosvital.movcxp b where b.cntvig>=2018 and b.prvcod= '830023819' and b.doccod=a.doccod and b.mvcxpnro=a.mvcnro and a.cntcod=b.cntcod)
order by a.mvcnro;



-- Senfarma


select * from hosvital.movcxp where doccod='CA' and mvcxpnro= 2945;
select * from hosvital.movcont2 where doccod='CA' and mvcnro = 2945;  -- tiene otro tercero 830041488      


-- terumo

select * from hosvital.movcxp where doccod='CA' and mvcxpnro= 6879; -- otro tercero 830025149      	
select * from hosvital.movcont2 where doccod='CA' and mvcnro = 6879;  -- tien otro tercero   900361174  / 830025149       y esta por 861265.00	
	

	 

