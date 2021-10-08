select * from hosvital.maesum1 where msreso='0510HM01';
select * from hosvital.maesumn where msreso='0510HM01';

update  hosvital.maesum1 set msctrllot ='S'  where msreso='0510HM01';

update  hosvital.maesum1  -- ESTABA ZZ1Z1	Z875	999 	99	
set mscodi='ZZ1Z1',msprac='BU35', cnccd='999', msform='99'
 where msreso='0510HM01';