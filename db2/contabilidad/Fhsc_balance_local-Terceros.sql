select c.cntcod cuenta,c.cntdsc descripcion_cuenta,sum((select sum(case when substring(cc.cntcod,1,1)='1'and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='1' and cc.cntnat='C' then -r.rsmsalant when substring(cc.cntcod,1,1)='2' and cc.cntnat='C' then r.rsmsalant when substring(cc.cntcod,1,1)='2' and cc.cntnat='D' then -r.rsmsalant when substring(cc.cntcod,1,1)='3' and cc.cntnat='C' then r.rsmsalant when substring(cc.cntcod,1,1)='3' and cc.cntnat='D' then -r.rsmsalant when substring(cc.cntcod,1,1)='4' and cc.cntnat='C' then r.rsmsalant when substring(cc.cntcod,1,1)='4' and cc.cntnat='D' then -r.rsmsalant when substring(cc.cntcod,1,1)='5' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='5' and cc.cntnat='C' then -r.rsmsalant when substring(cc.cntcod,1,1)='6' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='6' and cc.cntnat='C' then -r.rsmsalant   when substring(cc.cntcod,1,1)='7' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='7' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='8' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='8' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='9'and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='9' and cc.cntnat='C' then -r.rsmsalant  END) as saldo_actual from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring(r.rsmctncon,1,8)=substring(cc.cntcod,1,8) and substring(r.rsmctncon,1,1)= substring(cc.cntcod,1,1) and substring (r.rsmctncon,1,1)= substring(c.cntcod,1,1)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=5 and substring (cc.cntcod,1,1)=substring(c.cntcod,1,1))) as saldo_Aterior,sum((select sum((r.rsmdeb)) from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring(r.rsmctncon,1,8)=substring(cc.cntcod,1,8) and substring(r.rsmctncon,1,1)=substring(cc.cntcod,1,1) and substring (r.rsmctncon,1,1)=substring(c.cntcod,1,1)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=5 and substring (cc.cntcod,1,1)=substring(c.cntcod,1,1))) as Debitos,sum((select sum((r.rsmcre)) from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring (r.rsmctncon,1,8)=substring(cc.cntcod,1,8) and substring(r.rsmctncon,1,1)= substring(cc.cntcod,1,1) and substring(r.rsmctncon,1,1)= substring(c.cntcod,1,1)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=5 and substring(cc.cntcod,1,1)=substring (c.cntcod,1,1))) as Creditos,sum((select sum(case when substring(cc.cntcod,1,1)='1' And cc.cntnat='D' then r.rsmsalact when substring (cc.cntcod,1,1)='1' and cc.cntnat='C' then -r.rsmsalact when substring(cc.cntcod,1,1)='2' and cc.cntnat='C' then r.rsmsalact when substring (cc.cntcod,1,1)='2' and cc.cntnat='D' then -r.rsmsalact when substring(cc.cntcod,1,1)='3' and cc.cntnat='C' then r.rsmsalact when substring (cc.cntcod,1,1)='3' and cc.cntnat='D' then -r.rsmsalact when substring(cc.cntcod,1,1)='4' and cc.cntnat='C' then r.rsmsalact when substring (cc.cntcod,1,1)='4' and cc.cntnat='D' then -r.rsmsalact when substring(cc.cntcod,1,1)='5' and cc.cntnat='D' then r.rsmsalact when substring (cc.cntcod,1,1)='5' and cc.cntnat='C' then -r.rsmsalact when substring(cc.cntcod,1,1)='6' and cc.cntnat='D' then r.rsmsalact when substring (cc.cntcod,1,1)='6' and cc.cntnat='C' then -r.rsmsalact  when substring(cc.cntcod,1,1)='7' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='7' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='8' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='8' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='9'and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='9' and cc.cntnat='C' then -r.rsmsalant   END) as saldo_actual from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring (r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and substring(r.rsmctncon,1,1)= substring(cc.cntcod,1,1) And substring(r.rsmctncon,1,1)= substring(c.cntcod,1,1)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=5 and substring(cc.cntcod,1,1)=substring (c.cntcod,1,1))) as saldo_actual from hosvital.cuentas c where c.empcod='01' and c.cntvig=2019 and substring(c.cntcod,1,1)>='0' AND c.cntnvl=1 group by c.cntcod,c.cntdsc 



union 


select c.cntcod cuenta,c.cntdsc descripcion_cuenta, sum((select sum(case when substring (cc.cntcod,1,1)='1' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='1' and cc.cntnat='C' then -r.rsmsalant when substring (cc.cntcod,1,1)='2' and cc.cntnat='C' then r.rsmsalant when substring(cc.cntcod,1,1)='2' and cc.cntnat='D' then - r.rsmsalant when substring (cc.cntcod,1,1)='3' and cc.cntnat='C' then r.rsmsalant when substring(cc.cntcod,1,1)='3' and cc.cntnat='D' then -r.rsmsalant when substring (cc.cntcod,1,1)='4' and cc.cntnat='C' then r.rsmsalant when substring(cc.cntcod,1,1)='4' and cc.cntnat='D' then -r.rsmsalant when substring (cc.cntcod,1,1)='5' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='5' and cc.cntnat='C' then -r.rsmsalant when substring (cc.cntcod,1,1)='6' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='6' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='7' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='7' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='8' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='8' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='9'and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='9' and cc.cntnat='C' then -r.rsmsalant   END) as saldo_actual from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring(r.rsmctncon,1,4)= substring(cc.cntcod,1,4) and substring (r.rsmctncon,1,2)=substring(cc.cntcod,1,2) and substring(r.rsmctncon,1,2)= substring(c.cntcod,1,2)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=3 and substring(cc.cntcod,1,2) = substring(c.cntcod,1,2))) as saldo_Anterior ,sum((select sum ((r.rsmdeb)) from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring(r.rsmctncon,1,4)=substring(cc.cntcod,1,4) and substring (r.rsmctncon,1,2)= substring(cc.cntcod,1,2) and substring(r.rsmctncon,1,2)= substring(c.cntcod,1,2)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=3 and substring(cc.cntcod,1,2)=substring(c.cntcod,1,2))) as Debitos ,sum((select sum((r.rsmcre)) from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring(r.rsmctncon,1,4)=substring(cc.cntcod,1,4) and substring(r.rsmctncon,1,2)= substring (cc.cntcod,1,2) and substring(r.rsmctncon,1,2)= substring(c.cntcod,1,2)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=3 and substring(cc.cntcod,1,2) = substring(c.cntcod,1,2))) as Creditos ,sum((select sum(case when substring(cc.cntcod,1,1)='1' and cc.cntnat='D' then r.rsmsalact when substring(cc.cntcod,1,1)='1' and cc.cntnat='C' then -r.rsmsalact when substring(cc.cntcod,1,1)='2' and cc.cntnat='C' then r.rsmsalact when substring(cc.cntcod,1,1)='2' and cc.cntnat='D' then -r.rsmsalact when substring(cc.cntcod,1,1)='3' and cc.cntnat='C' then r.rsmsalact when substring(cc.cntcod,1,1)='3' and cc.cntnat='D' then -r.rsmsalact when substring(cc.cntcod,1,1)='4' and cc.cntnat='C' then r.rsmsalact when substring(cc.cntcod,1,1)='4' and cc.cntnat='D' then -r.rsmsalact when substring(cc.cntcod,1,1)='5' and cc.cntnat='D' then r.rsmsalact when substring(cc.cntcod,1,1)='5' and cc.cntnat='C' then -r.rsmsalact when substring(cc.cntcod,1,1)='6' and cc.cntnat='D' then r.rsmsalact when substring(cc.cntcod,1,1)='6' and cc.cntnat='C' then -r.rsmsalact  when substring(cc.cntcod,1,1)='7' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='7' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='8' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='8' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='9'and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='9' and cc.cntnat='C' then -r.rsmsalant   END) as saldo_actual from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring(r.rsmctncon,1,4)= substring(cc.cntcod,1,4) and substring(r.rsmctncon,1,2)= substring (cc.cntcod,1,2) and substring(r.rsmctncon,1,2)= substring(c.cntcod,1,2)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=3 and substring(cc.cntcod,1,2)=substring(c.cntcod,1,2))) as saldo_actual from hosvital.cuentas c where c.empcod='01' and c.cntvig=2019 and substring(c.cntcod,1,2)>='00' AND c.cntnvl=2 group by c.cntcod,c.cntdsc union select c.cntcod cuenta,c.cntdsc descripcion_cuenta, sum((select sum(case when substring(cc.cntcod,1,1)='1' and cc.cntnat='D' then r.rsmsalant when substring (cc.cntcod,1,1)='1' and cc.cntnat='C' then -r.rsmsalant when substring(cc.cntcod,1,1)='2' and cc.cntnat='C' then r.rsmsalant when substring (cc.cntcod,1,1)='2' and cc.cntnat='D' then -r.rsmsalant when substring(cc.cntcod,1,1)='3' and cc.cntnat='C' then r.rsmsalant when substring (cc.cntcod,1,1)='3' and cc.cntnat='D' then -r.rsmsalant when substring(cc.cntcod,1,1)='4' and cc.cntnat='C' then r.rsmsalant when substring (cc.cntcod,1,1)='4' and cc.cntnat='D' then -r.rsmsalant when substring(cc.cntcod,1,1)='5' and cc.cntnat='D' then r.rsmsalant when substring (cc.cntcod,1,1)='5' and cc.cntnat='C' then -r.rsmsalant when substring(cc.cntcod,1,1)='6' and cc.cntnat='D' then r.rsmsalant when substring (cc.cntcod,1,1)='6' and cc.cntnat='C' then -r.rsmsalant   when substring(cc.cntcod,1,1)='7' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='7' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='8' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='8' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='9'and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='9' and cc.cntnat='C' then -r.rsmsalant   END) as saldo_actual from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring (r.rsmctncon,1,6)= substring(cc.cntcod,1,6) and substring(r.rsmctncon,1,4)=substring(cc.cntcod,1,4) and substring(r.rsmctncon,1,4)= substring(c.cntcod,1,4)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=4 and substring(cc.cntcod,1,4)=substring (c.cntcod,1,4) )) as saldo_Anterior ,sum((select sum((r.rsmdeb)) from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring (r.rsmctncon,1,6)= substring(cc.cntcod,1,6) and substring(r.rsmctncon,1,4)= substring(cc.cntcod,1,4) and substring(r.rsmctncon,1,4)= substring(c.cntcod,1,4)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=4 and substring(cc.cntcod,1,4) = substring (c.cntcod,1,4))) as Debitos ,sum((select sum((r.rsmcre)) from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring (r.rsmctncon,1,6)= substring(cc.cntcod,1,6) and substring(r.rsmctncon,1,4)= substring(cc.cntcod,1,4) and substring(r.rsmctncon,1,4)= substring(c.cntcod,1,4)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=4 and substring(cc.cntcod,1,4) = substring (c.cntcod,1,4))) as Creditos ,sum((select sum(case when substring(cc.cntcod,1,1)='1' and cc.cntnat='D' then r.rsmsalact when substring (cc.cntcod,1,1)='1' and cc.cntnat='C' then -r.rsmsalact when substring(cc.cntcod,1,1)='2' and cc.cntnat='C' then r.rsmsalact when substring (cc.cntcod,1,1)='2' and cc.cntnat='D' then -r.rsmsalact when substring(cc.cntcod,1,1)='3' and cc.cntnat='C' then r.rsmsalact when substring (cc.cntcod,1,1)='3' and cc.cntnat='D' then -r.rsmsalact when substring(cc.cntcod,1,1)='4' and cc.cntnat='C' then r.rsmsalact when substring (cc.cntcod,1,1)='4' and cc.cntnat='D' then -r.rsmsalact when substring(cc.cntcod,1,1)='5' and cc.cntnat='D' then r.rsmsalact when substring (cc.cntcod,1,1)='5' and cc.cntnat='C' then -r.rsmsalact when substring(cc.cntcod,1,1)='6' and cc.cntnat='D' then r.rsmsalact when substring (cc.cntcod,1,1)='6' and cc.cntnat='C' then -r.rsmsalact  when substring(cc.cntcod,1,1)='7' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='7' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='8' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='8' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='9'and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='9' and cc.cntnat='C' then -r.rsmsalant    END) as saldo_actual from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring (r.rsmctncon,1,6)= substring(cc.cntcod,1,6) and substring(r.rsmctncon,1,4)= substring(cc.cntcod,1,4) and substring(r.rsmctncon,1,4)= substring(c.cntcod,1,4)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=4 and substring(cc.cntcod,1,4) = substring (c.cntcod,1,4))) as saldo_actual from hosvital.cuentas c where c.empcod='01' and c.cntvig=2019 and substring(c.cntcod,1,4)>='000' AND c.cntnvl=3 group by c.cntcod,c.cntdsc union select c.cntcod cuenta,c.cntdsc descripcion_cuenta, sum((select sum(case when substring (cc.cntcod,1,1)='1' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='1' and cc.cntnat='C' then -r.rsmsalant when substring (cc.cntcod,1,1)='2' and cc.cntnat='C' then r.rsmsalant when substring(cc.cntcod,1,1)='2' and cc.cntnat='D' then -r.rsmsalant when substring (cc.cntcod,1,1)='3' and cc.cntnat='C' then r.rsmsalant when substring(cc.cntcod,1,1)='3' and cc.cntnat='D' then -r.rsmsalant when substring (cc.cntcod,1,1)='4' and cc.cntnat='C' then r.rsmsalant when substring(cc.cntcod,1,1)='4' and cc.cntnat='D' then -r.rsmsalant when substring (cc.cntcod,1,1)='5' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='5' and cc.cntnat='C' then -r.rsmsalant when substring (cc.cntcod,1,1)='6' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='6' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='7' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='7' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='8' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='8' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='9'and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='9' and cc.cntnat='C' then -r.rsmsalant   END) as saldo_actual from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and substring (r.rsmctncon,1,6)= substring(cc.cntcod,1,6) and substring(r.rsmctncon,1,6)= substring(c.cntcod,1,6)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=5 and substring(cc.cntcod,1,6) = substring(c.cntcod,1,6))) as saldo_Aterior ,sum((select sum ((r.rsmdeb)) from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and substring (r.rsmctncon,1,6)= substring(cc.cntcod,1,6) and substring(r.rsmctncon,1,6)= substring(c.cntcod,1,6)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=5 and substring(cc.cntcod,1,6)= substring(c.cntcod,1,6))) as Debitos ,sum((select sum((r.rsmcre)) from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and substring(r.rsmctncon,1,6)= substring (cc.cntcod,1,6) and substring(r.rsmctncon,1,6)= substring(c.cntcod,1,6)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=5 and substring(cc.cntcod,1,6)= substring(c.cntcod,1,6))) as Creditos ,sum((select sum(case when substring(cc.cntcod,1,1)='1' and cc.cntnat='D' then r.rsmsalact when substring(cc.cntcod,1,1)='1' and cc.cntnat='C' then -r.rsmsalact when substring(cc.cntcod,1,1)='2' and cc.cntnat='C' then r.rsmsalact when substring(cc.cntcod,1,1)='2' and cc.cntnat='D' then -r.rsmsalact when substring(cc.cntcod,1,1)='3' and cc.cntnat='C' then r.rsmsalact when substring(cc.cntcod,1,1)='3' and cc.cntnat='D' then -r.rsmsalact when substring(cc.cntcod,1,1)='4' and cc.cntnat='C' then r.rsmsalact when substring(cc.cntcod,1,1)='4' and cc.cntnat='D' then -r.rsmsalact when substring(cc.cntcod,1,1)='5' and cc.cntnat='D' then r.rsmsalact when substring(cc.cntcod,1,1)='5' and cc.cntnat='C' then -r.rsmsalact when substring(cc.cntcod,1,1)='6' and cc.cntnat='D' then r.rsmsalact when substring(cc.cntcod,1,1)='6' and cc.cntnat='C' then -r.rsmsalact  when substring(cc.cntcod,1,1)='7' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='7' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='8' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='8' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='9'and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='9' and cc.cntnat='C' then -r.rsmsalant   END) as saldo_actual from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and substring(r.rsmctncon,1,6)= substring (cc.cntcod,1,6) and substring(r.rsmctncon,1,6)= substring(c.cntcod,1,6)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=5 and substring(cc.cntcod,1,6) = substring(c.cntcod,1,6))) as saldo_actual from hosvital.cuentas c where c.empcod='01' and c.cntvig=2019 and substring(c.cntcod,1,6)>='000000' AND c.cntnvl=4 group by c.cntcod,c.cntdsc union select c.cntcod  cuenta,c.cntdsc descripcion_cuenta,sum((select sum(case when substring(cc.cntcod,1,1)='1' and cc.cntnat='D' then r.rsmsalant when substring (cc.cntcod,1,1)='1' and cc.cntnat='C' then -r.rsmsalant when substring(cc.cntcod,1,1)='2' and cc.cntnat='C' then r.rsmsalant when substring (cc.cntcod,1,1)='2' and cc.cntnat='D' then -r.rsmsalant when substring(cc.cntcod,1,1)='3' and cc.cntnat='C' then r.rsmsalant when substring (cc.cntcod,1,1)='3' and cc.cntnat='D' then -r.rsmsalant when substring(cc.cntcod,1,1)='4' and cc.cntnat='C' then r.rsmsalant when substring (cc.cntcod,1,1)='4' and cc.cntnat='D' then -r.rsmsalant when substring(cc.cntcod,1,1)='5' and cc.cntnat='D' then r.rsmsalant when substring (cc.cntcod,1,1)='5' and cc.cntnat='C' then -r.rsmsalant when substring(cc.cntcod,1,1)='6' and cc.cntnat='D' then r.rsmsalant when substring (cc.cntcod,1,1)='6' and cc.cntnat='C' then -r.rsmsalant   when substring(cc.cntcod,1,1)='7' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='7' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='8' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='8' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='9'and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='9' and cc.cntnat='C' then -r.rsmsalant   END) as saldo_actual from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring (r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and substring (r.rsmctncon,1,8)= substring(c.cntcod,1,8)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=5 and substring (cc.cntcod,1,8) = substring (c.cntcod,1,8))) as saldo_Aterior ,sum((select sum((r.rsmdeb)) from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring (r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and substring (r.rsmctncon,1,8)= substring(c.cntcod,1,8)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=5 and substring (cc.cntcod,1,8) = substring (c.cntcod,1,8))) as Debitos ,sum((select sum((r.rsmcre)) from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring (r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and substring(r.rsmctncon,1,8)= substring(c.cntcod,1,8)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=5 and substring(cc.cntcod,1,8) = substring (c.cntcod,1,8))) as Creditos,sum((select sum(case when substring(cc.cntcod,1,1)='1' and cc.cntnat='D' then r.rsmsalact when substring (cc.cntcod,1,1)='1' and cc.cntnat='C' then -r.rsmsalact when substring(cc.cntcod,1,1)='2' and cc.cntnat='C' then r.rsmsalact when substring (cc.cntcod,1,1)='2' and cc.cntnat='D' then -r.rsmsalact when substring(cc.cntcod,1,1)='3' and cc.cntnat='C' then r.rsmsalact when substring (cc.cntcod,1,1)='3' and cc.cntnat='D' then -r.rsmsalact when substring(cc.cntcod,1,1)='4' and cc.cntnat='C' then r.rsmsalact when substring (cc.cntcod,1,1)='4' and cc.cntnat='D' then -r.rsmsalact when substring(cc.cntcod,1,1)='5' and cc.cntnat='D' then r.rsmsalact when substring (cc.cntcod,1,1)='5' and cc.cntnat='C' then -r.rsmsalact when substring(cc.cntcod,1,1)='6' and cc.cntnat='D' then r.rsmsalact when substring (cc.cntcod,1,1)='6' and cc.cntnat='C' then -r.rsmsalact  when substring(cc.cntcod,1,1)='7' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='7' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='8' and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,7)='8' and cc.cntnat='C' then -r.rsmsalant  when substring(cc.cntcod,1,1)='9'and cc.cntnat='D' then r.rsmsalant when substring(cc.cntcod,1,1)='9' and cc.cntnat='C' then -r.rsmsalant    END) as saldo_actual from hosvital.cuentas cc inner join hosvital.resmcue r on (r.rsmempcod=c.empcod and r.rsmempcod=cc.empcod and r.rsmano=2019 and r.rsmmes>=10 and r.rsmmes<=10 and substring (r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and substring(r.rsmctncon,1,8)= substring(cc.cntcod,1,8) and substring(r.rsmctncon,1,8)= substring(c.cntcod,1,8)) where cc.empcod=c.empcod and cc.cntvig=c.cntvig AND cc.cntnvl=5 and substring(cc.cntcod,1,8) = substring (c.cntcod,1,8))) as saldo_actual 
from hosvital.cuentas c where c.empcod='01' and c.cntvig=2019 and substring(c.cntcod,1,8)>='000000' AND c.cntnvl=5  
group by c.cntcod ,c.cntdsc  
union
select -- case when t.trccod = ''  then  c.cntcod||' '||r.trccod  else c.cntcod||' '||t.trccod end ,case when t.trcrazsoc ='' then '' else    t.trcrazsoc end     
c.cntcod||' '||t.trccod , t.trcrazsoc ,SUM(r.rsmsalant),SUM(r.rsmdeb),SUM(r.rsmcre),SUM(r.rsmsalact)
from hosvital.resmcue r 
right join hosvital.terceros t on (t.trccod =  r.trccod)
inner join hosvital.cuentas c on (c.empcod='01' and c.cntvig=2019 and substring(c.cntcod,1,8)>='000000' AND c.cntnvl=5)
where   R.RSMEMPCOD='01' AND r.rsmano=2019 and r.rsmmes=10 and c.cntcod= r.rsmctncon 
GROUP BY  c.cntcod||' '||t.trccod,t.trcrazsoc
-- GROUP BY  case when t.trccod  = ''  then  c.cntcod||' '||r.trccod       else c.cntcod||' '||t.trccod end ,case when t.trcrazsoc ='' then '' else    t.trcrazsoc end 
HAVING (SUM(r.rsmsalant) <> 0.00  or sum( r.rsmdeb) <> 0.00  or sum(r.rsmcre) <> 0.00  or  sum( r.rsmsalact) <> 0.00)
order by 1;

select * from hosvital.resmcue; -- rsmdeb/rsmdeb      rsmcre/rsmcre   rsmsalant/ rsmsalant rsmsalact/rsmsalact
select * from hosvital.resmcue;



select t.trccod,t.trcrazsoc ,r.rsmsalant, r.rsmdeb,r.rsmcre,r.rsmsalact
from hosvital.resmcue r , hosvital.terceros t
where   r.rsmano=2019 and r.rsmmes=10 and r.rsmctncon= '11050501'  and r.trccod= t.trccod
order by t.trccod;



select t.trccod,t.trcrazsoc ,r.rsmsalant, r.rsmdeb,r.rsmcre,r.rsmsalact
from hosvital.resmcue r , hosvital.terceros t, hosvital.cuentas c
where  c.empcod='01' and c.cntvig=2019 and substring(c.cntcod,1,8)>='000000' AND c.cntnvl=5  and r.rsmano=2019 and r.rsmmes=10 and c.cntcod= r.rsmctncon and r.trccod= t.trccod
order by t.trccod;

select * from hosvital.resmcue where rsmano=2019 and rsmmes=10 and trccod='1001052892';

select * from hosvital.resmcue where  RSMEMPCOD='01' AND rsmano=2019 and rsmmes=10 and RSMCTNCON ='94201501' ORDER BY TRCCOD;
select * from hosvital.terceros where trccod= '1001052892';
-- 40036864
--41400648
--51553116

-- 94201501             11292689       

--

SELECT * FROM HOSVITAL.TERCEROS WHERE TRCCOD IN ('11292689','40036864');

SELECT * FROM HOSVITAL.TERCEROS WHERE TRCnit like  ('%1019095670%');
SELECT * FROM HOSVITAL.TERCEROS WHERE TRCcod  like  ('%1019095670%');

select * from hosvital.resmcue where rsmano=2019 and rsmmes=10 and trccod='1019095670';
