select  * from hosvital.maeate where mpnfac  in ('562280','562281')		;
select  * from hosvital.maeate2  where mpnfac = 562280	
	
	;
select mpnfac, mafepr, fcpcodscc ,macodpab, macodcam from hosvital.maeate2 where mpnfac = 580379 and fcptpotrn='F' and maespanup<> 'S'	 order by macodpab;  -- fcppcoddscc
select  * from hosvital.maeate3 where mpnfac = 580379 and fcstpotrn='F' and maesanus <> 'S'	;

select * from hosvital.cencost;
select * from hosvital.maepab order by mpcodp;

select mpnfac, mafepr,prcodi, fcpcodscc ,macodpab, macodcam,cncdsc  -- iojo tiene el opabeklklon
 from hosvital.maeate2 , hosvital.cencost
where mpnfac = 580379 and fcptpotrn='F' and maespanup<> 'S' and  fcpcodscc= cnccod	; 


select * from hosvital.bodegas;

select  mpnfac, mafcsu,macencos, msreso,mabodent ,   boddesc  -- ojo pior la bodega
 from hosvital.maeate3 , hosvital.bodegas 
where mpnfac = 580379 and fcstpotrn='F' and maesanus <> 'S' and mabodent = hosvital.bodegas.bodega	;

-- El query por centros de costo

select i.ingfac as factura,i.mptdoc as tipo_doc,i.mpcedu as documento, i.ingcsc as consecutivo_de_ingreso,c.mpnomc as paciente, i.ingfecadm as ingreso, i.ingfecegr as egreso,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=01
) as Pabellon_01,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=1

) as Pabellon_01,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=02
) as Pabellon_02,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=2

) as Pabellon_02,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=03
) as Pabellon_03,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=3

) as Pabellon_03,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=04
) as Pabellon_04,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=4

) as Pabellon_04,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=05
) as Pabellon_05,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=5

) as Pabellon_05,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=06
) as Pabellon_06,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=6

) as Pabellon_06,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=07
) as Pabellon_07,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=7

) as Pabellon_07,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=08
) as Pabellon_08,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=8

) as Pabellon_08,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=09
) as Pabellon_09,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=9

) as Pabellon_09,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=10
) as Pabellon_10,
(select sum(mae2.mavatp)from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=10

) as Pabellon_10,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=11
) as Pabellon_11,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=11

) as Pabellon_11,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=12
) as Pabellon_12,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=12

) as Pabellon_13,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=13
) as Pabellon_13,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=13

) as Pabellon_13,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=14
) as Pabellon_14,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=14

) as Pabellon_14,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=15
) as Pabellon_15,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=15

) as Pabellon_15,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=16
) as Pabellon_16,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=16

) as Pabellon_16,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=17
) as Pabellon_17,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=17

) as Pabellon_17,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=18
) as Pabellon_18,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=18

) as Pabellon_18,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=19
) as Pabellon_19,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=19

) as Pabellon_19,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=20
) as Pabellon_20,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=20

) as Pabellon_20,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=21
) as Pabellon_21,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=21

) as Pabellon_21,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=22
) as Pabellon_22,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=22

) as Pabellon_22,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=23
) as Pabellon_23,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=23

) as Pabellon_23,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=24
) as Pabellon_24,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=24

) as Pabellon_24,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=25
) as Pabellon_25,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=25

) as Pabellon_25,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=26
) as Pabellon_26,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=26

) as Pabellon_26,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=27
) as Pabellon_27,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=27

) as Pabellon_27,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=28
) as Pabellon_28,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=28

) as Pabellon_28,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=29
) as Pabellon_29,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=29

) as Pabellon_29,

