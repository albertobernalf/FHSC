select MATotF,MATotS,MATotP,MAValS,MAVaAb,MAVAPU,* from MAEATE where MPNFac = 2394755

-- ESTABA 99088.00	27987.00	71101.00	96388.00	2700.00	2700,00

select SUM(mavats)
--select * 
from MAEATE3
where mpnfac = 2394755 and maesanus <> 'S'  -- 40724

select SUM(mavats1)
--select * 
from MAEATE3
where mpnfac = 2394755 and maesanus <> 'S'  AND FcSTpoTrn ='F' -- 40724


select SUM(mavatp)  -- 71101
--select * 
from MAEATE2
where mpnfac = 2394755 and maesanup <> 'S'  -- 40724

-- 111825

SELECT MSRESO,MAVaTS,MaVaTS1, --MASVLRSLV,
* FROM MAEATE3 where mpnfac = 2394755



select MATotF,MATotS,MATotP,MAValS,MAVaAb,MAVAPU,MaSalCXC,* from MAEATE where MPNFac = 2394755

begin transaction;
update MAEATE
set matotf= 94138 ,MATotS=23037,MAValS=91438,MASALCXC=91438
where mpnfac = 2394755

-- commit;

-- Veamos otra Factura

select MATotF,MATotS,MATotP,MAValS,MAVaAb,MAVAPU,MaSalCXC,* from MAEATE where MPNFac = 2394756

-- 698393.00	59693.00	638700.00	0.00	686792.00	686792,00	0.00

Select SUM(mavats)
--select * 
from MAEATE3
where mpnfac = 2394756 and maesanus <> 'S'  AND FcSTpoTrn ='F' -- 60351.00

SP_HELP MAEATE3


select SUM(mavatp)  -- 71101
--select * 
from MAEATE2
where mpnfac = 2394756 and maesanup <> 'S' AND FcSTPOTM ='F'  -- 693900.00

SELECT MSRESO,MAVaTS,MAVATS1,MaEsAnuS,-- MASVLRSLV,
* FROM MAEATE3 where mpnfac = 2394756

SELECT * FROM MAEATE3