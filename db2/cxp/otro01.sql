select * from hosvital.movcxp limit 10;
select * from hosvital.hojoblprv where hopnoobl = '0054';

select year(y.mvcxpfch)  ,  month (y.mvcxpfch),     sum( case when y.mvcxpnat = 'C'  then y.mvcxpval when y.mvcxpnat ='D' then -y.mvcxpval end) 
 from hosvital.movcxp y
where y.cntvig = 2019  and y.prvcod ='830003564'    --and mvcxpnuob ='FC15528'
group by  year(y.mvcxpfch)  ,  month (y.mvcxpfch);

select distinct (doccod)
 from hosvital.movcxp y
where y.cntvig = 2019  and y.prvcod ='830003564'  ; 

select * from hosvital.docucon where doccod in ('CNP'	,
'CNS'	,
'CEG'	,
'ACP'	,
'ACH'	,
'FCF'	,
'CEF'	);
  and  doccod  not in ('ACP','CNP','CNS');

      	
-- -1619108676.04	


select * from hosvital.movcxp 
where  mvcxpfch >= '2018-01-01 00:00:00' ;

select *
 from hosvital.movcxp y
where y.prvcod ='900040831'  order by mvcxpfch;

