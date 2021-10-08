SELECT * FROM HOSVITAL.HCCOM51  where  hcfchrord >= '2019-10-05 00:00:00' order by histipdoc,hisckey,hiscsec;
SELECT * FROM HOSVITAL.HCCOM5 where hisckey= '1000685417' and hiscsec = 374;   -- 893812   	
SELECT * FROM HOSVITAL.HCCOM51 where hisckey= '1000685417' and hiscsec = 374; 


SELECT * FROM HOSVITAL.HCCOM1 WHERE HISFHORAT >= '2019-10-01 00:00:00';

SELECT * FROM HOSVITAL.MAEATE2;


select mae.prcodi as cod_proced, mae.prnomb as descripcion,h51.hcfchrord as fecha_procedimiento,
case when h51.hcprcest= 'O' then 'Ordenado' when h51.hcprcest= 'N' then 'Anulado' when h51.hcprcest= 'E' then 'En tramite' when h51.hcprcest= 'A' then 'Aplicado' when h51.hcprcest= 'X' then 'resultado externo' when h51.hcprcest= 'I' then 'Interpretado' end estado ,i.mpcodp as cod_pabellon, maepab.mpnomp as pabellon

from hosvital.ingresos i
inner join hosvital.hccom51 h51 on (h51.histipdoc=i.mptdoc and h51.hisckey=i.mpcedu and h51.hctvin51= i.ingcsc)
inner join hosvital.maepro mae on (mae.prcodi= h51.hcprccod)
inner join hosvital.maepab maepab on (maepab.mpcodp=i.mpcodp )
where h51.hcfchrord >='2019-10-01 00:00:00' and h51.hcprccod in ('931001','939403','933601','890610','937000','937201','937202','937203','937400','893703','893805','903839','903062','903110','893812','938303','939402','939401','890410','890411','890413','890412','937200') 
order by h51.hcfchrord