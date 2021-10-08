select * from hosvital.maepab11;
select * from hosvital.maeate;
select * from hosvital.capbas;
select * from hosvital.maepab;

select c.mpnomc, m.mafchi,m.mahori, m.mafche,m.mahore, m.faccodpab, m1.mpnomp,m.faccodcam
from hosvital.capbas c, hosvital.maeate m , hosvital.maepab m1
where m.facfch >= '2019-03-01'and m.facfch <='2019-03-31' 
          and m.mptdoc = c.mptdoc and m.mpcedu = c.mpcedu and
          m1.mpcodp =  m.faccodpab;

