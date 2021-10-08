select * from hosvital.movcont2  where empcod='02' and doccod='FV' AND MVCNRO=142 AND  trccod='51729539' ;
 

UPDATE hosvital.movcont2 SET MVCDOCRF1='CSC-4618', MVCDOCRF3='FV'
where empcod='02' and doccod='FV' AND MVCNRO=142 AND  trccod='51729539' AND MVCANIO=2021 AND MVCMES= 7 AND MVCCSC IN (211,212,213,214);