select * from hosvital.kardex1 where movfch >= '2020-12-20 00:00:00' and movcodpac='17324095';

/*

CÓDIGO 0060HM01 GUIA FLOPPY 0.014 GASTADA 1 REF: TW-AS418FA
CÓDIGO  0006HM01 INTRODUCTOR FEMORAL 6 FR REF RS*R60N10MQ CANTIDAD 1.
*/
select K.BODEGA,K.MSRESO,M.MSNOMG,K.DOCNRO,K.MOVFCH,K.MOVCNT,K.MOVBOD,K.MOVFOLPAC
from hosvital.kardex1 k
inner join hosvital.maesum1 m ON (M.msreso=k.msreso)
where  k.movfch >= '2020-12-23 00:00:00'  and k.doctip='ASA' and k.movfch <= '2020-12-23 23:59:59'  AND K.movcodpac='17324095'
ORDER BY K.MOVFCH;

select K.TRANCOD, K.BODEGA,K.MSRESO,M.MSNOMG,K.DOCNRO,K.MOVFCH,K.MOVCNT,K.MOVBOD,K.MOVFOLPAC
from hosvital.kardex1 k
inner join hosvital.maesum1 m ON (M.msreso=k.msreso)
where  k.movfch >= '2020-12-23 00:00:00'  and k.doctip='ASA' and k.movfch <= '2020-12-23 23:59:59'  AND K.movcodpac='17324095' 
ORDER BY K.MOVFCH,K.DOCNRO; -- 12455733	SALICONS

select * from hosvital.tmpfac2 where tfcedu = '17324095' and tfreso in (select k.msreso from hosvital.kardex1 k
						inner join hosvital.maesum1 m ON (M.msreso=k.msreso)
					where  k.movfch >= '2020-12-23 00:00:00'  and k.doctip='ASA' and k.movfch = '2020-12-23 08:47:28.0000'  AND K.movcodpac='17324095'  );

select * from hosvital.movinv4 where doccod='ASA' AND DOCNRO = 12455733	;
select * from hosvital.movinv3 where doccod='ASA' AND DOCNRO = 12455733	;

SELECT M3.TRANCOD,M3.TRANAPL,M4.DOCCOD,M4.DOCNRO,M4.MSRESO,M4.FCHMVT,M4.MVTOES,M4.MVTOCNT,M4.MVTOFOLPA
FROM HOSVITAL.MOVINV4 M4
INNER JOIN HOSVITAL.MOVINV3 M3 ON (M3.DOCCOD=M4.DOCCOD AND M3.DOCNRO=M4.DOCNRO)
WHERE M4.FCHMVT>='2020-12-23 00:00:00' AND M4.doccod='ASA' AND  M4.MVTODOCPAC='17324095'
ORDER BY M4.DOCNRO	;

-- Consecutivos

SELECT TRANCOD,DOCTIP,DOCNRO,movcodpac
FROM HOSVITAL.KARDEX1
WHERE movfch >= '2020-12-23 00:00:00'  and doctip='ASA'  and movfch <= '2020-12-23 23:59:59' 
order by docnro;
