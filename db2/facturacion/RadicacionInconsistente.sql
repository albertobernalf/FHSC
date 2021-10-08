
select * from hosvital.hojobl where hojnumobl ='639719';

select * from hosvital.hojobl where hojnumobl ='639723';
select * from hosvital.hojobl where hojnumobl ='639730';
select * from hosvital.hojobl where hojnumobl ='639724';
select * from hosvital.hojobl where hojnumobl ='642568';
select * from hosvital.hojobl where hojnumobl ='638985';

select * from hosvital.hojobl where hojnumobl ='638986';

select * from hosvital.maeate where mpnfac  IN (638985, 638986, 645996);
select * from hosvital.HOJOBL where hojnumobl  IN ('638985', '638986', '645996');
select * from hosvital.HOJOBL where hojnumobl >= '638985' order by hojnumobl;

select * from hosvital.movcxc where mccnumobl ='638987';

select * from hosvital.capbas where mpcedu='830014193'; 

select * from hosvital.terceros where trccod='830014193';    	



select * from hosvital.admglo11 where mpnfac in ('639719','639723','639730','639724','642568');
select * from hosvital.admglo11 where mpnfac in ('639719','639723','639730','639724','642568','638985','638986','645996');

update  hosvital.admglo11
set aglfrdfac='2021-01-27',aglfchrad='2021-01-27 00:00:00'
 where mpnfac  in ('639719','639723','639730','639724','642568','638985','638986','645996');

select * from hosvital.admglo11 where aglfrdfac='2021-02-27';
update  hosvital.admglo11
set aglfrdfac='2021-02-27',aglfchrad='2021-02-27 00:00:00', aglcondoc = 'FAD', AGLCONNRO=1806,AGLCONFEC='2021-02-27 20:30:14.0000'
 where mpnfac  in ('639719','639723','639730','639724','642568','638985','638986','645996');
