select * from hosvital.movcont3 where doccod='NCP'AND MVCNRO = 3235;
select * from hosvital.movcont2 where doccod='NCP'AND MVCNRO = 3235;



UPDATE hosvital.movcont3 
SET MVCFCH='2020-03-13 00:00:00'
where doccod='NCP'  AND MVCNRO = 3235;

UPDATE hosvital.movcont2
SET MVCCFCH='2020-03-13'
where doccod='NCP' AND MVCNRO = 3235;

UPDATE hosvital.movcont2
SET MVCCFCH='2020-03-13', MVCDOCRF1= 'E 71673' 
where doccod='NCP' AND MVCNRO = 3235 AND  MVCCSC=4;


select * from hosvital.NIMOVCON1 where doccod='NCP'AND nimcnro = 3235;
select * from hosvital.nimovcon2 where doccod='NCP'AND nimcnro = 3235;

update hosvital.NIMOVCON1 
set nimc1fcH= '2020-03-13 00:00:00' 
where doccod='NCP' AND nimcnro = 3235;



update hosvital.NIMOVCON2
set nimc2fch= '2020-03-13' 
where doccod='NCP' AND nimcnro = 3235;

select * from hosvital.movcxp ;



select * from hosvital.movcxp where doccod='NCP' AND MVCXPNRO=3235;

UPDATE  hosvital.movcxp 
SET  MVCXPFCH='2020-03-13 00:00:00', MVCXPNUOB= 'E 71673' 
where doccod='NCP' AND MVCXPNRO=3235;

SELECT * FROM HOSVITAL.HOJOBLPRV  WHERE HOPNOOBL='71439'  ;

SELECT * FROM HOSVITAL.HOJOBLPRV  WHERE HOPNOOBL='E 71673'  ;

UPDATE HOSVITAL.HOJOBLPRV  
SET HOPTOTDEB=140670
WHERE HOPNOOBL='E 71673'  ;