(select mpnomp
from hosvital.maepab m
where m.mpcodp=30
) as Pabellon_30,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=30

) as Pabellon_30,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=31
) as Pabellon_31,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=31

) as Pabellon_31,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=32
) as Pabellon_32,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=32

) as Pabellon_32,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=33
) as Pabellon_33,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=33

) as Pabellon_33,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=34
) as Pabellon_34,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=34

) as Pabellon_34,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=35
) as Pabellon_35,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=35

) as Pabellon_35,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=36
) as Pabellon_36,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=36

) as Pabellon_36,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=37
) as Pabellon_37,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=37

) as Pabellon_37,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=38
) as Pabellon_38,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=38

) as Pabellon_38,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=39
) as Pabellon_39,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=39

) as Pabellon_39,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=40
) as Pabellon_40,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=40

) as Pabellon_40,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=41
) as Pabellon_41,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=41

) as Pabellon_41,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=42
) as Pabellon_42,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=42

) as Pabellon_42,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=43
) as Pabellon_43,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=43

) as Pabellon_43,
(select mpnomp
from hosvital.maepab m
where m.mpcodp=44
) as Pabellon_44,
(select sum(mae2.mavatp)
from hosvital.maeate maet, hosvital.maeate2 mae2
where maet.mptdoc = i.mptdoc and maet.mpcedu=i.mpcedu and maet.mactving=i.ingcsc and
           maet.mpnfac = mae2.mpnfac  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and maet.maestf  not in ('1','10') and maet.mpnfac = i.ingfac and mae2.macodpab=44

) as Pabellon_44,

(select boddesc
from hosvital.bodegas b
where b.bodega=098
) as Bodega_08,
(select sum(mae3.mavats)
from hosvital.maeate mae, hosvital.maeate3 mae3
where mae.mptdoc = i.mptdoc and mae.mpcedu=i.mpcedu and mae.mactving=i.ingcsc and
           mae.mpnfac = mae3.mpnfac  and mae3.fcstpotrn='F' and mae3.maesanus <> 'S' and mae.maestf  not in ('1','10') and mae.mpnfac = i.ingfac and mae3.mabodent=08

) as Bodega_08,


(select boddesc
from hosvital.bodegas b
where b.bodega=50
) as Bodega_50,
(select sum(mae3.mavats)
from hosvital.maeate mae, hosvital.maeate3 mae3
where mae.mptdoc = i.mptdoc and mae.mpcedu=i.mpcedu and mae.mactving=i.ingcsc and
           mae.mpnfac = mae3.mpnfac  and mae3.fcstpotrn='F' and mae3.maesanus <> 'S' and mae.maestf  not in ('1','10') and mae.mpnfac = i.ingfac and mae3.mabodent=50

) as Bodega_50,


(select boddesc
from hosvital.bodegas b
where b.bodega=59
) as Bodega_59,
(select sum(mae3.mavats)
from hosvital.maeate mae, hosvital.maeate3 mae3
where mae.mptdoc = i.mptdoc and mae.mpcedu=i.mpcedu and mae.mactving=i.ingcsc and
           mae.mpnfac = mae3.mpnfac  and mae3.fcstpotrn='F' and mae3.maesanus <> 'S' and mae.maestf  not in ('1','10') and mae.mpnfac = i.ingfac and mae3.mabodent=59

) as Bodega_59,

(select boddesc
from hosvital.bodegas b
where b.bodega=86
) as Bodega_86,
(select sum(mae3.mavats)
from hosvital.maeate mae, hosvital.maeate3 mae3
where mae.mptdoc = i.mptdoc and mae.mpcedu=i.mpcedu and mae.mactving=i.ingcsc and
           mae.mpnfac = mae3.mpnfac  and mae3.fcstpotrn='F' and mae3.maesanus <> 'S' and mae.maestf  not in ('1','10') and mae.mpnfac = i.ingfac and mae3.mabodent=86

) as Bodega_86,


