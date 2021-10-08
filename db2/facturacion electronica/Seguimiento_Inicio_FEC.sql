
select matipdoc,mpnfac,  facfch,matotf, matotp, matots, masalcxc from hosvital.maeate  where facfch >= '2020-07-28' and  facfch <= '2020-07-29' order by mpnfac;
select matipdoc,mpnfac,  facfch,matotf, matotp, matots, masalcxc from hosvital.maeate  where facfch >= '2020-07-29' order by mpnfac ;

select * from hosvital.ressev where resfec >= '2020-07-01 00:00:00' order by resfec,restip,resnum;