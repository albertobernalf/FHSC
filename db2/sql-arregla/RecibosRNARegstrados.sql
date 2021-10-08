SELECT *
from hosvital.movban
where doccod='RNA' and mvbnrocmp IN (  6586, 6684);

update  hosvital.movban  -- estaban en N, R
set mvbdet='S', mvbact='S'
where doccod='RNA' and mvbnrocmp IN  (  6586, 6684) and mvbact='R';