(select sum(mae.matotp)
from hosvital.maeate mae
where mae.mptdoc = i.mptdoc and mae.mpcedu=i.mpcedu and mae.mactving=i.ingcsc  and mae.mpnfac = i.ingfac

) as Total_Proc,
(select sum(mae.matots)
from hosvital.maeate mae
where mae.mptdoc = i.mptdoc and mae.mpcedu=i.mpcedu and mae.mactving=i.ingcsc  and mae.mpnfac = i.ingfac

) as Total_Sum,

(select sum(mae.matotf)
from hosvital.maeate mae
where mae.mptdoc = i.mptdoc and mae.mpcedu=i.mpcedu and mae.mactving=i.ingcsc  and mae.mpnfac = i.ingfac

) as Valor_factura
from hosvital.ingresos i
inner join  hosvital.capbas c on (c.mptdoc=i.mptdoc and c.mpcedu=i.mpcedu )
left  join  hosvital.maeate mae on (mae.mpnfac = i.ingfac)
where mae.matipdoc='2'and  mae.facfch >= '2019-01-01' and mae.facfch <= '2019-06-30'  and mae.maestf not in ('1','10')   -- and mae.mpnfac in ('562280','562281')	

--  and i.ingfac = 580379 
order by 1;


----------------------------------------------------
----------------------------------------------------
-- Query presupuesto por EPS
----------------------------------------------------
----------------------------------------------------

select * from hosvital.maepab;
select * from hosvital.maeate;
select * from hosvital.maeemp;


select maeemp1.mennit,maeemp1.menomb,
(select sum(mae2.mavatp)
from hosvital.maeate mae1, hosvital.maeate2 mae2
where  mae1.facfch >= '2019-05-01' and mae1.facfch <= '2019-05-31'   and mae1.maestf  not in ('1','10') and mae1.mpnfac = mae2.mpnfac  and mae1.mpmeni = maeemp1.mennit  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S'       

) as Procedimientos,
(select sum(mae3.mavats)
from hosvital.maeate mae1, hosvital.maeate3 mae3
where  mae1.facfch >= '2019-05-01' and mae1.facfch <= '2019-05-31'  and mae1.maestf  not in ('1','10')  and mae1.mpnfac = mae3.mpnfac  and mae1.mpmeni = maeemp1.mennit  and mae3.fcstpotrn='F' and mae3.maesanus <> 'S'     

) as Suministros

from   hosvital.maeemp maeemp1
order by 1;

----------------------------------------------------
----------------------------------------------------
-- Query presupuesto por Especialidad DEL MEDICO DE SALIDA en la maeate
----------------------------------------------------
----------------------------------------------------

select * from hosvital.maeesp where mecode=387;
select * from hosvital.maeate2; -- mecomm
select * from hosvital.maeate3; 
select * from hosvital.maemed where mmcodm= 'ME106';
select * from hosvital.maeate; -- mecomm


select maeesp1.mecode,maeesp1.menome,
(select sum(mae2.mavatp)
from hosvital.maeate mae1, hosvital.maeate2 mae2
where  mae1.mpnfac = mae2.mpnfac  and maeesp1.mecode= mae2.mecomm and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and mae1.maestf  not in ('1','10') and  mae1.facfch >= '2019-05-01' and mae1.facfch <= '2019-05-31'   

) as Procedimientos,
(select sum(mae3.mavats)
from hosvital.maeate mae1, hosvital.maeate3 mae3
where  mae1.mpnfac = mae3.mpnfac  and maeesp1.mecode=  mae1.MAEsMS and mae3.fcstpotrn='F' and mae3.maesanus <> 'S' and mae1.maestf  not in ('1','10')  and   mae1.facfch >= '2019-05-01' and mae1.facfch <= '2019-05-31' 

) as Suministros

from   hosvital.maeesp maeesp1
order by 1;

