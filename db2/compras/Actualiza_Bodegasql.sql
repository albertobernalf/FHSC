select * from hosvital.compcab where ordenro in  ( 29755, 29756, 29671, 29668, 29666, 29665, 29661);
select * from hosvital.compcab2 where ordenro in  ( 29755, 29756, 29671, 29668, 29666, 29665, 29661);

update hosvital.compcab 
set ordecodbod='00'
where ordenro in  ( 29755, 29756, 29671, 29668, 29666, 29665, 29661);


update hosvital.compcab2 
set ordebdg='00'
where ordenro in  ( 29755, 29756, 29671, 29668, 29666, 29665, 29661);