SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='FAD' AND MVCNRO = 1352 AND MVCNAT = 'D';  -- Son 91 facturas.-

SELECT * FROM HOSVITAL.DOCUCON WHERE DOCCOD='FAD';

SELECT * FROM HOSVITAL.ADMGLO01;

SELECT B.AGLREMNR, B.EMPRNIT, B.AGLREMFC,B.AGLRADFC, A.MPNFAC
 FROM
 HOSVITAL.ADMGLO11 A, HOSVITAL.ADMGLO01 B
WHERE A.AGLREMNR= B.AGLREMNR AND
A.MPNFAC  IN ( 278853         ,	279698         	,280912         	,286594         	,324153         	,324165         	,325308         	,326507         	,326850         	,326912         	,
327101         	,327106         	,353424         	,360419         	,361219         	,363373         	,364312         	,364799         	,365968         	,366372         	,366431         	,366531         	,367450         	,367968         	,
368080         	,368279         	,370383         	,265020         	,267000         	,268134         	,269127         	,269718         	,277798         	,283509         	,287989         	,289722         	,296885         	,297184         	,
302637         	,304602         	,305714         	,317473         	,325741         	,373665         	,373667         	,373691         	,375339         	,375491         	,375601         	,255966         	,260934         	,265510         	,
265754         	,267344         	,269136         	,283717         	,285283         	,292128         	,295043         	,299505         	,305542         	,305990         	,311237         	,313996         	,314548         	,352895         	,
355221         	,377364         	,377373         	,377925         	,378863         	,380676         	,381628         	,255802         	,256462         	,258669         	,261276         	,269098         	,269133         	,271541         	,
288381         	,294470         	,301238         	,305543         	,309300         	,352861         	,353414         	,380400         	,381493         	,382422         	,273404         	         	 ) AND
B.AGLRADFC >= '2019-07-01'
ORDER BY  A.AGLREMNR  ;