----------------------------------------------------
----------------------------------------------------
-- Query presupuesto para PABELLONES Cups Detalle Servicio
----------------------------------------------------
----------------------------------------------------
select m.mpcodp, m.mpnomp,sum(mae2.mavatp)
from hosvital.maeate mae 
inner join hosvital.maeate2 mae2 on (mae2.mpnfac=mae.mpnfac)
inner join hosvital.maepab m on (m.mpcodp=mae2.macodpab)
where mae.matipdoc='2' and mae.facfch >= '2019-05-01' and mae.facfch <= '2019-05-31'  and mae.maestf  not in ('1','10')    and mae2.fcptpotrn='F' and mae2.maesanup <> 'S'  --  and mae.mpnfac = 580379
group by m.mpcodp, m.mpnomp
order by 1;


select * from hosvital.maepab order  by mpbodega;  -- mpclapro
select * from hosvital.bodegas;

select * from hosvital.maeate3 where mafcsu>= '2019-01-01 00:00:00';
select * from hosvital.cencost;
select * from hosvital.maeate where mpnfac = 563162	; -- fol327 0471N02B       	
select * from hosvital.hccom1 where hisckey='19299227' and hiscsec=327; 
select * from hosvital.frmsmns where hisckey='19299227' and hiscsec=327; 


----------------------------------------------------
----------------------------------------------------
-- Query presupuesto para BODEGAS Cums detalle servicio
----------------------------------------------------
----------------------------------------------------
select m.mpcodp,m.mpnomp,sum(mae3.mavats)
from hosvital.maeate mae 
inner join hosvital.maeate3 mae3 on (mae3.mpnfac=mae.mpnfac)
inner join hosvital.maepab m on (m.mpcodp=mae.faccodpab)
where mae.matipdoc='2' and mae.facfch >= '2019-05-01' and mae.facfch <= '2019-05-31'and mae.maestf  not in ('1','10')    and mae3.fcstpotrn='F' and mae3.maesanus <> 'S'   --and mae.mpnfac = 580379
group by  m.mpcodp,m.mpnomp
order by 1;


----------------------------------------------------
----------------------------------------------------
-- Query presupuesto para PABELLONES Cups  Servicio
---
----------------------------------------------------
----------------------------------------------------
select case when m.mpclapro = '1' then 'AMBULATORIO'    when m.mpclapro = '2' then 'HOSPITALIZACION'    when m.mpclapro = '3' then 'URGENCIAS'     when m.mpclapro = '5' then 'TRIAGE' end                ,sum(mae2.mavatp)
from hosvital.maeate mae 
inner join hosvital.maeate2 mae2 on (mae2.mpnfac=mae.mpnfac)
inner join hosvital.maepab m on (m.mpcodp=mae2.macodpab)
where mae.matipdoc='2' and mae.facfch >= '2019-05-01' and mae.facfch <= '2019-05-31'  and mae.maestf  not in ('1','10')    and mae2.fcptpotrn='F' and mae2.maesanup <> 'S'  --  and mae.mpnfac = 580379
group by m.mpclapro
order by 1;


----------------------------------------------------
----------------------------------------------------
-- Query presupuesto para BODEGAS Cums Servicio
----------------------------------------------------
----------------------------------------------------
select case when m.mpclapro = '1' then 'AMBULATORIO'    when m.mpclapro = '2' then 'HOSPITALIZACION'    when m.mpclapro = '3' then 'URGENCIAS'    when  m.mpclapro = '5' then 'TRIAGE' end                    ,sum(mae3.mavats)
from hosvital.maeate mae 
inner join hosvital.maeate3 mae3 on (mae3.mpnfac=mae.mpnfac)
inner join hosvital.maepab m on (m.mpcodp=mae.faccodpab)
where mae.matipdoc='2' and mae.facfch >= '2019-05-01' and mae.facfch <= '2019-05-31'and mae.maestf  not in ('1','10')    and mae3.fcstpotrn='F' and mae3.maesanus <> 'S'   --and mae.mpnfac = 580379
group by  m.mpclapro
order by 1;

