select * from hosvital.docucon1 where doccod in ('CEF','AEF','ARF','CEG','ACH');
select * from hosvital.docucon where doccod in ('CEF','AEF','ARF','CEG','ACH');

select * from hosvital.docucon1 where doccod in ('CEF','AEF');
select * from hosvital.docucon where doccod in ('CEF','AEF');

select * from hosvital.docucon1 where doccod in ('AEF');
select * from hosvital.docucon1A ; -- where doccod in ('AEF');

SELECT * FROM HOSVITAL.DOCUCONA;

select * from hosvital.docucon1 ;
select * from hosvital.docucon1;


/*
update   hosvital.docucon1
set empcod='03',MCDPTO='003'
where doccod in ('AEF');

*/

SELECT * FROM HOSVITAL.MOVBAN WHERE DOCCOD='CEF'  AND MVBNROCMP =63;