select * from   hosvital.movconT2 where doccod='ASA' AND MVCNRO =12260281;

SELECT * FROM HOSVITAL.KARDEX1  
WHERE    DOCTIP='ASA' AND DOCNRO=12260281;

SELECT   * FROM  HOSVITAL.FRMSMNS WHERE  HISCKEY='2852579' AND HISCSEC=608;

SELECT  K.DOCTIP  TIPO,K.DOCNRO   NUMERO ,F.HISTIPDOC   TIPODOC,  F.HISCKEY DOCUMENTO, K.MOVFOLPAC FOLIO, C.MPNOMC PACIENTE,        F.FSMDSCMDC,K.MOVFCH FECHA
FROM HOSVITAL.KARDEX1  K
INNER JOIN HOSVITAL.FRMSMNS F ON (F.HISTIPDOC =K.MOVTIPDOC     AND F.HISCKEY = K.MOVCODPAC AND F.HISCSEC=K.MOVFOLPAC AND F.FSMMSRESO  = K.MSRESO )
INNER JOIN HOSVITAL.CAPBAS C ON (C.MPTDOC = F.HISTIPDOC AND C.MPCEDU = F.HISCKEY)
WHERE  K.DOCTIP='ASA' AND K.DOCNRO=12260281;