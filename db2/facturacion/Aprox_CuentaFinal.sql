SELECT * FROM HOSVITAL.TMPFAC  WHERE TFCEDU = '139900';
select * from hosvital.tmpfac1;

select tfcedu,tftdoc,tmctving,tfcscp, tfprc1,tfuvrcod, tfcanpr,  tfinte,  tfvatp, tfvlrtot, round(tfvlrtot) from hosvital.tmpfac1 where tftdoc='CC' and tfcedu= '139900' and tfptpotrn='F' and tfestaanu1='N' ;

select  tfcedu,tftdoc,tmctving,tfcscp, tfprc1,tfuvrcod, tfcanpr,  tfinte, tfvatp, round (tfinte) ,  tfvlrtot from  hosvital.tmpfac1 a where a.tftdoc='CC' and a.tfcedu= '139900' and a.tmctving= 16 and  a.tfptpotrn='F' and a.tfestaanu1='N' and a.tfprc1 in (select b.tfprc1 from  hosvital.tmpfac1 b where b.tftdoc = a.tftdoc and b.tfcedu=a.tfcedu and b.tmctving=a.tmctving and mod(b.tfinte, 1) <> 0);
-- 22160835

-- Query Actualiza en la maeate2 el DECIMAL. Anoto el procedimiento

update hosvital.tmpfac1
set tfinte = round(tfinte),  tfvatp = round(tfvatp)
 where tftdoc='TI' and tfcedu= '22160835' and tmctving= 16 and  mod(tfinte, 1) <> 0; 

--Actualiza el total del procedimiento:

update hosvital.tmpfac1 a
set tfvlrtot  = (select  sum(b.tfinte * b.tfcanpr) from hosvital.tmpfac1 b where  b.tftdoc = a.tftdoc and b.tfcedu=a.tfcedu and b.tmctving=a.tmctving and b.tfprc1= a.tfprc1 and  a.tfptpotrn='F' and a.tfestaanu1='N' and  a.tfcscp in (197,198,199,200))
where a.tftdoc='TI' and a.tfcedu= '22160835' and a.tmctving= 16  and a.tfprc1 = '314201'  and  a.tfptpotrn='F' and a.tfestaanu1='N' and  a.tfcscp in (197,198,199,200);

-- validacion proced y suministros

select  * from hosvital.tmpfac1 where  tftdoc='TI' and tfcedu= '22160835' and tmctving= 16 and tfptpotrn='F' and tfestaanu1 <>'S'	; 						

select  * from hosvital.tmpfac2 where  tftdoc='TI' and tfcedu= '22160835' and tmctving= 16    and tfstpotrn='F' and tfestaanu2 <>'S'	; 
	

-- Aqui seria bueno poner la rutina para corregir decimales en la Prefactura de suministros:


select * from hosvital.tmpfac2;

select tfcedu,tftdoc,tmctving,tfcscs, tfreso, tfcans,  tfvalu,  tfvats, round(tfvalu) from hosvital.tmpfac2 where tftdoc='TI' and tfcedu= '22160835' and tfstpotrn='F' and tfestaanu2='N' ;

select  tfcedu,tftdoc,tmctving,tfcscs, tfreso, tfcans,  tfvalu, tfvats, round (tfvalu)  from  hosvital.tmpfac2 a where a.tftdoc='TI' and a.tfcedu= '22160835' and a.tmctving= 16 and  a. tfstpotrn='F' and a.tfestaanu2='N' and a.tfreso in (select b.tfreso from  hosvital.tmpfac2 b where b.tftdoc = a.tftdoc and b.tfcedu=a.tfcedu and b.tmctving=a.tmctving and mod(b.tfvalu, 1) <> 0);
-- 22160835

-- Query Actualiza en la maeate2 el DECIMAL. Anoto el procedimiento

update hosvital.tmpfac2
set tfvalu = round(tfvalu),  tfvats = round(tfvats)
 where tftdoc='TI' and tfcedu= '22160835' and tmctving= 16 and  mod(tfvalu, 1) <> 0; 

--Actualiza el total del procedimiento:

update hosvital.tmpfac2 a
set tfvats  = (select  sum(b.tfvalu * b.tfcans) from hosvital.tmpfac2 b where  b.tftdoc = a.tftdoc and b.tfcedu=a.tfcedu and b.tmctving=a.tmctving and b.tfreso= a.tfreso and  a. tfstpotrn='F' and a.tfestaanu2='N'  and  a.tfcscs in (197,198,199,200))
where a.tftdoc='TI' and a.tfcedu= '22160835' and a.tmctving= 16  and a.tfreso = '314201'  and  a. tfstpotrn='F' and a.tfestaanu2='N'  and  a.tfcscs in (197,198,199,200);



